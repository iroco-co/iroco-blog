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


Comme décrit dans l'[article précédent]({{ site.url }}/backend-benchmark), les langages de programations ont un impact sur l'efficacité d'utilisation des machines. Nous avons décidé d'effectuer un benchmark pour déterminer l'utilité d'une migration de technologie de Python à Rust pour une architecture classique [3 tiers](https://fr.wikipedia.org/wiki/Architecture_trois_tiers).

Certains penseront tout de suite (notamment s'ils ont vu le ratio de 75 entre python et rust de l'article précédent)

> c'est plié d'avance de comparer python à rust

Dans [l'étude](https://sites.google.com/view/energy-efficiency-languages) sur les langages les problèmes étudiés étaient relatifs à la CPU : ce sont des programmes qui sont intenses en calcul. Il existe deux problématiques de performance en informatique :
* l'optimisation liée à la CPU (puissance de calcul)
* l'optimisation liée aux entrées/sorties (réseau et gestion de fichiers)

Dans notre cas, c'est à dire un service classique 3 tiers, on ne fait que transmettre de l'information de la base de données vers le client (IO/bound). On ne dépend que des entrées sorties. Or nous utilisons déjà [python asyncio](https://docs.python.org/3/library/asyncio.html) plus du multi-process. On pourrait penser qu'un langage plus performant ne changerait pas grand chose.

Pour en avoir le coeur net, nous faisons le test.

## Protocole

Ce benchmark prend en compte trois facteurs :

* La vitesse d'exécution
* L'énergie nécessaire
* La CPU utilisée

Il a été réalisé à l'aide d'un laptop XPS-13 9370 (16GB RAM, core i7 @ 1.8GHz 8 coeurs) sous Ubuntu 20.04.1 pour le serveur et une tour avec 32GB RAM / core i7-3770K @ 3.5GHz 8 coeurs sous ubuntu 20 également pour l'injecteur.

Les deux machines sont connectées sur un *switch* en filaire.

Les outils utilisés sont :

* Les injecteurs [`ab`](https://httpd.apache.org/docs/2.4/fr/programs/ab.HTTP) et [`jmeter`](https://jmeter.apache.org/) qui envoie au serveur un nombre de requêtes donné à partir d'un ordinateur du réseau.
* [`Scaphandre`](https://github.com/hubblo-org/scaphandre) qui permet de mesurer la puissance des process d'une machine.
* La commande [`top`](https://www.man7.org/linux/man-pages/man1/top.1.html) pour mesurer la CPU utilisée par les serveurs.

Nous avons donc un serveur Python et un serveur Rust de type CardDav (asynchrone et threading) proposant les mêmes fonctionnalités. La base de données Postgresql contient 10 000 contacts. Le scénario de test est la requête pour l'accès aux données d'un contact.

Les deux serveurs sont lancés avec un pool de connexion   

## Résultats

Une dizaine de tirs ont été réalisés.

# Tour de chauffe

Nous lançons `ab` avec 8 utilisateurs qui font 100 000 requêtes au total.
Nous obtenons une latence moyenne de 1.895 ms par requête pour Rust et 2.674 ms pour Python (soit ~30% de mieux pour rust):

![Image : latence]({{ site.url }}/images/backend_benchmark/nb_req_sec.png)

# Puissance et CPU

Après un petit ajustement pour mesurer la CPU en agrégeant sur plusieurs process (car il y a un pool de connexion, et plusieurs workers pour python uvicorn et tokio) nous lançons un tir avec 2 millions de requêtes sur 8 utilisateurs virtuels en parallèle.

Pour la latence on retrouve une différence de 30% entre les deux (avec des chiffres moyens très proches du tir précédent).

Pour la CPU, on constate :
1. que rust consomme la moitié environ de CPU sur moins de temps;
2. que postgresql prend plus de charge avec rust. La charge d'injection est transmise plus directement : les tâches de calcul (traitement des requêtes HTTP, envoi des requêtes SQL vers la base, sérialisation des objets en JSON) sont effectuées tellement rapidement que l'injection de trafic HTTP est converti en injection de requêtes SQL vers la base. Cela explique aussi le point précédent

![Image : CPU]({{ site.url }}/images/backend_benchmark/CPU_xps_top.png)

En ce qui concerne la puissance on mesure des microwatts avec scaphandre. 2.0M représente 2 millions de microwatts soit 2 watt.

Pour python, 8 process sont créés par uvicorn (probablement pour éviter le [GIL](https://wiki.python.org/moin/GlobalInterpreterLock)). La moyenne est environ à 1.25W ce qui sur 8 process fait 10W.

![Image : CPU]({{ site.url }}/images/backend_benchmark/python_power.png)

Pour Rust, on a un process et 8 worker threads qui consomment environ 7W.

![Image : CPU]({{ site.url }}/images/backend_benchmark/rust_power.png)

C'est conforme à la CPU (on peut même deviner des profils de courbe similaires).

## Conclusion

Notre benchmark valide qu'une migration d'une implémentation en Python vers du Rust permet de réduire l'impact du serveur. Rust apporte aussi une latence plus faible, donc une meilleure expérience utilisateur.

Ainsi, ces résultats nous permettent de proposer un service avec un nombre de machines réduit et d'économiser plus de ressources premières et énergétiques.

Nous allons maintenant effectuer ces tests sur une machine de plus faible puissance : le Raspberry Pi.

[Lien vers l'article suivant]
