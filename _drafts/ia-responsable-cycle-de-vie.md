---
layout: post
title: Le Cycle de vie de l'IA
authors:
  - adeline
  - bruno
categories:
  - Grand public
tags:
  - Numérique responsable
  - IA Responsable
---


_L’IA est aujourd’hui partout dans nos vies professionnelles et personnelles. Or nous ne prenons pas toujours le temps de comprendre les enjeux environnementaux et humains derrière la fabrication et l’utilisation du numérique en général, et de l’IA en particulier. Nous entamons cette série par la présentation d'une synthèse du cycle de vie de l'IA._

![Les IA](/images/ia-responsable/ia.png)

L'Intelligence Artificielle existe depuis les années 60 et regroupe un large champ de recherches et de technologies. Dans cette série, nous allons aborder principalement l'IA _générative_, parce que c'est celle qui suscite le plus de réactions et nécessite le plus de données et de ressources.

##  Le cycle de vie de l’IA

Le numérique en général, et l’IA en particulier, nous paraissent souvent immatériels : ne parle-t-on pas de « dématérialisation », de « cloud »  ou encore de « [serverless computing](https://en.wikipedia.org/wiki/Serverless_computing) », c'est-à-dire littéralement d'_informatique sans serveur_ ? L’IA en particulier ne nous est-elle pas souvent présentée comme un peu magique, à grand renfort d’étoiles et d’étincelles ? Pourtant, utiliser l’IA nécessite le recours à de nombreuses infrastructures qui ne sont pas sans impact sur l’environnement et les humains. Comme pour tous les produits et tous les services, l’IA a un cycle de vie.

[![La chaine de valeur de l'IA](/images/ia-responsable/ia-chaine-de-valeur.jpg)](/images/ia-responsable/ia-chaine-de-valeur.jpg)

1. Le cycle de vie de l’IA commence dans la mine, où sont extraits les métaux nécessaires à la fabrication des équipements numériques qui serviront à développer ou utiliser l’IA. 

2. Les composants puis les équipements sont ensuite fabriqués et assemblés en usine pour devenir nos ordinateurs et nos téléphones mais aussi les GPU (_graphics processing units_) nécessaires à l’entraînement et à l’utilisation des grands modèles d’IA, et les data centers qui hébergent les serveurs sur lesquels tournent beaucoup de services numériques.

3. Une fois développée la structure algorithmique de base d’un modèle d’IA, une phase d’entraînement est nécessaire : le modèle lit de grandes quantités de données afin « d’apprendre » à accomplir la tâche pour laquelle il a été conçu (par exemple reconnaître une image, prédire une température ou encore générer du texte ou une image dans le cas de l’IA générative). Cette phase d’entraînement nécessite notamment deux choses : une capacité de calcul, c’est-à-dire du temps de processeur, qui croît avec la taille du modèle et la quantité de données d’entraînement, et bien évidemment des données d’entraînement de bonne qualité.

4. Une fois entraînés, les modèles d’IA sont utilisés pour diverses finalités : c’est la phase d’inférence, où le modèle tire des conclusions sur la base des données d’entrée qui lui sont fournies par la personne qui l’utilise. Cette phase nécessite également une capacité de calcul, plus ou moins importante selon la tâche à accomplir et selon le type et la taille du modèle d’IA utilisé. La diversité des modèles disponibles et de leurs capacités fait de l’IA un outil très puissant pouvant être utilisé à de nombreuses fins... qui ne sont pas toujours licites ou utiles.

5. Les équipements numériques finissent par tomber en panne... ou par être remplacés par des modèles plus performants ou plus récents. Ces équipements en fin de vie sont très peu recyclables et finissent la plupart du temps enfouis, incinérés ou dans des décharges à ciel ouvert.

## Les enjeux environnementaux de l'IA

### Consommation d'énergie

En amont du cycle de vie du numérique, les procédés d’extraction minière, de fabrication des équipements et de construction des data centers sont très consommateurs d’énergie et émetteurs de gaz à effet de serre.

Par ailleurs, l’entraînement et l’utilisation des modèles d’IA nécessitent dans certains cas de très grandes capacités de calcul : c’est notamment le cas des LLM comme GPT. Concrètement, cela signifie que les modèles d’IA sollicitent de nombreux processeurs, parfois très gourmands en énergie, pendant des durées allant de quelques secondes pour une inférence (une réponse textuelle simple de ChatGPT, par exemple) à plusieurs semaines ou mois pour l’entraînement d’un modèle. Les data centers qui hébergent ces processeurs consomment donc de grandes quantités d’électricité. Même si toute la consommation des data centers n’est pas imputable à l’IA, l’AIE (Agence Internationale de l'Energie) projette qu’en 2030, [ceux-ci consommeront à eux seuls 945 TWh par an](https://iea.blob.core.windows.net/assets/ed0483fd-aab4-4cf9-b25a-5aa362b56a2f/EnergyandAI.pdf), soit la consommation annuelle du Japon aujourd’hui.

Cela pose plusieurs problèmes : tout d’abord, la majeure partie de l’électricité produite dans le monde [l’est à partir d’énergies fossiles](https://ourworldindata.org/grapher/electricity-prod-source-stacked), fortement émettrices de gaz à effet de serre. Aux Etats-Unis par exemple, le mix électrique est composé à environ 60% d’énergie fossile ; en France, l’électricité est nettement moins carbonée (6% d’énergie fossile), grâce notamment à l’énergie nucléaire.

Un second problème est la cohabitation entre les usages : les data centers fragilisent les réseaux de transmission d’électricité du fait de leur très importante consommation, ce qui peut entraîner des perturbations affectant l’ensemble des usagers du réseau électrique. Dans certains cas, les opérateurs de data centers choisissent d’avoir recours sur place à [des générateurs fonctionnant au diesel ou au gaz](https://www.geo.fr/environnement/le-chiffre-de-geo-2000-tonnes-d-oxydes-d-azote-polluent-memphis-pour-le-superordinateur-d-elon-musk-226624), ce qui engendre des nuisances de voisinage et émet des gaz à effet de serre.

### Consommation en eau

De l’eau dans l’IA ? Mais oui ! Les ressources en eau interviennent à plusieurs reprises dans le cycle de vie de l’IA.

En effet, les nombreux serveurs hébergés dans les data centers chauffent lorsqu’ils sont sollicités, tout comme votre ordinateur lorsque vous lui demandez d’accomplir une tâche gourmande en puissance de calcul. Il est donc nécessaire de refroidir ces serveurs afin qu’ils puissent continuer à fonctionner dans de bonnes conditions : il existe plusieurs techniques de refroidissement, et une très répandue consiste à faire circuler de l’eau douce froide à l’intérieur des data centers afin d’absorber la chaleur. Une partie de cette eau s’évapore ensuite. Ce procédé consomme donc des quantités parfois importantes d’eau douce, ce qui peut notamment entraîner [des conflits d’usage](https://www.novethic.fr/environnement/climat/avec-leurs-datacenters-amazon-microsoft-et-google-saccaparent-leau-des-regions-les-plus-seches-du-monde) dans des régions où il y a peu d’eau ET des habitants qui en ont besoin pour vivre.

Plus en amont sur la chaîne de valeur, certains composants électroniques ont également besoin de beaucoup d’eau pour être fabriqués : c’est par exemple le cas des semi-conducteurs.

### Consommation de matières premières

Le numérique en général, et l’IA en particulier, nécessitent de nombreux métaux pour fonctionner. La plupart des ressources minières se situent en Asie, en Afrique, en Amérique du sud et en Australie. Or l’extraction de ces métaux se fait rarement dans de bonnes conditions environnementales et sociales, et la compétition pour ces ressources critiques - et qui s’épuisent - mène parfois à des conflits géopolitiques. Travail forcé, emploi d’enfants, financement de groupes armés, aucun moyen n’est écarté pour tirer profit de ces précieuses matières. Parfois appelés « minerais de sang », ils sont difficiles à tracer.

Parmi les minerais communément utilisés pour le numérique, on peut citer par exemple :

| Ressource | Pays producteurs | Utilisation |
| ------------- | ---------------- | ----------------- |
| Palladium | Russie (42%), Afrique du Sud (38%) | circuits imprimés |
| Tantale | République Démocratique du Congo (35%), Rwanda (17%), Brésil (16%) | condensateurs (smartphones, disques durs) |
| Cobalt |  République Démocratique du Congo (68%) | batteries (véhicule électriques, appareils électroniques) |
| Antimoine | Chine (54%), Russie (18%), Tadjikistan (15%) | circuits imprimés, semi-conducteurs, gaines de câbles |
| Cuivre | Chili (56%), République Démocratique du Congo (35%)| composants électroniques, circuits imprimés | 

Sources : 

1. [https://www.mineralinfo.fr/fr/actualite/actualite/cartes-de-geopolitique-des-ressources-minieres-production-reserves-mondiales](https://www.mineralinfo.fr/fr/actualite/actualite/cartes-de-geopolitique-des-ressources-minieres-production-reserves-mondiales)
2. [https://worldpopulationreview.com/country-rankings/copper-production-by-country](https://worldpopulationreview.com/country-rankings/copper-production-by-country)

Retrouvez bientôt la suite de notre série sur l'IA responsable :

- [Les enjeux humains et éthiques de l'IA](/ia-responsable-enjeux-humains-ethiques/)
- [Les enjeux de règlementation et souveraineté numérique liés à l'IA](/ia-responsable-reglementation-et-souverainete/)
- [Les bonnes pratiques de l'IA "responsable"](/ia-responsable-bonnes-pratiques/)
