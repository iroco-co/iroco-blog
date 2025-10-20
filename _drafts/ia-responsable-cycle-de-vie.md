---
layout: post
title: Le Cycle de vie de l'IA
author:
  name: iroco
categories:
  - Grand public
tags:
  - Numérique responsable
  - IA Responsable
---

_L’IA est aujourd’hui partout dans nos vies professionnelles et personnelles. Or nous ne prenons pas toujours le temps de comprendre les enjeux environnementaux et humains derrière la fabrication et l’utilisation du numérique en général, et de l’IA en particulier. Nous entamons cette série par la présentation d'une synthèse du cycle de vie de l'IA._ 

#  Le cycle de vie de l’IA

Le numérique en général, et l’IA en particulier, nous paraissent souvent immatériels : ne parle-t-on pas de « dématérialisation » ou de « cloud » ? L’IA en particulier ne nous est-elle pas souvent présentée comme un peu magique, à grand renfort d’étoiles et d’étincelles ? Pourtant, utiliser l’IA nécessite le recours à de nombreuses infrastructures qui ne sont pas sans impact sur l’environnement et les humains. Comme pour tous les produits et tous les services, l’IA a un cycle de vie.

1. Extraction des matières premières et fabrication des équipements. Le cycle de vie de l’IA commence dans la mine, où sont extraits les métaux nécessaires à la fabrication des équipements numériques qui serviront à développer ou utiliser l’IA. Les composants puis les équipements sont ensuite fabriqués et assemblés en usine pour devenir nos ordinateurs et nos téléphones mais aussi les GPU (graphics processing units) nécessaires à l’entraînement et à l’utilisation des grands modèles d’IA, et les data centers qui hébergent les serveurs sur lesquels tournent beaucoup de services numériques.

2. Développement, entraînement et renforcement des modèles. Une fois développée la structure algorithmique de base d’un modèle d’IA, une phase d’entraînement est nécessaire : le modèle lit de grandes quantités de données afin « d’apprendre » à accomplir la tâche pour laquelle il a été conçu (par exemple reconnaître une image, prédire une température ou encore générer du texte ou une image dans le cas de l’IA générative). Cette phase d’entraînement nécessite notamment deux choses : une capacité de calcul, c’est-à-dire du temps de processeur, qui croît avec la taille du modèle et la quantité de données d’entraînement, et bien évidemment des données d’entraînement de bonne qualité.

3. Utilisation des modèles (inférence). Une fois entraînés, les modèles d’IA sont utilisés pour diverses finalités : c’est la phase d’inférence, où le modèle tire des conclusions sur la base des données d’entrée qui lui sont fournies par la personne qui l’utilise. Cette phase nécessite également une capacité de calcul, plus ou moins importante selon la tâche à accomplir et selon le type et la taille du modèle d’IA utilisé. La diversité des modèles disponibles et de leurs capacités fait de l’IA un outil très puissant pouvant être utilisé à de nombreuses fins... qui ne sont pas toujours licites ou utiles.

4. Fin de vie des équipements. Les équipements numériques finissent par tomber en panne... ou par être remplacés par des modèles plus performants ou plus récents. Ces équipements en fin de vie sont très peu recyclables et finissent la plupart du temps enfouis, incinérés ou dans des décharges à ciel ouvert.

# Les enjeux environnementaux de l'IA

## Consommation d'énergie

En amont du cycle de vie du numérique, les procédés d’extraction minière, de fabrication des équipements et de construction des data centers sont très consommateurs d’énergie et émetteurs de gaz à effet de serre.

Par ailleurs, l’entraînement et l’utilisation des modèles d’IA nécessitent dans certains cas de très grandes capacités de calcul : c’est notamment le cas des LLM comme GPT. Concrètement, cela signifie que les modèles d’IA sollicitent de nombreux processeurs, parfois très gourmands en énergie, pendant des durées allant de quelques secondes pour une inférence (une réponse d’Archi+, par exemple) à plusieurs semaines ou mois pour l’entraînement d’un modèle. Les data centers qui hébergent ces processeurs consomment donc de grandes quantités d’électricité. Même si toute la consommation des data centers n’est pas imputable à l’IA, l’AIE (Agence Internationale de l'Energie) projette qu’en 2030, ceux-ci consommeront à eux seuls 945 TWh par an, soit la consommation annuelle du Japon aujourd’hui.

Cela pose plusieurs problèmes : tout d’abord, la majeure partie de l’électricité produite dans le monde l’est à partir d’énergies fossiles, fortement émettrices de gaz à effet de serre. Aux Etats-Unis par exemple, le mix électrique est composé à environ 60% d’énergie fossile ; en France, l’électricité est nettement moins carbonée (6% d’énergie fossile), grâce notamment à l’énergie nucléaire.

Un second problème est la cohabitation entre les usages : les data centers fragilisent les réseaux de transmission d’électricité du fait de leur très importante consommation, ce qui peut entraîner des perturbations affectant l’ensemble des usagers du réseau électrique. Dans certains cas, les opérateurs de data centers choisissent d’avoir recours sur place à [des générateurs fonctionnant au diesel ou au gaz](https://www.geo.fr/environnement/le-chiffre-de-geo-2000-tonnes-d-oxydes-d-azote-polluent-memphis-pour-le-superordinateur-d-elon-musk-226624), ce qui engendre des nuisances de voisinage et émet des gaz à effet de serre.

## Consommation en eau

De l’eau dans l’IA ? Mais oui ! Les ressources en eau interviennent à plusieurs reprises dans le cycle de vie de l’IA.

En effet, les nombreux serveurs hébergés dans les data centers finissent par chauffer lorsqu’ils sont sollicités, tout comme votre ordinateur lorsque vous lui demandez d’accomplir une tâche gourmande en puissance de calcul. Il est donc nécessaire de refroidir ces serveurs afin qu’ils puissent continuer à fonctionner dans de bonnes conditions : il existe plusieurs techniques de refroidissement, et une très répandue consiste à faire circuler de l’eau douce froide à l’intérieur des data centers afin d’absorber la chaleur. Une partie de cette eau s’évapore ensuite. Ce procédé consomme donc des quantités parfois importantes d’eau douce, ce qui peut notamment entraîner des conflits d’usage dans des régions où il y a peu d’eau ET des habitants qui en ont besoin pour vivre.

Plus en amont sur la chaîne de valeur, certains composants électroniques ont également besoin de beaucoup d’eau pour être fabriqués : c’est par exemple le cas des semi-conducteurs.

## Consommation de matières premières

Le numérique en général, et l’IA en particulier, nécessitent de nombreux métaux pour fonctionner. La plupart des ressources minières se situent en Asie, en Afrique, en Amérique du sud et en Australie. Or l’extraction de ces métaux se fait rarement dans de bonnes conditions environnementales et sociales, et la compétition pour ces ressources critiques - et qui s’épuisent - mène parfois à des conflits géopolitiques. Travail forcé, emploi d’enfants, financement de groupes armés, aucun moyen n’est écarté pour tirer profit de ces précieuses matières. Parfois appelés « minerais de sang », ils sont difficiles à tracer.

On peut citer par exemple

Ressource : Palladium
Pays producteurs : Russie (42%), Afrique du Sud (38%)
Utilisation : circuits imprimés

Ressource : Tantale
Pays producteurs : République Démocratique du Congo (35%), Rwanda (17%), Brésil (16%)
Utilisation : condensateurs (smartphones, disques durs)

Ressource : Cobalt
Pays producteurs : République Démocratique du Congo (68%)
Utilisation : batteries (véhicule électriques, appareils électroniques)

Ressource : Antimoine
Pays producteurs : Chine (54%), Russie (18%), Tadjikistan (15%)
Utilisation : circuits imprimés, semi-conducteurs, gaines de câbles

cf https://www.mineralinfo.fr/fr/actualite/actualite/cartes-de-geopolitique-des-ressources-minieres-production-reserves-mondiales
