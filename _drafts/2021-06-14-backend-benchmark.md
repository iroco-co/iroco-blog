---
layout: post
title: Backend Benchmark
author:
  display_name: Barnabé Geffroy
tags:
- rust
- python
- greenIT
- backend
comments: true
---


# Migration vers une technologie plus responsable.

## Constat

Les langages de programmation n'ont pas tous le même impact. [Une étude de chercheurs portugais](https://sites.google.com/view/energy-efficiency-languages) donne un aperçu des 27 des langages de programmation les plus connus. Ce tableau résume les résultats de cette étude :

![Image : tableau de l'impact des différents langages]({{ site.url }}/images/backend_benchmark/tableau.png)
Source: Photo © [Rui Pereira, Marco Couto, Francisco Ribeiro, Rui Rua, Jácome Cunha,João Paulo Fernandes, and João Saraiva. 2017. Energy Efficiencyacross Programming Languages. InProceedings of SLE’17, Vancouver,BC, Canada, October 23–24, 2017,12 pages](https://dl.acm.org/doi/10.1145/3136014.3136031)

Initiallement le serveur HTML utilisé par Iroco était implémenté avec le langage Python. Or celui-ci présente un score très élévé par rapport à d'autres langages. Nous cherchons alors un langage qui permettrait de réaliser les fonctionnalités du serveur HTML Python tout en réduisant le coût énergétique et le temps d'exécution du code.

## Rust

Le langage Rust semble alors une alternative convaincante. À 3% du meilleur langage, le C, il présente en effet des résultats beaucoup plus convaincants que Python. Une implémentation d'un serveur HTML Rust est également plus facile à mettre en place et à maintenir qu'avec des langages tels que le C.

Rust est un langage compilé développé par Mozilla depuis 2010. Il est considéré comme un langage fiable, performant et pratique. 

Son gestionnaire de dépendances, Cargo, ainsi que son compilateur facilitent également son utilisation notamment par les erreurs et la gestion de la mémoire (qui n'est pas le cas du C). Une documentation très fournie et une communauté très active offrent .²

## Benchmark 

### Protocole

Nous avons donc décidé d'effectuer un benchmark pour déterminer l'utilité d'une migration de technologie de Python à Rust. Ce benchmark prend en compte trois facteurs : 

* La vitesse d'exécution
* L'énergie nécessaire
* La CPU utilisée

Il a été réalisé à l'aide d'un Raspberry Pi 3 Model B avec une distribution Ubuntu Server 20.04.2.

Les outils utilisés sont :

* Les injecteurs [`ab`](https://httpd.apache.org/docs/2.4/fr/programs/ab.html) et [`jmeter`](https://jmeter.apache.org/) qui envoie au serveur un nombre de requêtes donné à partir d'un ordinateur du réseau.
* Un Wattmètre pour mesurer la puissance de la machine
* La commande [`ps`](https://man7.org/linux/man-pages/man1/ps.1.html) pour mesurer la CPU utilisée par les serveurs. 

Nous avons donc un serveur Python et un serveur Rust proposant les mêmes fonctionnalités.

### Résultats

Une dizaine de tirs ont été réalisés. Il donne tous des résultats similaires : Rust est plus rapide et nécessite moins d'énergie et de CPU que Python.

Voici un exemple sur un tir de 500 000 requêtes et 4 concurrences. 

On obtient une moyenne de 5,722ms par requête pour Rust et 21,394ms pour Python : 

![Image : Résultats sur la vitesse]({{ site.url }}/images/backend_benchmark/time.png)

En ce qui concerne la puissance, Rust nécessite plus de puissance sur l'instant mais pendant moins longtemps. Le serveur Rust nécessite ainsi moins d'énergie que Python : 

![Image : Résultats sur la puissance]({{ site.url }}/images/backend_benchmark/W.png)

En qui concerne la CPU utilisée, nous avons le même constant que pour la consommation électrique. Rust utilise plus de CPU mais pendant moins longtemps : 

![Image : Résultats sur la CPU]({{ site.url }}/images/backend_benchmark/CPU.png)

On remarque également que Rust sollicite beaucoup plus la base de données que Python. Rust délègue à la base des tâches et permet probablement de se décharger plus vite après la fin du tir.

Dans un autre tir, nous avons relevé la distribution du temps de réponses des requêtes : 

![Image : Distributions du temps de réponses des requêtes]({{ site.url }}/images/backend_benchmark/distribution.png)

On remarque que Rust est beaucoup plus constant que Python. Rust présente ainsi un autre avantage par rapport à Python, il est beaucoup plus régulier que Python.  

### Conclusion 

Notre benchmark valide qu'une migration d'une implémentation en langage Rust qu'un Python permet de réduire l'impact du serveur. Rust apporte également une vitesse de réponse plus élevé et plus stable.  