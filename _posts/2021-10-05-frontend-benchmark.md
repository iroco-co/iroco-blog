---
layout: post
title: Migration vers une technologie front plus responsable. (1/3)
author:
  display_name: Bruno Thomas
tags:
- svelte
- reactjs
- vuejs
- greenIT
- frontend
- benchmark
comments: true
---

Nous avons fait [une mini série]({{ site.url }}/backend-benchmark) de 3 posts sur des benchmarks de technologie backend afin de tester notre architecture. Nous allons explorer dans une nouvelle série la partie frontend avec des frameworks web javascript/typescript : [vuejs](https://vuejs.org/), [reactjs](https://fr.reactjs.org/) et [svelte](https://svelte.dev/).

Pourquoi ces 3 frameworks et pas [tous les autres](https://javascript.plainenglish.io/javascript-frameworks-performance-comparison-2020-cd881ac21fce) ?

Essentiellement parce que nous faisons cette comparaison dans le contexte qui est le nôtre : dans l'ancienne version de notre produit, nous utilisions backbone, du js natif/jquery et vuejs pour la partie webmail. Nous avons des développeurs indépendants qui interviennent sur notre base de code et qui connaissent bien reactjs.

L'objectif est quadruple :

1. faire un choix et harmoniser les technos du frontend (y compris les tests) ;
2. limiter les impacts de cette technologie pour les utilisateurs (principalement efficacité et lutte contre l'obsolescence programmée) ;
3. découpler le back du front : pour le moment, il y a du rendu serveur en templates python/jinja, et côté client avec backbone/vuejs/jquery. Quand un développeur veut modifier une page de l'app, il faut qu'il comprenne toute la stack ;
4. permettre à l'application d'ouvrir les possibles technologiques et d'être refactorée/testée pour s'adapter aux besoins futurs.

Ce dernier point nous met d'accord sur les bienfaits du module javascript + markup + CSS comme c'est le cas pour react/vuejs/svelte. Par ailleurs, vuejs et react sont les technologies que nous connaissons le mieux. C'est la raison pour laquelle nous n'étendons pas nos tests à d'autres frameworks.

# Critères

Nous souhaitons tester ces deux applications en ayant en tête les critères suivants :
- la taille du livrable ;
- le nombre de lignes de code ;
- les possibilités de compatibilité javascript ;
- la performance d'affichage/traitement (plus c'est rapide, moins longtemps l'équipement client est sollicité en ressources).

La compatibilité des navigateurs est importante pour Iroco si on veut éviter aux utilisateurs de devoir mettre à jour leur navigateur pour utiliser nos applications, ce qui peut parfois entraîner une mise à jour de l'OS, et au final un changement de mobile. Ca fait partie de la lutte contre l'obsolescence programmée.

C'est un sujet complexe car il concerne beaucoup de features ainsi qu'une combinatoire importante d'environnement (machine/OS/navigateur).

Nous partons dans l'hypothèse d'une compatibilité ES5 (99,71% des navigateurs à l'écriture de cet article sur [caniuse.com](https://caniuse.com)) et flexbox (99,59% des navigateurs).

# Démarche

Nous préparons [une petite app](https://framer.com/share/Benchmark--7MGmW80Lo1Lu1AMoMN2Y/jZNcXWNxR#jZNcXWNxR) avec un [backend python](https://github.com/iroco-co/frontend-benchmark/tree/master/api) en flask. Nous écrivons cette application en vuejs et en reactjs.

Pour l'injection de trafic web, nous utilisons [jmeter](https://jmeter.apache.org/) avec le plugin [selenium](https://www.selenium.dev/). Jmeter injecte le trafic et selenium permet de simuler les actions de l'utilisateur :

![jmeter selenium](/images/frontend_benchmark/jmeter-selenium.png)

Pour avoir plus de détails sur ce que fait le navigateur, nous ajoutons des sondes [Web Vitals](https://web.dev/vitals/).

Tout le code et les résultats des tirs sont disponibles sur [ce dépôt](https://github.com/iroco-co/frontend-benchmark) github.

Nous présenterons dans l'article prochain les résultats pour vuejs/reactjs et pourquoi nous avons ajouté svelte.
