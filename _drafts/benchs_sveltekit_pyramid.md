---
layout: post
title: Tests comparatifs SvelteKit / Pyramid
author:
  display_name: Bruno Thomas
categories:
- Sous le capot
- Avancé
tags:
- benchmark
- sveltekit
---

Dans les évolutions techniques que nous avons déployées récemment, il y la la migration du backend de l'app Iroco de [python/pyramid](https://trypyramid.com/) vers [sveltekit](https://kit.svelte.dev).

# Pourquoi faire cette migration ?

Nous [avions déjà porté](https://blog.iroco.co/frontend-benchmark_vue_svelte/) le frontend de l'app et l'accueil de notre site en [Svelte](https://svelte.dev/). C'est alors que sveltekit [a été releasé en version 1.0](https://svelte.dev/blog/announcing-sveltekit-1.0) (le 14 décembre 2022). Nous y avons vu une opportunité de continuer le mouvement que nous avions amorcé.

Svelte est un framework orienté composant (avec le triptyque JS/Typescript, HTML et style comme en vueJS ou en React). Sa particularité c'est qu'il est utilisé à la construction du logiciel (build time) et non à l'éxécution (runtime) : la dépendance à svelte n'est pas déployée, elle est utilisée uniquement dans les dépendances "dev".

Sveltekit est le prolongement de svelte : il permet d'intégrer un backend en nodejs. Cela [répond aux questions](https://svelte.dev/blog/announcing-sveltekit-1.0) (entre autres):

- comment structurer mon code ?
- comment faire du *serverside rendering* ?
- comment faire le routage des requêtes ?
- comment je peux gérer des variables d'environnement de manière sécurisée ?
- comment je vais charger les données du serveur ? Comment je traite les erreurs de ces chargements ?

Et puis cela permet de mutualiser du code entre le back et le front, de n'avoir qu'un dépôt logiciel pour toute l'application, et d'avoir des niveaux de réglages plus fins pour déplacer du code entre back et front, notamment le rendu des pages.

Enfin, nodejs est, après Dart, [le langage interprété le plus performant](https://blog.iroco.co/backend-benchmark/), ce qui a aussi des implications au niveau [scope 2](https://boavizta.org/blog/empreinte-de-la-fabrication-d-un-serveur) sur l'empreinte des applications.

# Tests de charge

Mesurons la différence avec notre backend python/pyramid. Nous implémentons le login dans l'app svelte/sveltekit et nous le comparons avec python. Dans les deux cas le code fait la même chose : il récupère le nom d'utilisateur et le mot de passe, vérifie le mot de passe et génère un Json Web Token.

![login](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/docs/images/login.drawio.svg)

## Injection par le backend

Nous testons dans un premier temps uniquement la partie backend avec [apache bench](https://httpd.apache.org/docs/2.4/programs/ab.html) :

![bench backend](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/docs/images/bench_back.drawio.svg)

Première surprise, nodejs fait beaucoup moins bien que python :

![résultats ab login](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/docs/images/benchs/login_ab_chart.png)

Peut-être est-ce du à la partie cryptographique lors de la construction du JWT. Nous essayons de modifier le code des deux apps pour aller juste chercher l'utilisateur en base de données :

![résultats ab get user](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/docs/images/benchs/get_user_ab_chart.png)

La tendance s'inverse. C'est probablement les bindings C/C++ de python sur la partie crypto qui doit faire la différence. Aller chercher un objet en base de données est plus fréquent que le login, mais nous pourrons nous pencher sur l'optimisation de cette partie en nodejs, notamment car nous décodons régulièrement les JWT pour traiter les requêtes.

## Injection par le frontend

Nous utilisons sélénium avec JMeter pour tester la totalité de l'application :

![bench fullstack](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/docs/images/jmeter-selenium.png)

Le scénario est le suivant :

* Login utilisateur
* Navigation (100 fois)
  * clic sur "Aliases" (accès BDD)
  * clic sur "Mon compte"(accès BDD)
* Logout

![résultats jmeter](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/tir_fullstack_sveltekit_c4/jmeter_chart.png)

Cette fois-ci, la différence est faible (283ms v.s. 270ms soit ~4%) mais elle est à l'avantage de python. Nous n'avons pas été plus loin dans l'analyse de la raison, mais deux hypothèses peuvent être faites :
- le décodage du JWT pour les requêtes (comme ci-dessus dans le premier tir) ;
- la meilleure performance de nginx pour servir les assets du site comparé à sveltekit/nodejs.

# Tests de compatibilité
