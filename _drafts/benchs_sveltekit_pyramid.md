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

Pour sveltekit, nous "compilons" l'app avec l'[adaptateur node](https://github.com/sveltejs/kit/tree/master/packages/adapter-node) et nous lançons l'app avec ndoejs (plutôt que de lancer l'app en mode dev, pour être plus proche des conditions de production). Pour python, nous compilons l'app avec l'[adaptateur statique](https://github.com/sveltejs/kit/tree/master/packages/adapter-static) et nous utilisons nginx pour servir les assets (HTML/JS/CSS/images). Le backend est sollicité avec les appels AJAX de l'app.

![résultats jmeter](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/tir_fullstack_sveltekit_c4/jmeter_chart.png)

Cette fois-ci, la différence est faible (283ms v.s. 270ms soit ~4%) mais elle est à l'avantage de python. Nous n'avons pas été plus loin dans l'analyse de la raison, mais deux hypothèses peuvent être faites :
- le décodage du JWT pour les requêtes (comme ci-dessus dans le premier tir) ;
- la meilleure performance de nginx pour servir les assets du site comparé à sveltekit/nodejs.

Nous constatons globalement que l'app répond aussi bien qu'avec python, et nous voyons également qu'il y a des marges d'amélioration pour le la partie crypto qui nous permettraient de faire encore mieux que l'app python.

Cela dit, quand bien même nous améliorerions les performances de l'app, nous savons que c'est uniquement sur le scope 2 que nous nous situons (c'est à dire principalement la consommation électrique des serveurs), et que cela ne représente qu'une part infime de l'impact environnemental de nos services.

# Tests de compatibilité

Une partie intéressante de sveltekit c'est la possibilité de faire une app en pure HTML. Le *progressive enhancement* permet de faire des formulaires qui fonctionnent sans javascript avec l'utilsation de [`use:enhance`](https://kit.svelte.dev/docs/form-actions#progressive-enhancement-use-enhance) et si le navigateur le permet, la requête sera faite avec AJAX. Ainsi on a le meilleur des deux mondes : l'efficacité si le navigateur est récent et le javascript activé, et la compatibilité pour les vieux navigateurs. Cela permet de lutter contre l'obsolescence programmée.

Nous testons avec une vieille tablette android : la galaxy tab 10.1 P7510 sortie en 2011 avec android 3.1 "Honeycomb". Au démarrage, nous n'arrivons à accéder à aucun site web : les versions de TLS/SSL pour les certificats ne sont pas compatibles avec le navigateur. Nous parvenons quand même à lire les mails avec l'application mail installée.

Nous ne pouvons pas le mettre à jour car la version d'android n'est pas supportée par le playstore. Nous ne pouvons pas non plus mettre à jour le système d'exploitation par la procédure OTA classique. Nous trouvons [une version opensource d'android](https://source.android.com/) qui [a été adaptée pour cette tablette](https://www.getdroidtips.com/aosp-android-nougat-galaxy-tab-10-1/) en 7.1 "Nougat". Nous installons cette version. La tablette permet alors d'aller sur les sites en HTTPS \o/.

<iframe src="https://player.vimeo.com/video/808863331?h=bc33cba824&badge=0&autopause=0&player_id=0&app_id=58479" width="600" height="300" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="iroco-galaxytab"></iframe>

On peut voir que l'ancienne app affiche un écran noir alors que le nouveau permet de se connecter avec le formulaire d'authentification. On constate que le navigateur n'utilise pas javascript, mais que l'app fonctionne malgré cela.

Avec cette amélioration, on pourrait éviter à des personnes de devoir changer d'équipement pour utiliser l'app Iroco. L'impact est au niveau scope 3. Cela pourrait être plus intéressant que l'amélioration des performances du serveur.

## Comment quantifier ?

Comment pourrait-on évaluer l'impact de ce changement ? Une méthode pourrait être :

1. Faire un recensement de tous les mobiles/tablettes android
2. Identifier la part de ceux qui ont été commercialisés en version "Nougat", ou même qui sont compatibles avec cette version (comme notre tablette Galaxy tab)
3. Identifier la dernière version Android compatible avec l'ancien site
4. Estimer ou trouver le nombre d'équipements qui "pourraient" être conservés et faire le ratio avec la totalité des équipements android.

Nous ne sommes pas allés jusqu'à faire cette estimation.

Est-ce que vous auriez des idées pour mesurer l'impact environnemental d'une extension du nombre d'équipements compatible d'un service internet ?
