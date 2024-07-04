---
layout: post
title: Quel est l'impact de l'immédiateté du mail ?
description: Dans l'ACV comparative réalisée avec Hubblo, nous nous sommes demandé si ralentir la délivrance des mails pouvait réduire son empreinte.
author:
  display_name: iroco
categories:
- Grand public
tags:
- ACV Mail
---

_Dans notre série d'articles sur l'ACV mail réalisée avec [Hubblo](https://hubblo.org/) et l'[ADEME](https://www.ademe.fr/), nous explorons la temporalité du transport des messages. Lorsqu'on cherche à améliorer l'efficacité d'un service nous pouvons... ralentir. Un peu comme il existait des timbres verts pour des lettres normales et des timbres rouges pour les lettres urgentes, on peut introduire des délais dans la délivrance d'un e-mail dans le cas où le message n'est pas urgent._

Dans les années 2010 avec le développement de services ayant des millions d'utilisateurs, les développeurs ont été confrontés à des problèmes de scalabilité notamment avec les traitements synchrones (immédiats). Une solution [a émergé](https://www.barreverte.fr/alors-cette-qcon-2010/) : l'utilisation de files d'attentes et de réponses asynchrones (décalées par rapport à l'action utilisateur). Par exemple, lors d'une commande amazon, l'utilisateur pouvait voir un résumé de sa commande mais n'avait accès à tous les paramètres plus tard, lorsque la commande avait réellement été traitée par le système. Il s'agissait à l'époque de passer à l'échelle, mais pour réduire l'empreinte d'un service on peut aussi ralentir.

Pour notre cas de l'envoi de mail, cela permet par exemple d'attendre qu'un mobile soit connecté à un réseau local par wifi, plutôt que d'utiliser le réseau 34/4G/5G (levier 1) lorsqu'une personne est en itinérance. Cela permet aussi de retenir les messages côté serveur et d'attendre le meilleur mix énergétique pour envoyer les messages non-urgents : pendant une période où la production électrique est peu carbonnée (levier 2).

## Levier 1 : modification dynamique du réseau d'accès

Avec la démarche attributionnelle, l'impact est minime (pas mesurable sauf pour l'épuisement des resources abiotiques avec gain de 0,02%). Cette absence de différence s'explique par la faible taille d'un email : en moyenne 120Ko avec 25% d'email ayant une pièce jointe dans notre échantillon.

La démarche conséquentielle court terme distingue 3 tiers :

- le tier 1 correspond au mobile. On considère que le mobile existe déjà (les utilisateurs n'achètent pas un smartphone pour l'utilisation de l'email) et que les utilisateurs ne vont pas changer de mobile pour envoyer/recevoir des emails. On considère donc la consommation d'énergie pour l'envoi/réception de mail et la différence entre wifi et 3G/4G ;
- le tier 2 représente l'utilisation du réseau. Là aussi, le réseau internet mobile existe déjà, et donc on considère les différences entre wifi et 3G/4G ;
- le tier 3, les _data centers_. De même, ils n'ont pas été construits pour le mail. Comme les emails ne varient pas entre le scénario de base et les différents leviers, seuls le cas du changement de type de réseau et le décalage dans le temps côté serveur ont un impact.

![Graph des résultats de l'ACV-C levier1](/images/ACV/resultats-levier1-conseq-ct.png)

On observe une diminution de 22% sur l'envoi de mails pendant une semaine, mais rapporté à leur taille, cela représente un gain de 0,04 gCO2eq.

## Levier 2 : Déplacement de la demande dans le temps

Avec l'analyse conséquentielle court terme on obtient:

![Graph des résultats de l'ACV-C levier2](/images/ACV/resultats-levier2-conseq-ct.png)

Comme pour le levier 1 on observe une diminution de 20% sur l'envoi de mails pendant une semaine, mais rapporté à leur taille, cela représente également un gain de 0,04 gCO2eq.

On constate finalement dans les deux cas un effet très limité qui est lié à la taille des mails envoyés. En revanche, pour des services dont les données échangées seraient beaucoup plus volumineuses (par exemple des vidéos), cette possibilité pourrait avoir des effets notables. Par exemple un boîtier avec une antenne TNT pourrait proposer en local sur le réseau wifi une liste d'émissions et séries, l'utilisateur·ice choisit ce qui l'intéresse sur son mobile, le boîtier enregistre (pour la TNT) et télécharge (pour internet) les contenus pour les installer sur le mobile. Quand l'utilisateur·ice regarde ses contenus plus tard sur son mobile, ils sont stockés dans la mémoire et la communication 4G/5G n'est pas utilisée pour le flux vidéo. Et vous, imaginez-vous d'autres scénarios possibles d'usages asynchrones pour épargner le réseau ?

Retrouvez les autres articles de la série :

- La [présentation](/acv-mail-presentation/)
- La description des [leviers](/acv-mail-leviers/)
- Le facteur de la taille de l'[infrastructure](/acv-mail-infrastructure/)
- La durée de vie des [terminaux](/acv-mail-duree-de-vie-terminaux/)
- Ansi que l'[étude complète](/images/ACV/ACV-mail-Hubblo-Iroco-01032024.pdf).
