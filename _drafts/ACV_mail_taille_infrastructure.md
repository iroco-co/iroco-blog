---
layout: post
title: Quel est l'impact de la taille de l'infrastructure ?
description: Dans l'ACV comparative réalisée avec Hubblo, nous avons quantifié l'impact de la taille de l'infrastructure sur l'environnement.
author:
  display_name: iroco
categories:
- Grand public
tags:
- ACV Mail
---

_Dans notre série d'articles sur l'ACV mail réalisée avec [Hubblo](https://hubblo.org/) et l'[ADEME](https://www.ademe.fr/), nous envisageons de lisser la charge des serveurs afin de pouvoir limiter la taille de nos infrastructures._

Le levier 3 va permettre de lisser le traitement des emails “non urgents” et donc de sous-dimensionner l’infrastructure nécessaire. Avec l'analyse attributionnelle, on fait l'hypothèse d'une diminution de 10%, 20%, 30% et 50% des infrastructures et on regarde les différences d'impacts sur les facteurs (gaz à effets de serre, consommation de ressources abiotiques, etc).

Cette question du dimensionnement peut être étendue à d'autres aspects. Par exemple la haute disponibilité. Pour améliorer la qualité d'un service on doit d'abord quantifier cette qualité en définissant des indicateurs. Un indicateur communément utilisé est le taux disponibilité : on mesure le temps pour lequel le service est disponible et répond aux sollicitations des utilisateurs et on le divise par le temps total de la période de mesure. Lorsqu'on veut améliorer cette disponibilité, il faut :

1. mettre en place un _monitoring_ du/des service(s) avec des sondes multiples ;
2. définir des seuils alertants sur ces sondes pour permettre aux équipes opérationnelles de prendre des mesures proactives dans le cas de dysfonctionnements sur la chaîne de traitement ;
3. avoir des machines en redondances par exemple primaire/secondaire avec un reverse proxy devant qui redirige le trafic vers la/les machines qui fonctionnent ;

Le premier point nécessite des machines supplémentaires notamment pour exposer un service de suivi avec un historique des mesures et des diagrammes en temps réel pour éclairer les décisions de suivi de production. Selon la solution choisie, cela peut-être lourd. Par exemple la stack Elasticsearch, Logstash, Kibana dite [ELK](https://www.elastic.co/fr/elastic-stack)) permet de faire des suivis sur des plateformes très sollicitées mais nécessite une part d'infrastructure non négligeable.

La redondance demande aussi des machines supplémentaires, voire parfois des centres de données supplémentaires pour éviter les pannes locales (coupures d'électricité, catastrophes naturelles, incendies, etc.).

Améliorer la disponibilité du service augmente directement son empreinte environnementale.

## Levier 3 : Diminution du dimensionnement de l'infrastructure

Les résultats du lissage de charge sur les différents facteurs est le suivant :

![Graph des résultats de l'ACV-A levier3](/images/ACV/resultats-levier3-attr.png)

A l’échelle de l’Unité Fonctionnelle, les variations d’impacts restent significatives (de 10 à 29%) lorsque la diminution de l’infrastructure de traitement atteint les 50%. Cela revient à diminuer la quantité de resources nécessaires à la mise en oeuvre du serivce (énergie, matières premières de frabrication des serveurs, eau, liquides de refroidissement, etc.) et finalement à faire preuve d'une certaine forme de sobriété d'hébergement.

C'est un sujet important pour Iroco qui a des impacts sur le périmètre fonctionnel et la qualité de service. Cela poste des questions :

- Quel niveau de qualité de service est acceptable pour les utilisateurs du mail ?
- Comment serait reçue une fonction d'envoi de mail _différé_ ?
- Comment bénéficier d'une mutualisation d'infrastructure sans participer à la [_Mega Machine_](https://www.youtube.com/watch?v=5R1ZHZVXkDE) de Lewis Mumford qui dépossède, asservi dans le sens de Illich ?
- Comment faire croitre un service en nombre d'utilisateurs en limitant son industrialisation ?

Si vous avez des réflexions, liens et resources sur ces sujets, nous sommes intéressés par vos éclairages, n'hésitez pas à nous contacter.

Retrouvez les autres articles de la série :

- La [présentation](/acv-mail-presentation/)
- La description des [leviers](/acv-mail-leviers/)
- Le facteur de la taille de l'[infrastructure](/acv-mail-infrastructure/)
- La durée de vie des [terminaux](/acv-mail-duree-de-vie-terminaux/)
- Ainsi que l'[étude complète](/images/ACV/ACV-mail-Hubblo-Iroco-01032024.pdf).
