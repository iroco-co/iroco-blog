---
layout: post
title: Migration vers une technologie plus responsable. (3/3)
author:
  display_name: Barnabé Geffroy
tags:
- rust
- python
- greenIT
- backend
comments: true
---


# Benchmark sur Raspberry Pi


Après les résultats concluants un benchmark du serveur Rust sur un laptop, nous essayons maintenant de tester sont efficacité sur une plus petite structure : le Rapsberry Pi.

## Protocole


Le protocole est identique au tir avec le laptop. Nous testons :
* La vitesse d'exécution
* L'énergie nécessaire
* La CPU utilisée

Cette fois-ci le serveur se trouvent sur un Raspberry Pi 3 Model B avec une distribution Ubuntu Server 20.04.2 et l'injecteur sur un laptop HP EliteBook G40 G3 avec une distribution Ubuntu 20.04.1. Cette configuration permet de qualifier le comportement du serveur sur une machine de faible puissance.

Les outils utilisés sont :

* Les injecteurs [`ab`](https://httpd.apache.org/docs/2.4/fr/programs/ab.HTTP) et [`jmeter`](https://jmeter.apache.org/) qui envoie au serveur un nombre de requêtes donné à partir d'un ordinateur du réseau.
* Un Wattmètre GreenBlue GB202 pour mesurer la puissance de la machine
* La commande [`ps`](https://man7.org/linux/man-pages/man1/ps.1.HTTP) pour mesurer la CPU utilisée par les serveurs. 

![Image : Installation du Raspberry Pi avec le Wattmètre]({{ site.url }}/images/backend_benchmark/instal.png)

Les tirs sont encore réalisés sur un serveur Python et un serveur Rust de type CardDav (asynchrone et threading) proposant les mêmes fonctionnalités.

## Résultats

Plusieurs tirs ont été réalisés, ils donnent tous des résultats similaires aux tirs sur laptop.

Voici un exemple sur un tir de 500 000 requêtes et 4 concurrences injectés sur le Raspberry Pi depuis le HP EliteBook. Les chiffres exposés ci-dessous sont relatifs et dépende différents facteurs (OS, connexion au réseau, ...). Nous n'obtiendrons donc pas les mêmes valeurs que les tirs précédents sur laptop. Toutefois, les tirs entre Rust et Python avait exactement les mêmes environnement et configuration.

Nous obtenons une moyenne de 5,722ms par requête pour Rust et 21,394ms pour Python : 

![Image : Résultats sur la vitesse]({{ site.url }}/images/backend_benchmark/time.png)

En ce qui concerne la puissance, le Wattmètre indique que Rust nécessite plus de puissance sur l'instant mais pendant moins longtemps. Le serveur Rust nécessite ainsi moins d'énergie que Python : 

![Image : Résultats sur la puissance]({{ site.url }}/images/backend_benchmark/W.png)

Pour la CPU utilisée, Rust utilise également plus de CPU mais pendant moins longtemps. On observe également les mêmes effets d'utilisation de la base de données et de décharge que sur les tirs du laptop. 

![Image : Résultats sur la CPU]({{ site.url }}/images/backend_benchmark/CPU.png)

Dans un autre tir, nous avons relevé la distribution du temps de réponses des requêtes : 

![Image : Distributions du temps de réponses des requêtes]({{ site.url }}/images/backend_benchmark/distribution.png)

Nous remarquons encore la constance de Rust par rapport à Python, beaucoup plus instable.

De plus, des tirs plus conséquents (30 000 000 de requêtes) ont été réalisés pour tester l'endurance du serveur Rust. Nous obtenons une moyenne du temps d'exécution similaire aux tirs avec de plus faibles nombres de requêtes. Aucun crash ni d'augmentation de la mémoire prouve encore la stabilité  de la technologie Rust. 


## Conclusion 

Ce benchmark confirme les résultats obtenus sur les tests laptop. On y retrouve l'efficacité, la stabilité et l'endurance de Rust même sur une plus petite structure.

Ces résultats montrent donc que le service Rust peut également tourner de manière efficace sur des machines avec des petites configurations. Un cluster de Raspberry Pi pourrait alors être une solution envisageable pour remplacer des serveurs standrards et ainsi avoir un service adapté aux nombres d'utilisateurs.

![Image : Cluster de 750 Raspberry Pi]({{ site.url }}/images/backend_benchmark/cluster_rapsberry.jpg)

Source: Photo © BitScope
