---
layout: post
title: Benchmark : vuejs vs. reactjs (2/3)
author:
  display_name: Bruno Thomas
tags:
- reactjs
- vuejs
- greenIT
- frontend
comments: true
---

Résumé de l'[épisode précédent]({{site.url}}/frontend-benchmark) : nous avons fait deux applications identiques (une en reactjs et l'autre en vuejs) avec les fonctionnalités suivantes :

* chargement d'une liste de mail ;
* chargement d'un mail lorsque l'on clique sur un mail de la liste.

Nous utilisons l'injecteur [jmeter](https://jmeter.apache.org/) avec le plugin selenium [WebDriver](https://jmeter-plugins.org/wiki/WebDriverTutorial/). Jmeter lance un navigateur et va exécuter le script selenium.

Nous réglons un scénario qui charge la page d'accueil, puis clique sur 10 mails au hasard dans la liste. Nous faisons répérer ce scénario 20 fois.

## 1er tir

Nous obtenons une moyenne de 655ms pour react et 130ms pour vuejs.

![diagramme](/images/frontend_benchmark/01-run-diagramme.png)

La différence est trop importante. En observant de plus près l'application vuejs, nous nous rendons compte que les mails sont juste affichés (titre, date) mais le corps de chaque message n'est pas chargé (la requête ajax n'est pas exécutée).

Par ailleurs, le délai de chargement des pages est assez long : le backend est hébergé chez heroku. Pour diminuer les aléas et les délais de chargement du réseau, nous décidons de faire tourner l'application en local.

Enfin, nous avons utilisé des applications web en mode "développement", c'est-à-dire avec des fonctionnalités supplémentaires pour le debug, et sans minification. Pour le prochain tir, nous allons "transpiler" les applications web avec webpack, et utiliser le code généré servi par le backend.

## 2e tir

![diagramme](/images/frontend_benchmark/02-run-diagramme.png)

Le tir est correct. Nous voyons bien les pics de chaque chargement de la page d'accueil et les temps plus réduits liés aux 10 affichages de mail. Ces résultats posent une question sur les artéfacts présents dans les données de react : il y a des pics similaires à côté du chargement de la page d'accueil. Ce n'est pas le cas pour vuejs qui a un profil plus "propre". Est-ce que react recharge toute la page dans les requêtes suivantes ? Comment expliquer ces pics ?

Par ailleurs, en dehors de ces artefacts, on peut constater une meilleure performance de vuejs.

|   |react | vuejs
| ---| --- | ------
| Moyenne (ms)   | 249 | 124
| Ecart type (ms)| 255 | 143

Le délai mesuré correspond au temps écoulé entre le clic sur un mail et l'affichage d'un élément textuel au bas de la page HTML du message.

## 3e tir

A présent, essayons de voir plus précisément comment le temps est passé par le navigateur, et quelle est la charge induite par l'exécution du javascript. Pour cela, nous allons utiliser des sondes [WebVitals](https://web.dev/vitals/).

Nous changeons également le [scénario du tir](https://github.com/iroco-co/frontend-benchmark/tree/master/reports/05-run-2021-03-30) : nous rechargeons l'app à chaque requête pour voir le chargement complet de la page et de l'affichage. Nous faisons 100 chargements complets.

![analytics react](/images/frontend_benchmark/analytics-react.png)
![analytics vuejs](/images/frontend_benchmark/analytics-vuejs.png)

Les métriques présentées sont :
* TTFB : Time To First Byte ou le délai nécessaire pour que le navigateur reçoive le premier byte de données.
* FCP : First Contentful Paint ou le délai nécessaire à l'affichage du premier contenu du DOM (image, bloc de texte, SVG...).
* LCP : Largest Contentful Paint ou délai nécessaire à l'affichage du plus gros contenu du DOM (en pixels pour image, bloc de texte, SVG...).

Plusieurs surprises dans ces résultats. Premièrement, si on reprend nos mesures de chargement (identiques à celles du tir précédent) react est maintenant légèrement plus rapide que vuejs :

|   |react | vuejs
| ---| --- | ------
| Moyenne (ms)   | 151.1 | 157.9
| Ecart type (ms) | 12.6 | 11.7

Deuxièmement, il y a des anomalies dans le FCP de vuejs avec 6 pics, et des anomalies dans le LCP de react qui passent entre des valeurs autour de 140ms à 50ms. Le LCP de vuejs est stable autour de 140ms. Ce tir et ces métriques sont donc meilleures pour react, avec une certaine incompréhension pour les variations observées (alors que la page est censée être rechargée à chaque requête). Cela pourrait-il être lié à des mécanismes de cache ? Si vous avez des pistes d'explications, nous sommes preneurs.

Sur des tirs suivants, nous avons observé une certaine proximité des performances entre vuejs et react avec un léger avantage pour vuejs - notamment dans les modifications dynamiques du virtual DOM. C'est en conformité avec les résultats de [cette étude](https://rawgit.com/krausest/js-framework-benchmark/master/webdriver-ts-results/table.html) beaucoup plus large que nos tests.

# Compatibilité navigateur

| [reactjs](https://create-react-app.dev/docs/supported-browsers-features/) | [vuejs](https://cli.vuejs.org/guide/browser-compatibility.html)
| --- | ---
| ES5 (IE 9, 10, 11) avec [react-app-polyfill](https://github.com/facebook/create-react-app/blob/main/packages/react-app-polyfill/README.md) | ES5 avec l'option polyfills

# Présentation des résultats

Nous avons partagé ces résultats avec le groupe de travail [Boavizta](https://boavizta.org/), qui travaille sur la mesure d'impact environnemental du numérique des organisations. Vous pouvez consulter notre présentation [du 2 avril 2021](https://github.com/iroco-co/frontend-benchmark/tree/master/slideshow).
