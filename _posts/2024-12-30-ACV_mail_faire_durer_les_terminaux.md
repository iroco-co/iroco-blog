---
layout: post
title: Quel est l'impact de l'augmentation de la durée de vie des terminaux ?
description: Dans l'ACV comparative réalisée avec Hubblo, nous avons quantifié l'impact de l'augmentation de la durée de vie des terminaux.
authors:
  - adeline
  - bruno
categories:
- Grand public
tags:
- ACV Mail
---

_Dans notre série d'articles sur l'ACV mail réalisée avec [Hubblo](https://hubblo.org/) et l'[ADEME](https://www.ademe.fr/), nous nous intéressons dans ce dernier volet à l'impact de la réduction de l'obsolescence logicielle sur l'efficacité environnementale de nos services._

## Levier 4 : Compatibilité du service mail avec les terminaux utilisateurs

Pour ce dernier levier, on fait l'hypothèse qu'en ayant des applications compatibles avec des terminaux anciens, l'utilisation du service permet aux utilisateurs de conserver leurs terminaux (mobiles, tablettes, laptops) plus longtemps, comparativement à un service incompatible.

![Graph des résultats de l'ACV-A levier4](/images/ACV/resultats-levier3-attr.png)

En ramenant les impacts à notre unité fonctionnelle, les gains sur l’ensemble des indicateurs sont significatifs: de 11 à 18% pour une augmentation d’une année de durée de vie. Pour l’indicateur de potentiel de changement climatique, le gain varie de 11% à 28% en fonction des années de durée de vie supplémentaires.

## Synthèse

En synthèse si on scénarise ces différents leviers selon 3 niveaux différents :

* “minimum” : la gestion de l’urgence des mails va permettre une moindre utilisation du réseau mobile et une diminution de 10% de l’infrastructure nécessaire (lissage minimum des traitements). L'éco-conception de l’application de mail participe à l’allongement “minimum” - un an en moyenne- des terminaux
* “raisonnable” : on vise une diminution de 20% de l’infrastructure nécessaire et un allongement de deux ans des terminaux
* “utopique” : diminution de 50% de l’infrastructure nécessaire et allongement de quatre ans des terminaux

On obtient les résultats suivants :

| Scénario | Changement climatique (kgCO2 eq.) | Ressources abiotiques (kgSB eq) | Acidification de l'air (mol H+ eq) | Particules fines (Disease incidence) | Radiation ionisante (kBq U235 eq) |
|:---------|:----------------------------------|:--------------------------------|:-----------------------------------|:-------------------------------------|:----------------------------------|
| Référence | 1,23E-01 | 3,27E-06 | 7,20E-04 | 7,87E-01 | 9,49E-09 |
| Minimum | 1,06E-01 | 2,66E-06 | 6,01E-04 | 6,30E-01 | 7,71E-09 |
| Raisonnable | 9,34E-02 | 2,25E-06 | 5,30E-04 | 5,72E-01 | 6,92E-09 |
| Utopique | 7,19E-02 | 1,67E-06 | 4,07E-04 | 4,05E-01 | 5,07E-09 |


![Graph des résultats de l'ACV-A](/images/ACV/resultats_attributionnel.png)

## Conclusion de l'étude et recommandations

| Levier | Attributionnel | Conséquentiel court terme | Conséquentiel long terme | Effet |
|:-------|:---------------|:--------------------------|:-------------------------|:------|
| Levier 1 : Modification dynamique du réseau d’accès | oui | oui | oui | faible |
| Levier 2 : Déplacement de la demande dans le temps | non | oui | oui | faible |
| Levier 3 : Diminution du dimensionnement de l’infrastructure | oui | non | non | moyen |
| Levier 4 : Rétro-compatibilité du service mail avec les terminaux utilisateurs | oui | non | oui | important |

Étant donnée la taille réduite des données d'un mail, nous avons constaté que la temporisation dans le temps pour l'envoi d'un mail (réseau fixe côté client, ou mix énergétique favorable côté serveur) n'avait pas beaucoup d'impact. L'impact des emails n'est pas lié aux conséquences directes de l'envoi mais dans l'ensemble de la chaîne de valeur liée à son fonctionnement général (leviers 1 et 2).

Le lissage de charge représente un impact plus significatif. Nous gardons en mémoire cette possibilité dans le développement de l'activité d'Iroco, notamment car les délais d'envoi pour ce lissage sont réduits.

Enfin l'étude confirme que la lutte contre l'obsolescence des terminaux est un champ important. Cet aspect est relatif à une portion congrue (pour Iroco) qu'est le web, puisque nous déployons un service qui se base sur les protocoles mail (IMAP, SMTP) qui ont très peu évolué depuis leur publication. Nous allons continuer de tester nos interfaces web avec des anciens terminaux pour vérifier la compatibilité avec la *stack* que nous utilisons.

## Participation à la réduction de l’immédiateté du numérique : un cinquième levier à valoriser&nbsp;?

Si certains leviers, permis par une évolution asynchrone des usages, ont montré un faible impact sur le service mail, leur application à des services plus intensifs en données, comme la vidéo en streaming, apparaît prometteuse.

Cela illustre bien l’enjeu de réduire l’immédiateté des usages numériques. Il faut à la fois réfléchir à la réalité des besoins, et travailler sur les leviers techniques “juste nécessaires” pour stopper la croissance des infrastructures.

Ces travaux et réflexions de l'ACV vont dans ce sens. Ils peuvent inspirer d’autres acteurs à implémenter des services numériques compatibles avec les limites planétaires.

----
Retrouvez les autres articles de la série :

- La [présentation](/acv-mail-presentation/)
- La description des [leviers](/acv-mail-leviers/)
- Le facteur de la taille de l'[infrastructure](/ACV_mail_taille_infrastructure)
- Le facteur de l'[immédiateté du mail](/ACV-mail-immediatete-numerique/)
- Ainsi que l'[étude complète](/images/ACV/ACV-mail-Hubblo-Iroco-01032024.pdf).
