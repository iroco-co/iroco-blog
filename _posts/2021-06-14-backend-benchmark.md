---
layout: post
title: Migration vers une technologie plus responsable. (1/3)
author:
  display_name: Barnabé Geffroy
tags:
- rust
- python
- greenIT
- backend
comments: true
---


# Des langages plus écolos ?

## Constat

Le numérique a un impact non négligeable sur notre planète. Bien que l'empreinte numérique est principalement liée à la fabrication et au recyclage des appareils, proposer un service technologique plus sobre est essentiel pour tendre vers un monde soutenable et désirable.

> Un ordinateur de 2 kg nécessite 800 kg de matières premières, plusieurs milliers de litres d’eau et émet environ 200 kg de gaz à effet de serre du fait de l’utilisation d’énergies fossiles. (ADEME)

C'est pourquoi chez Iroco nous essayons de travailler sur tous les aspects pour proposer des services numériques plus respectueux de l'environnement.


Les langages de programmation ne sont pas épargnés et n'ont pas tous le même impact. [Une étude de chercheurs portugais](https://sites.google.com/view/energy-efficiency-languages) donne un aperçu de 27 des langages de programmation les plus connus. La vitesse d'exécution, l'énergie requise et la taille du fichier sont comparées sur une série d'algorithmes identiques pour ces 27 langages. Ce tableau résume les résultats de cette étude :

![Image : tableau de l'impact des différents langages]({{ site.url }}/images/backend_benchmark/tableau.png)
Source: Photo © [Rui Pereira, Marco Couto, Francisco Ribeiro, Rui Rua, Jácome Cunha,João Paulo Fernandes, and João Saraiva. 2017. Energy Efficiencyacross Programming Languages. InProceedings of SLE’17, Vancouver,BC, Canada, October 23–24, 2017, 12 pages](https://dl.acm.org/doi/10.1145/3136014.3136031)

Les résultats sont normalisés par rapport au langage ayant obtenu le meilleur score.

Nous pouvons constater que certains langages sont plus vertueux que d'autres. Le langage C détient la médaille d'or. Rust et C++ sont également de bons élèves, tandis que les bonnets d'ânes sont attribués aux langages interprétés tels que Python.

Initialement, le serveur HTTP utilisé par Iroco était implémenté avec le langage Python. Or celui-ci présente un score plus mauvais que beaucoup d'autres langages. Nous cherchons alors un langage qui permettrait de réaliser les fonctionnalités du serveur HTTP Python tout en réduisant le coût énergétique et le temps d'exécution du code.

## Rust

![Image : Logo du langage Rust]({{ site.url }}/images/backend_benchmark/rust.jpg)

Source: Photo © [get wallpaper](https://getwallpapers.com)

Le langage Rust semble une alternative convaincante. À 3% du meilleur langage, le C, il présente des résultats beaucoup plus convaincants que Python. Une implémentation d'un serveur HTTP Rust est également plus facile à mettre en place et à maintenir qu'avec des langages tels que le C.

Rust est un langage compilé développé par Mozilla depuis 2010. Il est considéré comme un langage fiable, performant et pratique.

Son gestionnaire de dépendances, Cargo, ainsi que son compilateur facilitent également son utilisation notamment par les erreurs et la gestion de la mémoire (ce qui n'est pas le cas du C). Une documentation très fournie et une communauté très active sont des composantes de Rust qui en font un langage très agréable d'utilisation.

## Benchmarks

Pour confirmer les résultats de cette étude, nous allons effectuer notre propre benchmark afin de nous assurer du gain d'une telle migration : c'est l'objet du prochain article de cette série.
