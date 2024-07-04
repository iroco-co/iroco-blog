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

Cette question du dimensionnement peut être étendue à d'autres aspects. Par exemple la haute disponibilité. Lorsqu'on veut améliorer la qualité d'un service, par exemple le taux disponibilité on mesure le temps pour lequel le service est présent et répond aux sollicitations des utilisateurs et on le divise par le temps total de la période de mesure. Lorsqu'on veut améliorer cette disponibilité, il faut :

- la mesurer : ajout de monitoring du service, et de sondes multiples pour anticiper les pannes ;
- avoir des seuils alertants sur ces sondes pour permettre aux équipes opérationnelles de prendre des mesures proactives dans le cas de dysfonctionnements sur la chaîne de traitement ;
- avoir des machines en redondances par exemple primaire/secondaire avec un reverse proxy devant qui redirige le trafic vers la/les machines qui fonctionnent ;

Améliorer la disponibilité du service augmente directement son empreinte environnementale. 

## Levier 3 : Diminution du dimensionnement de l'infrastructure

Les résultats du lissage de charge sur les différents facteurs est le suivant :

![Graph des résultats de l'ACV-A levier3](/images/ACV/resultats-levier3-attr.png)

A l’échelle de l’Unité Fonctionnelle, les variations d’impacts restent significatives (de 10 à 29%) lorsque la diminution de l’infrastructure de traitement atteint les 50%
