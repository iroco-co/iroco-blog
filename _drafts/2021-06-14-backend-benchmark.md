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

Le numérique a un impact non négligeable sur notre planète. Bien que l'empreinte numérique est principalement liée à la fabrication et au recyclages des appareils, proposer un service technologique plus sobre est essentiel pour tendre vers un monde soutenable et désirable.

> Un ordinateur de 2 kg nécessite, 800 kg de matières premières, plusieurs milliers de litres d’eau et émet environ 200 kg de GES du fait de l’utilisation d’énergies fossiles. (ADEME)

C'est pourquoi chez Iroco nous essayons de travailler sur tous les aspects pour proposer des services le plus respectueux possible de l'environnement.


Les langages de programmation ne sont pas épargner, ils n'ont pas tous le même impact. [Une étude de chercheurs portugais](https://sites.google.com/view/energy-efficiency-languages) donne un aperçu de 27 des langages de programmation les plus connus. Ce tableau résume les résultats de cette étude :

![Image : tableau de l'impact des différents langages]({{ site.url }}/images/backend_benchmark/tableau.png)
Source: Photo © [Rui Pereira, Marco Couto, Francisco Ribeiro, Rui Rua, Jácome Cunha,João Paulo Fernandes, and João Saraiva. 2017. Energy Efficiencyacross Programming Languages. InProceedings of SLE’17, Vancouver,BC, Canada, October 23–24, 2017,12 pages](https://dl.acm.org/doi/10.1145/3136014.3136031)

Initialement le serveur HTTP utilisé par Iroco était implémenté avec le langage Python. Or celui-ci présente un score très élevé par rapport à d'autres langages. Nous cherchons alors un langage qui permettrait de réaliser les fonctionnalités du serveur HTTP Python tout en réduisant le coût énergétique et le temps d'exécution du code.

## Rust

Le langage Rust semble alors une alternative convaincante. À 3% du meilleur langage, le C, il présente en effet des résultats beaucoup plus convaincants que Python. Une implémentation d'un serveur HTTP Rust est également plus facile à mettre en place et à maintenir qu'avec des langages tels que le C.

Rust est un langage compilé développé par Mozilla depuis 2010. Il est considéré comme un langage fiable, performant et pratique. 

Son gestionnaire de dépendances, Cargo, ainsi que son compilateur facilitent également son utilisation notamment par les erreurs et la gestion de la mémoire (qui n'est pas le cas du C). Une documentation très fournie et une communauté très active offrent .²

## Benchmark 

### Protocole

Nous avons donc décidé d'effectuer un benchmark pour déterminer l'utilité d'une migration de technologie de Python à Rust. Ce benchmark prend en compte trois facteurs : 

* La vitesse d'exécution
* L'énergie nécessaire
* La CPU utilisée

Il a été réalisé à l'aide sur plusieurs machines différentes :
* un laptop HP EliteBook G40 G3 avec une distribution Ubuntu 20.04.1
* un Raspberry Pi 3 Model B avec une distribution Ubuntu Server 20.04.2 et l'injecteur depuis le laptop HP EliteBook. Cette configuration permet de qualifier également le comportement du serveur sur une machine de faible puissance.

Les outils utilisés sont :

* Les injecteurs [`ab`](https://httpd.apache.org/docs/2.4/fr/programs/ab.HTTP) et [`jmeter`](https://jmeter.apache.org/) qui envoie au serveur un nombre de requêtes donné à partir d'un ordinateur du réseau.
* Un Wattmètre GreenBlue GB202 pour mesurer la puissance de la machine
* La commande [`ps`](https://man7.org/linux/man-pages/man1/ps.1.HTTP) pour mesurer la CPU utilisée par les serveurs. 

![Image : Installation du Raspberry Pi avec le Wattmètre]({{ site.url }}/images/backend_benchmark/instal.png)

Nous avons donc un serveur Python et un serveur Rust de type CardDav (asynchrone et threading) proposant les mêmes fonctionnalités.

### Résultats

Une dizaine de tirs ont été réalisés. Il donne tous des résultats similaires que ce soit sur laptop ou sur le Raspberry Pi : Rust est plus rapide et nécessite moins d'énergie et de CPU que Python.

Voici un exemple sur un tir de 500 000 requêtes et 4 concurrences injectés sur le Raspberry Pi depuis le HP EliteBook. Les chiffres exposés ci-dessous sont relatifs et dépende différents facteurs (OS, connexion au réseau, ...). Toutefois, les tirs entre Rust et Python avait exactement les mêmes environnement et configuration.

Nous obtenons une moyenne de 5,722ms par requête pour Rust et 21,394ms pour Python : 

![Image : Résultats sur la vitesse]({{ site.url }}/images/backend_benchmark/time.png)

En ce qui concerne la puissance, Rust nécessite plus de puissance sur l'instant mais pendant moins longtemps. Le serveur Rust nécessite ainsi moins d'énergie que Python : 

![Image : Résultats sur la puissance]({{ site.url }}/images/backend_benchmark/W.png)

En qui concerne la CPU utilisée, nous avons le même constant que pour la consommation électrique. Rust utilise plus de CPU mais pendant moins longtemps : 

![Image : Résultats sur la CPU]({{ site.url }}/images/backend_benchmark/CPU.png)

Nous remarquons que Rust sollicite beaucoup plus la base de données que Python. Nous retrouvons encore ici l'efficacité de Rust qui reporte la charge à la base de données.Les tâches de calcul (traitement des requêtes HTTP, envoi des requêtes SQL vers la base, sérialisation des objets en JSON) sont effectuées tellement rapidement que l'injection de trafic HTTP est converti en injection de requêtes SQL vers la base. Pour le serveur Python ce traitement prend plus de temps, ce qui fait que la base est relativement moins sollicitée (courbe bleu clair).

Rust se décharge également plus vite après la fin du tir. Le langage a effet une utilisation plus dynamique de la machine, probablement car le code est exécuté par l'OS directement sans passer par un interpréteur.

Dans un autre tir, nous avons relevé la distribution du temps de réponses des requêtes : 

![Image : Distributions du temps de réponses des requêtes]({{ site.url }}/images/backend_benchmark/distribution.png)

Nous pouvons voir que Rust est beaucoup plus constant que Python. Rust présente ainsi un autre avantage par rapport à Python, il est beaucoup plus régulier que Python.  

De plus, des tirs plus conséquents (30 000 000 de requêtes) ont été réalisés pour tester l'endurance du serveur Rust. Nous obtenons une moyenne du temps d'exécution similaire aux tirs avec de plus faibles nombres de requêtes. Aucun crash ni d'augmentation de la mémoire prouve encore la stabilité  de la technologie Rust. 

Le rapport des tirs du laptop sont disponibles sur ce dépôt et donnent des détails sur les tirs réalisés : <https://github.com/iroco-co/backend-benchmark/blob/main/reports/index.md>. Les résultats y sont similaires à ceux du Raspberry Pi.

### Conclusion 

Notre benchmark valide qu'une migration d'une implémentation en langage Rust qu'un Python permet de réduire l'impact du serveur. Rust apporte également une vitesse de réponse plus élevé et plus stable. 

Nous ne nous attendions pas à une différence aussi importante entre les deux technologies. Il existe en effet deux problématiques de performance en informatique :
- l'optimisation liée à la CPU (puissance de calcul)
- l'optimisation liée aux entrées/sorties (réseau et gestion de fichiers)

Or le serveur web de contact (de type cardDav) testé dans ce benchmark est essentiellement "I/O bound". Comme nous utilisons une implémentation Python asynchrone et du threading, nous nous attendions à des écarts de performance relativement faibles.


Ainsi, ces résultats nous permettent de proposer un service avec un nombre de machines réduit et donc d'économiser plus de ressources premières et énergétiques. Les tests sur le Raspberry Pi montrent également que le service peut tourner de manière efficace sur des machines avec des petites configurations. 