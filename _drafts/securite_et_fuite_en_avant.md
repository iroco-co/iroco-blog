---
layout: post
title: Sécurité et fuite en avant du numérique
description: La rapidité du déploiement du numérique s'est-il fait au détriment de sa régulation ?
author:
  display_name: Iroco
categories:
- Grand public
tags:
- sécurité
---


Il y a à peu près un mois, nous avons subi une attaque d'un groupe de spam, probablement localisé en Russie (de nombreuses sources géographiques différentes convergent vers des domaines et IP Russes). Ils ont utilisé notre plateforme pour envoyer des messages d'hameçonnage (phishing). Ces messages ont été repérés par les autres plateformes de messagerie qui à leur tour nous ont signalé comme serveur de spam.

Nous avions déjà constaté des tentatives permanentes, à bas bruit, de détournement ou utilisation frauduleuse de notre serveur d'envoi de mail. Par exemple des tentatives de connexion sur des comptes existants toutes les 5 ou 10 minutes. Ces tentatives ne sont pas repérées car elles sont difficilement discernables d'échecs de connexion (ex: mauvais mot de passe) d'un utilisateur légitime. Néanmoins, en regardant de plus près les adresses internet (IP), ce sont la plupart du temps des adresses qui sont référencées dans des bases de spammeurs ([abuseIPDB](https://www.abuseipdb.com/), [Spamhaus](https://www.spamhaus.org/)...).

Le mode opératoire est le suivant :

* Création automatique ou semi-automatique de comptes mails de test (notre service permet aux utilisateurs de tester gratuitement pendant un mois), le plus souvent pendant la nuit ;
* Utilisation de ces comptes pour explorer la configuration de SMTP/postfix ;
* Le cas échéant, exploitation d'une faille de configuration, ou simple mise en œuvre d'envois en masse avec ces utilisateurs.

Pour avons alors pris des contre-mesures pour palier à ce problème :

* Renforcement de la configuration du serveur d'envoi SMTP/postfix ;
* Ajout d'un [reCAPTCHA](https://fr.wikipedia.org/wiki/ReCAPTCHA) à l'inscription pour dissuader les robots ;
* Abonnement à un service de référencement d'adresses frauduleuses pour mettre à jour de manière dynamique nos pare-feux avec des listes noires ;
* Utilisation de ce service pour ne pas accepter des inscription issues d'IP [TOR](https://www.torproject.org/) ou d'IP référencées au moins une fois dans ces bases de données ;
* Fermeture du service d'inscription pendant la nuit (pour pouvoir dormir).

Ces bases de référencements d'adresses frauduleuses sont une mutualisation de nombreux acteurs du monde entier, qui exposent des services en ligne et qui notifient de manière automatique (avec [fail2ban](http://www.fail2ban.org/) par ex) ou manuelle ces attaques. C'est très utile pour anticiper la protection des serveurs.

Ok super. En prenant un peu de recul avec l'écoute d'un des derniers épisodes de Techologie sur les [Incompatibilités des transitions numérique et écologique](https://techologie.net/episodes/86-transitions-numerique-et-ecologique-incompatibles/), plein de questions pointent leur nez :

* Quel surplus d'énergie est nécessaire pour se protéger de la malveillance. Plus globalement, que représente la quantité d'énergie de la malveillance dans le numérique ?
* Qu'arrive-t-il aux adresses IP une fois que les spammeurs les abandonnent ?
* Pourquoi devons-nous payer un service de protection privé ?
* Comment en est-on arrivé là ? Que font les États ?

Commençons avec l'utilisation de la technologie à des fins de défense :

* téléchargement toutes les 3 heures d'un fichier de près de 60K adresses IP. Ajout à [iptables](https://netfilter.org/projects/iptables/index.html). Ce qui fait que le filtrage de toutes les requêtes IP légitimes sont considérablement alourdi ;
* remontée de tous les bannissements au service de référencement (une requête HTTP par bannissement) ;
* envoi d'une requête HTTP pour chaque inscription pour vérifier l'état de l'adresse d'inscription ;
* calcul d'une preuve de travail (Proof of Work) pour la soumission du formulaire d'inscription (ce qui revient à faire tourner une machine pour rien);
* complexification de la base de code pour ajouter ces fonctionnalités.

Notons que ces "surplus" concernent le _runtime_ des machines, et donc sont des problèmes d'optimisation avec les limites qu'on connaît quand on compare avec la production et le recyclages de ces machines. Mais quand même si on pense à l'ensemble des machines mobilisées (et produites) pour faire tourner ces robots qui tentent en permanence de se connecter sur différents serveurs pour récupérer des adresses mail (ou autres failles PHP, Web...), la puissance utilisée pour se défendre de ces attaques, on doit atteindre un montant non négligeable d'énergie brûlée pour un résultat discutable.

> Qu'arrive-t-il aux adresses IP une fois que les spammeurs les abandonnent ?

Réponse, rien. Elles sont recyclées pour d'autres utilisateurs, qui probablement vont se faire bloquer de temps en temps sans comprendre pourquoi, car leur adresse sera toujours présente dans des listes noires. Étant donné que ces registres sont privés, que peuvent-ils faire de ces informations ? Porter plainte ? Outre des enquêtes parfois compliquées, ce serait assumer des coûts qui n'apportent rien à leur modèle d'affaire. Ce qui nous amène à la question suivante :

> Pourquoi devons-nous payer un service de protection privé ?

Et oui ces services de mutualisation des menaces sont utiles. Mais pourquoi n'existe-t-il pas en Europe un service public qui protège les citoyens de ces attaques, et surtout qui donne une suite à ces attaques. L'Europe a-t-elle la légitimité et la puissance de frappe pour avoir des impacts diplomatiques, commerciaux, techniques sur les acteurs de ces nuisances ?

> Comment en est-on arrivé là ?

Internet ferait penser à l'utilisation sans code de la route de l'automobile. Imaginez un trafic automobile n'ayant aucune signalisation, des conducteurs cachés derrière des vitres teintées qui font ce qu'ils veulent, provoquent des accidents, écrasent des piétons. Des entreprises privées publient des listes payantes de plaques d'immatriculation "à risque" basées sur des signalisations de citoyens. Nous avons chacun nos apps qui nous préviennent quand un véhicule potentiellement dangereux approche. Vous pouvez racheter un véhicule ayant fait un carnage sans le savoir et sans changer de plaque.

Est-ce le caractère dématérialisé, sans dommages physiques qui a pu favoriser le désintérêt du législateur à poser des règles ? Est-ce lié à l'esprit libertaire des cyber-communautés qui ont refusé de payer, de réglementer (spoiler elles ont fini par payer, que ce soit avec leurs cartes de crédit ou avec leurs données) ? Est-ce le développement si rapide que les entités politiques n'ont pas su s'adapter ? Est-ce son côté global qui a dépassé les limites géographiques des États ? Comment le libéralisme des années Reagan, la pensée économique de Chicago ont-elles pu influencer l'encadrement d'Internet ? La régulation a-t-elle été perçue comme un frein à l'e-innovation ?
