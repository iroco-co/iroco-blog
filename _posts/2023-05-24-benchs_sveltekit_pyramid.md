---
layout: post
title: Tests comparatifs SvelteKit / Pyramid
description: Un petit tour sous le capot de nos dernières évolutions techniques.
author:
  name: bruno
categories:
- Sous le capot
- Avancé
tags:
- benchmark
- sveltekit
---

*Comme à notre habitude, nous vous emmenons faire un tour sous le capot pour vous présenter la manière dont évoluent techniquement nos services. Retour sur la migration récente du backend de notre application de [python/pyramid](https://trypyramid.com/) vers [SvelteKit](https://kit.svelte.dev) et sur les améliorations associées.*

# Pourquoi faire cette migration ?

Nous [avions déjà porté](https://blog.iroco.co/frontend-benchmark_vue_svelte/) le frontend de l'application et l'accueil de notre site en [Svelte](https://svelte.dev/). SvelteKit [a été releasé en version 1.0](https://svelte.dev/blog/announcing-sveltekit-1.0) le 14 décembre 2022 : nous y avons vu une opportunité de continuer le mouvement que nous avions amorcé.

Svelte est un framework orienté composant (avec le triptyque JS/Typescript, HTML et style comme en vueJS ou en React). Sa particularité est qu'il est utilisé à la construction du logiciel (build time) et non à l'exécution (runtime) : la dépendance à Svelte n'est donc pas déployée, elle est utilisée uniquement dans les dépendances "dev".

SvelteKit est le prolongement de Svelte : il permet d'intégrer un backend en Node.js. Cela [répond aux questions](https://svelte.dev/blog/announcing-sveltekit-1.0) suivantes (entre autres) :

- comment structurer mon code ?
- comment faire du *serverside rendering* ?
- comment faire le routage des requêtes ?
- comment gérer des variables d'environnement de manière sécurisée ?
- comment charger les données du serveur ? Comment traiter les erreurs de ces chargements ?

Cela permet également de mutualiser du code entre le back et le front, de n'avoir qu'un dépôt logiciel pour toute l'application, et d'avoir des niveaux de réglages plus fins pour déplacer du code entre back et front, notamment concernant le rendu des pages.

Enfin, Node.js est, après Dart, [le langage interprété le plus performant](https://blog.iroco.co/backend-benchmark/), ce qui a aussi des implications au niveau [scope 2](https://boavizta.org/blog/empreinte-de-la-fabrication-d-un-serveur) sur l'empreinte des applications : dit autrement, la consommation d'énergie d'une application tournant en Node.js sera plus faible que celle d'une application utilisant un autre langage interprété (hormis Dart, donc).

# Tests de charge

Nous avons mesuré la différence de performance entre notre backend python/pyramid et une implémentation des mêmes fonctionnalités en Svelte/SvelteKit. Pour cela, nous avons implémenté la fonctionnalité de login dans l'app Svelte/SvelteKit et nous l'avons comparée avec la même fonctionnalité en python. Dans les deux cas le code fait la même chose : il récupère le nom d'utilisateur et le mot de passe, vérifie le mot de passe et génère un Json Web Token (JWT).

![login](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/docs/images/login.drawio.svg)

## Injection par le backend

Nous avons testé dans un premier temps uniquement la partie backend avec [apache bench](https://httpd.apache.org/docs/2.4/programs/ab.html) :

![bench backend](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/docs/images/bench_back.drawio.svg)

L'objectif de cette première série de tests de charge est de comparer la performance des deux implémentations en utilisant le **nombre de requêtes par seconde** comme mesure de référence. Plus ce nombre est élevé, plus l'implémentation est performante.

Première surprise, Node.js fait beaucoup moins bien que python :

![résultats ab login](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/docs/images/benchs/login_ab_chart.png)

Peut-être est-ce dû à la partie cryptographique lors de la construction du JWT. Nous avons alors modifié le code des deux applications pour qu'il se contente d'aller chercher l'utilisateur en base de données :

![résultats ab get user](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/docs/images/benchs/get_user_ab_chart.png)

La tendance s'inverse. Ce sont probablement les bindings C/C++ de python sur la partie cryptographique qui font la différence. Aller chercher un objet en base de données est plus fréquent que le login, mais nous pourrons nous pencher plus tard sur l'optimisation de cette partie en Node.js, notamment car nous décodons régulièrement les JWT pour traiter les requêtes.

## Injection par le frontend

Nous avons utilisé Sélénium avec JMeter pour tester la totalité de l'application :

![bench fullstack](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/docs/images/jmeter-selenium.png)

Cette fois-ci, nous avons comparé la performance des deux implémentations en utilisant comme mesure de référence le **délai moyen de chargement par le navigateur** pour le scénario suivant (plus le délai est court, plus l'application est performante) :

* Login utilisateur
* Navigation (100 fois)
  * clic sur "Alias" (donc accès à la base de données)
  * clic sur "Mon compte" (donc accès à la base de données)
* Logout

Pour SvelteKit, nous avons "compilé" l'application avec l'[adaptateur node](https://github.com/sveltejs/kit/tree/master/packages/adapter-node) et nous l'avons lançée avec Node.js (plutôt que de lancer l'application en mode développement, pour être plus proche des conditions de production). Pour python, nous avons "compilé" l'application avec l'[adaptateur statique](https://github.com/sveltejs/kit/tree/master/packages/adapter-static) et nous avons utilisé nginx pour servir les assets (HTML/JS/CSS/images). Le backend est sollicité avec les appels AJAX de l'application.

![résultats jmeter](https://raw.githubusercontent.com/iroco-co/pyramid-sveltekit-benchmark/main/tir_fullstack_sveltekit_c4/jmeter_chart.png)

Cette fois-ci, la différence est faible (283ms contre 270ms soit ~4%) et à l'avantage de python. Nous n'avons pas été plus loin dans l'analyse de ces résultats, mais deux hypothèses viennent en tête :
- le décodage du JWT pour les requêtes (comme ci-dessus dans le premier tir) ;
- la meilleure performance de nginx pour servir les assets du site comparé à SvelteKit/Node.js.

Nous constatons globalement que l'application répond aussi bien qu'en python. Nous voyons également qu'il y a des marges d'amélioration pour la partie cryptographie qui nous permettraient de faire encore mieux. Cela dit, quand bien même nous améliorerions les performances de l'app, nous savons que ces améliorations n'influent que sur le scope 2 (c'est à dire principalement sur la consommation électrique des serveurs) : or cela ne représente qu'une part infime de l'impact environnemental de nos services.

# Tests de compatibilité

Un aspect intéressant de SvelteKit est la possibilité de faire une application en pure HTML : le *progressive enhancement* permet en effet de faire des formulaires qui fonctionnent sans javascript. Avec l'utilisation de [`use:enhance`](https://kit.svelte.dev/docs/form-actions#progressive-enhancement-use-enhance) et si le navigateur le permet, la requête sera faite en AJAX, sinon le rendu de la page sera retourné par la réponse à la requête POST. Ainsi nous avons le meilleur des deux mondes : l'efficacité si le navigateur est récent et le javascript activé, et la compatibilité avec de vieux navigateurs - ce qui permet de lutter contre l'obsolescence du matériel.

Nous avons testé cet aspect avec une vieille tablette Android : la Galaxy Tab 10.1 P7510 sortie en 2011 avec Android 3.1 "Honeycomb". Au démarrage, nous n'avons réussi à accéder à aucun site web : les versions de TLS/SSL pour les certificats n'étaient pas compatibles avec le navigateur. Nous sommes quand même parvenus à lire les mails avec l'application mail installée.

Nous n'avons pas pu mettre à jour le navigateur car la version d'Android n'était plus supportée par le Playstore. Nous n'avons pas pu non plus mettre à jour le système d'exploitation par la procédure OTA classique. Nous avons alors utilisé [une version opensource d'android](https://source.android.com/) qui [a été adaptée pour cette tablette](https://www.getdroidtips.com/aosp-android-nougat-galaxy-tab-10-1/) en 7.1 "Nougat". Nous avons installé cette version, et la tablette a pu alors se connecter aux sites en HTTPS \o/.

<iframe src="https://player.vimeo.com/video/808863331?h=bc33cba824&badge=0&autopause=0&player_id=0&app_id=58479" width="600" height="300" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="iroco-galaxytab"></iframe>

On peut voir que l'ancienne application (en python/pyramid) affiche un écran noir, alors que la nouvelle permet de se connecter avec le formulaire d'authentification. On constate que le navigateur n'utilise pas javascript, mais que l'app fonctionne bien malgré cela. Avec cette amélioration, nous pouvons éviter à des utilisateurs de devoir changer d'équipement pour utiliser notre application. L'impact est au niveau du scope 3 (fabrication des terminaux), ce qui pourrait être plus intéressant que l'amélioration des performances du serveur.

## Comment quantifier ces gains ?

Comment pourrait-on évaluer l'impact de ce changement ? Une méthode pourrait être par exemple de :

1. Faire un recensement de tous les mobiles/tablettes Android ;
2. Identifier la part de ceux qui ont été commercialisés en version "Nougat", ou qui sont compatibles avec cette version (comme notre tablette Galaxy Tab) ;
3. Identifier la dernière version Android compatible avec notre ancienne app ;
4. Estimer ou trouver le nombre d'équipements qui "pourraient" être conservés et faire le ratio avec la totalité des équipements Android.

Nous ne sommes pas (encore) allés jusqu'à faire cette estimation.

Avez-vous des idées pour mesurer l'impact environnemental d'une extension du nombre d'équipements compatibles avec service internet ?

Retrouvez la présentation liée à cet article [ici](https://iroco-co.github.io/pyramid-sveltekit-benchmark).
