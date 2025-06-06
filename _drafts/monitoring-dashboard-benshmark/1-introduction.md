---
layout: post
title: Benchmark monitoring - Introduction
author:
  display_name: Iroco
categories:
- Sous le capot
tags:
- benchmark
---
# Introduction
## Contexte et enjeux

Nous avons fait un premier benchmark sur les outils de monitoring de collecte de métriques. Nous cherchons maintenant à évaluer les outils de monitoring de type dashboard compatibles avec les outils de collecte de métriques que nous avons testés précédemment.
Nous avons choisi de nous concentrer sur deux outils de monitoring : **Collectd** et **Vector**. Ces outils sont souvent utilisés pour collecter des métriques système et réseau, mais ils peuvent également être utilisés pour surveiller d'autres aspects des systèmes informatiques.

Nous avons fait le choix d'utiliser la version dockerisé officielle des outils de monitoring pour simplifier la configuration et l'installation. Cela nous permet de tester chaque outil dans un environnement isolé et de garantir que les résultats sont comparables. De plus, il existe déjà des images Docker officielles pour chacun de ces outils, ce qui permet de gagner du temps lors de la configuration initiale.


## Les solutions à étudier

Chaque solution de monitoring doit avoir les caractéristiques suivantes :
- Être compatible avec **Collectd** ou **Vector** pour la collecte de métriques.
- Fournir une **interface web**.
- Permettre la création de **graphiques** personnalisés et donc de **stocker les données temporelles**.
- Être capable de gérer des **alertes**.
- Être capable de gérer des **utilisateurs** et des permissions.
- Être **open-source** ou avoir une version open-source.
  
Nous nous sommes concentrés sur trois solutions de dashboard open-source, qui sont souvent utilisées pour visualiser les données collectées par des outils de monitoring :
- **Nagios**
- **Zabbix**
- **Graphite** combiné avec **Grafana**



## Objectifs du benchmark

Notre benchmark vise principalement à identifier l'outil le moins consommateur en ressources, compatible avec Collectd ou vector, et capable de fournir des graphiques de qualité. Nous avons choisi de nous concentrer sur les outils open-source. Nous allons également prendre en compte la simplicité de configuration, d'utilisation et la qualité de la documentation,.

- **CPU** : Pourcentage d'utilisation totale  
- **RAM** : Pourcentage d'utilisation totale  

L'objectif est de tester chaque outil sur ces trois métriques afin de déterminer lequel offre le meilleur compromis entre performance et consommation.

## Démarche méthodologique
 

### Mise en place du test

  Affin de simplifier grandement la configuration et l'installation de chaque outil, nous avons choisi d'utiliser des conteneurs Docker. Cela nous permet de tester chaque outil dans un environnement isolé et de garantir que les résultats sont comparables.
  De plus, il existe déjà des images Docker officielles pour chacun de ces outils, ce qui permet de gagner du temps lors de la configuration initiale.
  C'est aussi une contrainte de notre environnement de test, qui est basé sur Docker. Nous avons donc utilisé les images Docker officielles pour chaque outil de monitoring.

### Conditions du test

Nous avons développé un script de benchmark basé sur rrdtool afin de collecter les métriques CPU et RAM de chaque outil de monitoring.

Nous avons tenté de reproduire la même configuration pour chaque outil de monitoring, en utilisant les mêmes paramètres de collecte de métriques et en configurant les mêmes graphiques. Cela nous permet de comparer les résultats de manière équitable. Nous avons fait face à certaines difficultés notamment avec la configuration de Nagios qui ne permet pas la création de dashboard de manière simple depuis sa version open-source disponible avec Docker. Nous avons donc dû nous contenter de la version web de Nagios qui ne permet pas de créer des graphiques personnalisés.

Afin de pousser l'outil dans ses retranchements, nous avons configuré chaque outil pour qu'il collecte les métriques toutes les secondes et doit conserver cette résolution sur une période de 24 heures. Cela nous permet de tester la capacité de chaque outil à gérer un volume important de données et à fournir des graphiques de qualité.

### Déroulement du benchmark

Le benchmark doit être lancé sur une machine avec un minimum de processus en cours d'exécution. Chaque outil de monitoring va être lancé les uns après les autres ainsi qu'un tir témoin sur une même durée pour que les résultats soient comparables. Les graphiques seront ensuite agrégés en un seul par métrique pour faciliter la comparaison.
