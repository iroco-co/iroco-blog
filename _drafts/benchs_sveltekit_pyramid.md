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

# Pourquoi s'être lancé dans cette migration ?

Nous [avions déjà porté](https://blog.iroco.co/frontend-benchmark_vue_svelte/) le frontend de l'app et l'accueil de notre site en [Svelte](https://svelte.dev/). C'est alors que sveltekit [a été releasé en version 1.0](https://svelte.dev/blog/announcing-sveltekit-1.0) (le 14 décembre 2022). Nous y avons vu une opportunité de continuer le mouvement que nous avions amorcé.

Svelte est un framework orienté composant (avec le triptyque JS/Typescript, HTML et style comme en vueJS ou en React). Sa particularité c'est qu'il est utilisé au build et non au run : la dépendance à svelte n'est pas déployée, elle est utilisée uniquement dans les dépendances "dev".

Sveltekit est le prolongement de svelte : il permet d'intégrer un backend en nodejs. Cela [répond aux questions](https://svelte.dev/blog/announcing-sveltekit-1.0) (entre autres):

- comment structurer mon code ?
- comment faire du *serverside rendering* ?
- comment faire le routage des requêtes ?
- comment je peux gérer des variables d'environnement de manière sécurisée ?
- comment je vais charger les données du serveur ? Comment je traite les erreurs de ces chargements ?

Et puis cela permet de mutualiser du code entre le back et le front, de n'avoir qu'un dépôt logiciel pour toute l'application, et d'avoir des niveaux de réglages plus fins pour déplacer du code entre back et front, notamment le rendu des pages.

Enfin, nodejs est, après Dart, [le langage interprété le plus performant](https://blog.iroco.co/backend-benchmark/), ce qui a aussi des implications au niveau [scope 2](https://boavizta.org/blog/empreinte-de-la-fabrication-d-un-serveur) sur l'empreinte des applications.

# Tests de charge

## Injection par le backend



## Injection par le frontend



# Tests de compatibilité
