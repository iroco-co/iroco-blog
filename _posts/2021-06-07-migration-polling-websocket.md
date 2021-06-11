---
layout: post
title: L'événementiel c'est écologique
author:
  display_name: Bruno Thomas
tags:
- javascript
- refactoring
- greenIT
comments: true
---

*article initialement publié sur [barre verte](https://barreverte.fr) le 30 décembre 2016*

Pour faire suite à une mini série sur l'[écoconception](https://www.greenit.fr/categorie/logiciels/), je voulais partager un remaniement récent de transformation d'un polling web en push serveur (avec une websocket), et les conséquences en terme d'utilisation de bande passante.

Dans le projet sur lequel je travaille actuellement, nous intégrons le mail dans un site web. Nous montrons par exemple à l'utilisateur s'il a reçu de nouveaux emails. Le plus simple, au départ a été de faire du polling (requêtes régulières vers le serveur) avec un [setInterval](http://www.w3schools.com/jsref/met_win_setinterval.asp) :

````javascript
setInterval(function () {
  $.get('new_mails', function(data) {
    update_ui(data);
  })
}, mail_poll_period_second);

````

Côté serveur, dès qu'un utilisateur se connecte, un client IMAP est créé et va aussi faire du polling sur la boite de réception. Ca fonctionne, mais il y a au moins deux problèmes :

- si un utilisateur est connecté toute la journée, et qu'il ne reçoit aucun message, l'application est sollicitée, le réseau également, pour rien
- l'expérience utilisateur est dégradée par le temps de polling : comme nous avons positionné ce temps à 30 secondes, au pire il devra attendre une minute pour être notifié d'un nouveau message. Dans l'absolu c'est pas beaucoup, mais nous nous sommes habitués à une certaine immédiateté. Ce délais peut par exemple nuire à l'image qu'on se fait d'une application

### Passer en événementiel

Pour en apprendre un peu plus sur le sujet, nous avons fait un [spike](http://www.extremeprogramming.org/rules/spike.html) afin de valider l'intérêt d'une solution événementielle.

- côté serveur, nous utilisons l'[instruction IDLE](https://tools.ietf.org/html/rfc2177) de l'IMAP4 et nous programmons le batch de récupération de mail en [python asynchrone](https://docs.python.org/3/library/asyncio.html) pour que le serveur se mette au repos lorsque rien ne se passe sur la connexion IMAP. Pour la partie web, nous utilisons un worker [gaiohttp](http://docs.gunicorn.org/en/stable/design.html#asyncio-workers) de [green unicorn](http://gunicorn.org/) en passant par [aiohttp](https://aiohttp.readthedocs.io/en/stable/). En effet cela permet d'utiliser une application [pyramid](https://trypyramid.com/) en mode asynchrone. Comme le reste du projet utilise pyramid pour le web, nous contrôlons l'authentification par le même token, c'est pratique, et on ne change pas de techno. Enfin, ce sont des projets opensource reconnus qui se basent sur la couche asynchrone native de python ([asyncio](https://docs.python.org/3/library/asyncio.html)) contrairement à [twisted](https://twistedmatrix.com/) ou [tornado](http://www.tornadoweb.org) ;
- pour le front web, nous configurons nginx comme un [proxy websocket](https://www.nginx.com/blog/websocket-nginx/) qui jouera un role de *load balancing* et de *reverse proxy*
- côté client, nous mettons en place une websocket

````javascript
var websocket = new WebSocket('wss://monHost:monPort/email/userId');
websocket.onmessage = function (evt) {
    update_ui(evt.data);
}
````

### Pour le WEB

Nous voulons alors mesurer l'écart d'utilisation du réseau. Comme la websocket est un mode connecté, le navigateur ne nous indique pas tout, notamment les trames TCP/IP de keep alive. Nous faisons un dump TCP avec [wireshark](https://www.wireshark.org/).

Avec le polling :

[![Wireshark polling](/images/migration_polling_websocket/wireshark_polling.png){:height="300px" width="400px"}](/images/migration_polling_websocket/wireshark_polling.png)

On voit notre requête `GET` vers l'url `new_mails` qui utilise 683 + 215 octets et puis l'aquitement TCP avec 66 octets.

Avec websocket :

[![Wireshark websocket](/images/migration_polling_websocket/wireshark_websocket.png){:height="300px" width="400px"}](/images/migration_polling_websocket/wireshark_websocket.png)

On voit à présent les TCP Keep-Alive toutes les 45 secondes, ce qui fait 2 fois 66 octets (avec le ACK).

En résumé :


| Polling | Websocket |
|---------|----------|
| requête/réponse HTTP + ACK TCP | TCP Keep-Alive |
| 964 octets | 132 octets |
| toutes les 30s | toutes les 45s |


Nous divisions par 7,3 le nombre d'informations échangées à chaque requête, et nous faisons trois requêtes HTTP pour deux Keep-Alive/ACK. Donc nous échangeons **10 fois moins de données** en ayant une meilleure réactivité à la réception d'un mail.

### Pour l'IMAP

De la même manière, les échanges IMAP sont diminués. Avec le polling, on fait un FETCH toutes les 30 secondes :

````
* 160 FETCH (UID 258 FLAGS (\Seen NonJunk POUET))\r\n
463 OK Fetch completed.\r\n
142 bytes on the wire (1136 bits)
````

Soit 142 octets avec un ACK de 66 octets : `208 octets`. En mode événementiel, on utilise l'instruction IDLE, le serveur envoie un 'OK Still here' (83 octets) toutes les 2 minutes (pour [Dovecot](http://dovecot.org/)), avec un ACK TCP, soit `149 octets` au total.

| Polling fetch | IDLE |
| --------------|------|
| requête/réponse FETCH | `Still Here` serveur |
| 208 octets | 149 octets |
| toutes les 30s | toutes les 2mn |


Ce qui fait **presque 5 fois moins de données** là encore en améliorant la réactivité du service.

### En résumé

![Synthèse](/images/migration_polling_websocket/synthese.png)

Nous avons transformé notre mail_fetcher multithreadé avec un client IMAP actif par thread en mail_fetcher monothreadé événementiel, ce qui le rend moins gourmand en mémoire et CPU.

Nous obtenons :

- une meilleure expérience utilisateur avec un temps de réponse diminué pour la réception d'un email
- [une librairie](https://github.com/bamthomas/aioimaplib) IMAP asynchrone
- une division par 9 de la sollicitation du réseau (client <-> serveur HTTP + serveur HTTP <-> serveur IMAP)
- une diminution de l'utilisation des serveurs
- un apprentissage sur la programmation asynchrone en python

Dans cet environnement contraint nous avons rendu [notre tâche simple en tâche difficile](http://dominicwilliams.net/en/pair_diff.html) : notifier l'utilisateur de l'arrivée d'un nouveau message par scrutation en push serveur.

Pour bien faire, il reste à travailler la fiabilité et le déploiement :

- un fallback en longtime polling pour les clients qui ne supportent pas les websockets
- la détection côté client d'un lien cassé et le rétablissement automatique d'une nouvelle websocket
- le dimentionnement du nombre de clients websocket que peut servir une machine. [Ce fil stackoverflow](http://stackoverflow.com/questions/15872788/maximum-concurrent-socket-io-connections) peut aider.

Nous calculerons également l'économie en eau et en émission de CO2 en fonction du nombre d'utilisateurs, en se basant sur le modèle d'[Ecoindex](http://www.ecoindex.fr/quest-ce-que-ecoindex/). Mais cela fera l'objet d'un autre article :)

Bonne année à vous !!
