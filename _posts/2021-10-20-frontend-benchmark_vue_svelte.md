---
layout: post
title: Benchmark vuejs vs. svelte (3/3)
author:
  display_name: Bruno Thomas
tags:
- svelte
- vuejs
- greenIT
- frontend
comments: true
---

Lors de la présentation de nos [résultats sur le benchmark vuejs/react]({{site.url}}/frontend-benchmark_vue_react) au groupe de travail Boavizta, nous avons eu ces retours parmi d'autres :

> Pourquoi utiliser un framework ?

> Pourquoi pas Svelte ?

La question du framework n'est pas simple et plus générale que notre application frontend. Avec une casquette de *software craftsman* ou d'*artisan*, il y a deux principes contradictoires qui viennent à l'esprit :

1. Don't [reinvent the wheel](https://fr.wikipedia.org/wiki/R%C3%A9inventer_la_roue) : ne réinventez pas la roue, utilisez des outils déjà existants qui font ce que vous voulez faire.
2. Keep it Simple Stupid ([KISS](https://fr.wikipedia.org/wiki/Principe_KISS)) : gardez votre code super simple, ne faites pas appel à des usines à gaz inutiles.

Nous devons donc trouver un compromis entre les deux. Nous pourrions utiliser du JavaScript pur sans aucun framework avec du `document.querySelector()` et `node.appendChild(document.createElement(...))`, de même pour les tests et le build. Mais nous allons passer beaucoup, beaucoup de temps à coder et risquer en plus de redévelopper en moins bien des outils qui existent déjà, donc se retrouver avec une roue carrée ou cabossée.

C'est aussi une question de contexte : nous n'avons pas dans l'équipe quelqu'un qui a déjà développé dans le code de jQuery ou vuejs et qui pourrait avoir une vision claire sur un besoin non satisfait.

# Svelte

Nous en arrivons à la deuxième question. Nous avions déjà lu des articles sur Svelte, nouveau framework JS dont le nom résonne avec l'écoconception. Personne ne connaît Svelte dans l'équipe. Nous avons alors regardé la [présentation de Rich Harris au JSCAMP2019](https://www.youtube.com/watch?v=BzX4aTRPzno) : pour la première fois, quelqu'un parle de la planète dans la présentation d'un framework (~[24:50](https://youtu.be/BzX4aTRPzno?t=1475)). Rich Harris met en avant la *readability*, le besoin d'écrire moins de code, et de revenir aux fondamentaux du web : du HTML et du javascript. Et puis, quelqu'un qui cite [Martin Fowler](https://martinfowler.com/) et [Frederick P. Brooks](https://fr.wikipedia.org/wiki/Le_Mythe_du_mois-homme) ne peut pas être complètement mauvais. Alors, pourquoi ne pas essayer ?

Nous écrivons [notre petite application en Svelte](https://github.com/iroco-co/frontend-benchmark/tree/master/svelteWeb). Trois choses apparaissent :

1. Svelte n'utilise pas de virtual DOM ; il modifie le DOM directement.
2. Svelte génère du code JS/HTML au build et pas au run. C'est-à-dire que la librairie n'est pas dans le code de production.
3. L'empreinte du framework ne se voit quasiment pas dans le code.

Pour le moment, c'est enthousiasmant :

|   |Svelte | vuejs
| ---| --- | ------
| Taille du livrable (KB)| 136 | 1384
| nb lignes de code ([sloc](https://github.com/flosse/sloc))| 486  | 684

Le code est clair et la courbe d'apprentissage est douce.

# Performance svelte/vuejs

Nous exécutons notre scénario de benchmark précédent (sans rechargement d'application) :

![diagramme](/images/frontend_benchmark/07-run-diagramme.png)

|   |Svelte | vuejs
| ---| --- | ------
| Moyenne (ms)   | 75.8 | 71.0
| Ecart type | 13.3 | 11.7

Surprise encore, Svelte fait moins bien de 6% que vuejs. Comme le DOM est modifié directement, nous nous attendions à des résultats meilleurs que vuejs, comme mentionné [ici](https://medium.com/cacher-app/svelte-is-really-fast-45224f57bd86) ou encore [là](https://medium.com/habilelabs/svelte-a-magically-fast-javascript-framework-c854162288dd). Cela montre à quel point vuejs est optimisé.

Pour creuser les différences internes de fonctionnement de Svelte et de vuejs, [cet article](https://www.vuemastery.com/blog/vue-vs-svelte-comparing-framework-internals/) nous a éclairés.

# Compatibilité navigateur

La compatibilité ES5 pour Svelte est moins bien documentée. [Cette discussion](https://github.com/sveltejs/svelte/issues/558) sur le github de Svelte indique que des développeurs ont utilisé avec succès des polyfills pour arriver à une compatibilité ES5. Dans cette discussion, un des développeurs donne un lien vers un article qu'il a écrit pour rendre une app Svelte [compatible avec IE11](https://blog.az.sg/posts/svelte-and-ie11/).

# Synthèse


|  |  react | vuejs | svelte
| ---| --- | ------ | -----
Taille du livrable (KB) | 1256 |1384 | 136
Nombre de lignes de code  | 754 | 684 | 486
Compatibilité javascript  | ES5 | ES5 | ES2015 (ES6) (ES5 avec polyfills?)
Performance  | ++ | +++ | +++

A l'issue de ces tests, nous avons choisi Svelte : l'écart de performance avec vuejs est faible, il y a le point de la transpilation en ES5 qui demandera un peu de travail ; mais la philosophie globale du framework colle bien avec ce que nous essayons de construire.
