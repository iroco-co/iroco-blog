---
layout: post
title: Bench vuejs svelte (3/3)
author:
  display_name: Bruno Thomas
tags:
- svelte
- vuejs
- greenIT
- frontend
comments: true
---

Lors de la présentation de nos [résultats sur le bench vuejs/react]({{site.url}}/frontend-benchmark_vue_react) à Boavizta nous avons eu ces retours parmi d'autres :

> pourquoi utiliser un framework ?

> pourquoi pas Svelte ?

La question du framework n'est pas simple, et plus générale que notre app frontend. Avec une casquette de *Software craftsman* ou d'*artisant* il y a deux principes contradictoires qui viennent à l'esprit :

1. Don't [reinvent the wheel](https://fr.wikipedia.org/wiki/R%C3%A9inventer_la_roue) : ne réinventez pas la roue
2. Keep it Simple Stupid ([KISS](https://fr.wikipedia.org/wiki/Principe_KISS)) : gardez votre code super simple

Donc on doit trouver un compromis entre les deux. On pourrait partir en JS pur sans aucun framework avec du `document.querySelector()` et `node.appendChild(document.createElement(...))`, de même pour les tests, le build, mais on va passer beaucoup, beaucoup de temps et risquer de redévelopper en moins bien (roue carrée ou cabossée) des outils qui existent déjà.

C'est aussi une question de contexte : si on avait dans l'équipe quelqu'un qui avait déjà développé dans le code de jQuery ou vuejs et qui avait une vision claire sur un besoin non satisfait, on pourrait éventuellement envisager la possibilité.

# svelte

On en arrive à la deuxième question. On avait déjà lu des articles sur svelte, nouveau framework JS dont le nom résonne avec l'écoconception. Personne ne connaît dans l'équipe alors nous avons regardé la [présentation de Rich Harris au JSCAMP2019](https://www.youtube.com/watch?v=BzX4aTRPzno). Pour la première fois quelqu'un parle de la planète dans la présentation d'un framework (~[24:50](https://youtu.be/BzX4aTRPzno?t=1475)). Rich Harris met en avant la *readability*, le besoin d'écrire moins de code, et de revenir aux fondamentaux du web : du HTML et du javascript. Et puis, quelqu'un qui cite [Martin Fowler](https://martinfowler.com/) et [Frederick P. Brooks](https://fr.wikipedia.org/wiki/Le_Mythe_du_mois-homme) ne peut pas être mauvais. Alors pourquoi ne pas essayer ?

Nous écrivons [notre petite application en svelte](https://github.com/iroco-co/frontend-benchmark/tree/master/svelteWeb). Trois choses apparaissent :

1. svelte n'utilise pas de virtual DOM il modifie le DOM directement
2. svelte génère du code JS/HTML au build et pas au run. C'est à dire que la librairie n'est pas dans le code de production
3. l'empreinte du framework ne se voit quasiment pas dans le code

Pour le moment c'est enthousiasmant :

|   |svelte | vuejs
| ---| --- | ------
| taille du livrable (KB)| 136 | 1384
| nb lignes de code ([sloc](https://github.com/flosse/sloc))| 486  | 684

Le code est clair et la courbe d'apprentissage est douce.

# performance svelte/vuejs

Nous exécutons notre scénario de bench précédent (sans rechargement d'application):

![diagramme](/images/frontend_benchmark/07-run-diagramme.png)

|   |svelte | vuejs
| ---| --- | ------
| moyenne (ms)   | 75.8 | 71.0
| écart type | 13.3 | 11.7

Surprise encore, svelte fait moins bien de 6% que vuejs. Comme le DOM est modifié directement on s'attendait à des résulats meilleurs que vuejs, comme mentionné [ici](https://medium.com/cacher-app/svelte-is-really-fast-45224f57bd86) ou encore [là](https://medium.com/habilelabs/svelte-a-magically-fast-javascript-framework-c854162288dd). Cela montre à quel point vuejs est optimisé.

Pour creuser les différences internes de fonctionnement de svelte et de vue, [cet article](https://www.vuemastery.com/blog/vue-vs-svelte-comparing-framework-internals/) nous a bien éclairé.

# compatibilité navigateur

La comptabilité ES5 pour svelte est moins bien documentée. [Cette discussion](https://github.com/sveltejs/svelte/issues/558) sur le github de svelte indique que des développeurs ont utilisé avec succès des polyfills pour arriver à une comptabilité ES5. Dans cette discussion un des devs donne un lien vers un article qu'il a écrit pour rendre une app svelte [compatible avec IE11](https://blog.az.sg/posts/svelte-and-ie11/).

# synthèse


|  |  react | vuejs | svelte
| ---| --- | ------ | -----
la taille du livrable (KB) | 1256 |1384 | 136
le nombre de lignes de code  | 754 | 684 | 486
compatibilité javascript  | ES5 | ES5 | ES2015 (ES6) (ES5 avec polyfills?)
performance  | ++ | +++ | +++

A l'issue de ces tests nous avons choisi svelte : l'écart de performance avec vuejs est faible, il y a le point de la transpilation en ES5 qui demandra un peu de travail ; mais la philosophie globale du framework colle bien avec ce que nous essayons de construire.
