---
layout: post
title: Migration vers une technologie plus responsable. (2/3)
author:
  display_name: Barnabé Geffroy
tags:
- rust
- python
- greenIT
- backend
comments: true
---


# Benchmark sur laptop


Comme décrit dans l'article sur l'impact des différents langages, ceux-ci n'ont nous avons nous avons donc décidé d'effectuer un benchmark pour déterminer l'utilité d'une migration de technologie de Python à Rust. Ac

## Protocole

Ce benchmark prend en compte trois facteurs : 

* La vitesse d'exécution
* L'énergie nécessaire
* La CPU utilisée

Il a été réalisé à l'aide d'un laptop HP EliteBook G40 G3 avec une distribution Ubuntu 20.04.1

Les outils utilisés sont :

* Les injecteurs [`ab`](https://httpd.apache.org/docs/2.4/fr/programs/ab.HTTP) et [`jmeter`](https://jmeter.apache.org/) qui envoie au serveur un nombre de requêtes donné à partir d'un ordinateur du réseau.
* [`Scaphandre`](https://github.com/hubblo-org/scaphandre) qui permet de mesurer la puissance des process d'une machine.
* La commande [`ps`](https://man7.org/linux/man-pages/man1/ps.1.HTTP) pour mesurer la CPU utilisée par les serveurs. 

Nous avons donc un serveur Python et un serveur Rust de type CardDav (asynchrone et threading) proposant les mêmes fonctionnalités.

## Résultats

Une dizaine de tirs ont été réalisés. Les résultats montrent que Rust est plus rapide et nécessite moins d'énergie et de CPU que Python.

Voici un exemple sur un tir de 500 000 requêtes et 4 concurrences injectés sur le Raspberry Pi depuis le HP EliteBook. Les chiffres exposés ci-dessous sont relatifs et dépende différents facteurs (OS, connexion au réseau, ...). Toutefois, les tirs entre Rust et Python avait exactement les mêmes environnement et configuration.

Nous obtenons une moyenne de 5,722ms par requête pour Rust et 21,394ms pour Python : 

![Image : Résultats sur la vitesse]({{ site.url }}/images/backend_benchmark/time.png)

En ce qui concerne la puissance, Rust nécessite plus de puissance sur l'instant mais pendant moins longtemps. Le serveur Rust nécessite ainsi moins d'énergie que Python : 

![Image : Résultats sur la puissance]({{ site.url }}/images/backend_benchmark/W.png)

En qui concerne la CPU utilisée, nous avons le même constat que pour la consommation électrique. Rust utilise plus de CPU mais pendant moins longtemps : 

![Image : Résultats sur la CPU]({{ site.url }}/images/backend_benchmark/CPU.png)

Nous remarquons que Rust sollicite beaucoup plus la base de données que Python. Nous retrouvons encore ici l'efficacité de Rust qui reporte la charge à la base de données.Les tâches de calcul (traitement des requêtes HTTP, envoi des requêtes SQL vers la base, sérialisation des objets en JSON) sont effectuées tellement rapidement que l'injection de trafic HTTP est converti en injection de requêtes SQL vers la base. Pour le serveur Python ce traitement prend plus de temps, ce qui fait que la base est relativement moins sollicitée (courbe bleu clair).

Rust se décharge également plus vite après la fin du tir. Le langage a effet une utilisation plus dynamique de la machine, probablement car le code est exécuté par l'OS directement sans passer par un interpréteur.

Dans un autre tir, nous avons relevé la distribution du temps de réponses des requêtes : 

![Image : Distributions du temps de réponses des requêtes]({{ site.url }}/images/backend_benchmark/distribution.png)

Nous pouvons voir que Rust est beaucoup plus constant que Python. Rust présente ainsi un autre avantage par rapport à Python, il est beaucoup plus régulier que Python.  

De plus, des tirs plus conséquents (30 000 000 de requêtes) ont été réalisés pour tester l'endurance du serveur Rust. Nous obtenons une moyenne du temps d'exécution similaire aux tirs avec de plus faibles nombres de requêtes. Aucun crash ni d'augmentation de la mémoire prouve encore la stabilité  de la technologie Rust. 

## Conclusion 

Notre benchmark valide qu'une migration d'une implémentation en langage Rust qu'un Python permet de réduire l'impact du serveur. Rust apporte également une vitesse de réponse plus élevé et plus stable. 

Nous ne nous attendions pas à une différence aussi importante entre les deux technologies. Il existe en effet deux problématiques de performance en informatique :
- l'optimisation liée à la CPU (puissance de calcul)
- l'optimisation liée aux entrées/sorties (réseau et gestion de fichiers)

Or le serveur web de contact (de type cardDav) testé dans ce benchmark est essentiellement "I/O bound". Comme nous utilisons une implémentation Python asynchrone et du threading, nous nous attendions à des écarts de performance relativement faibles.


Ainsi, ces résultats nous permettent de proposer un service avec un nombre de machines réduit et donc d'économiser plus de ressources premières et énergétiques.

Nous allons maintenant effectuer ces tests sur une machine de plus faible puissance : le Raspberry Pi.

[Lien vers l'article suivant]