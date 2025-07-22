---
layout: post
title: Les certificats letsencrypt avec haproxy et acme.sh
author:
  display_name: Iroco
categories:
- Sous le capot
tags:
- haproxy
- ACME
---

_Il y a 2 ans, les mainteneurs du système de scripts [acme.sh](https://github.com/acmesh-official/acme.sh) (Automated Certificate Management Environment) ont intégré [haproxy](https://www.haproxy.org/) et les développeurs de haproxy ont modifié également le code du reverse proxy pour pouvoir gérer ses certificats avec haproxy. Pourquoi c'est important ?_

![intégration haproxy - ACME](https://cdn.haproxy.com/img/containers/partner_integrations/2023/haproxy-and-lets-encrypt-improved-support-in-acme-sh/haproxy-and-lets-encrypt-image.png/c223cf3b8a29c8bb8ffb1d17771ed6ac/haproxy-and-lets-encrypt-image.png)

Dans le fracas des IA, [web 3](https://tante.cc/2021/12/17/the-third-web/) et autres *buzzwords* à la mode, il est des changements qui passent inaperçus, alors qu'ils facilitent la vie et améliorent la qualité des services en ligne.  On peut penser par exemple à [io_uring](/io-uring/) et aujourd'hui on voudrais vous parler de l'intégration entre haproxy et le protocole ACME.

> HAproxy, ACME kesako ?

[HAproxy](https://www.haproxy.org)  dont beaucoup ne savent pas dans quel sens le prononcer  *"Ha ! Proxy !"* (on dit souvent  \[aʃ a pʁɔksi\] ou *H. A. proxy* pour *High Availability Proxy*) est le couteau suisse du *reverse proxy*. Un reverse proxy permet de faire un intermédiaire réseau entre l'extérieur d'une plateforme numérique (Internet) et les services  qui tournent à l'intérieur. Il ouvre des un ou plusieurs ports réseau sur internet et redistribue les requêtes de différents protocoles vers les services dits *"backends"* ou "arrières". Il sait aussi bien traiter les requêtes web HTTP, HTTP2 que des protocoles binaires TCP.

![intégration haproxy - ACME](/images/haproxy-acme/haproxy.drawio.png)

Ce qui en terme de configuration HAproxy donnerait :

```
frontend ft_web
    bind :::80 v4v6
    bind :::443 v4v6 ssl crt /etc/haproxy/certs/ 
    mode http
    use_backend bk_web
    
frontend ft_mail
    bind :::25 v4v6
    bind :::465 ssl crt /etc/haproxy/certs/
    mode tcp
    use_backend bk_mail

backend bk_web
    mode http
    server web serveur01:8080
    
backend bk_mail
    mode tcp
    server mail serveur02:587
```

Les intérêts sont multiples : 

1. un composant unique permet le contrôle de tous les flux (pour désactiver des flux en cas d'urgence, avoir des statistiques...)
2. il permet d'avoir plusieurs serveurs *backend* et de faire de la répartition de charge (on pourrait ajouter des serveurs web et des serveurs mail par exemple)
3. cela permet (d'où son nom) de faire de la haute disponibilité : si un serveur back ne fonctionne plus, il distribuera les flux sur ceux qui sont disponibles
4. les certificats de sécurité peuvent être traités à un seul endroit (on le voit avec les directives `ssl crt`)
5. si des serveurs manquent de fonctionalités (par ex [Server Name Indication](https://en.wikipedia.org/wiki/Server_Name_Indication) pour être "multi-tenant" et avoir plusieurs domaines sur un seul type de service) il peut  assurer le lien avec les serveurs back. 

Les certificats de sécurité permettent de s'assurer que le serveur distant est bien le serveur sur lequel on pense aller (évite les usurpations de services), et de chiffrer les informations qui sont échangées avec le serveur. Mais ils demandent d'être renouvelés plus ou moins régulièrement. [Letsencrypt](https://letsencrypt.org/) est un service en ligne qui fournit des certificats (avec participation libre). Ces certificats doivent être renouvelés tous les 3 mois.  Ce renouvellement a été automatisé avec le protocole ACME (Automated Certificate Management Environment). 

Le système de scripts [acme.sh](https://github.com/acmesh-official/acme.sh) (en shell) ou [certbot](https://certbot.eff.org/) (en python) assurent ces échanges ACME avec le service letsencrypt. Mais pour créer et renouveller un certificat pour `mon-super-domaine.com` il faut prouver que vous êtes bien le propriétaire de ce domaine. Il existe 3 méthodes : 

1. [HTTP01](https://cert-manager.io/docs/configuration/acme/http01/) : vous devez sur le site de `mon-super-domaine.com`  placer un fichier sur le chemin `.well-known/acme-challenge/clé_fournie_par_le_serveur_acme` qui contient une valeur que seul vous connaissez
2. [DNS01](https://cert-manager.io/docs/configuration/acme/dns01/) : vous devez placer une clé dans la configuration DNS de votre nom de domaine qui contient la valeur fournie
3. [TLS-SNI-01](https://letsencrypt.org/docs/challenge-types/) qui permettait la validation uniquement au niveau TLS mais qui a été déprécié.

La grande majorité des sites utilisent la méthode web/HTTP qui est plus simple car il suffit d'avoir un serveur web (les plateformes de service internet n'ont pas toujours un serveur DNS). C'est là que ça se complique car, comme on l'a vu c'est simple de fournir les certificats de sécurité avec HAproxy mais il n'est pas un serveur web. Donc le renouvellement doit être assurée par un autre service (par exemple nginx, apache, ...) ce qui est gènant : 

- si vous avez plusieurs serveurs web, soit tous peuvent assurer ce renouvellement soit vous devez router différemment avec le proxy vers le serveur qui gère ces renouvellement
- il y a un couplage entre le serveur haproxy et les services (DNS, HTTP) qui assurent la preuve de création et renouvellement
- dans ces serveurs web vous pouvez avoir une section SSL qui ne fonctionnera que lorsque le certificat sera établi donc vous devez modifier la configuration en cours de création du certificat. Souvent les scripts le font
- une fois le certificat établi, vous devez le recopier pour HAproxy donc il faut utiliser un *hook* à la création ou au renouvellement pour garder les certificats synchrones entre le système de script et haproxy
- vous devez redémarrer haproxy pour mettre à jour son cache (ou utiliser la socket d'administration du serveur)

Cette évolution permet de gérer les certificats uniquement par haproxy. De plus `acme.sh` a intégré l'utilisation de la socket d'administration haproxy ce qui fait que lorsque le certificat est créé ou renouvelé, haproxy est mis à jour dynamiquement. Plus besoin de redémarrer.  Voici la séquence qui est exécutée lors d'une création ou renouvellement de certificat : 

[![méthode HTTP01 - ACME](/images/haproxy-acme/http01.drawio.png)](/images/haproxy-acme/http01.drawio.png)

Elle est pas belle la vie ?

Nous avons intégré ce fonctionnement (qui nécessite la version 2.8 de HAproxy, la version par défaut sur la Debian 12 est la 2.6), et fait [un role ansible pour le déploiement](https://codeberg.org/iroco/ansible-acme-haproxy). 
