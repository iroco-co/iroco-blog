---
layout: post
title: Benchmark monitoring - Introduction
author:
  name: iroco
categories:
- Sous le capot
tags:
- benchmark
- monitoring
---
# Introduction

[![Exemple de dashboard de Grafana](/images/monitoring-dasboard-benchmark/monitoring.png)](/images/monitoring-dasboard-benchmark/monitoring.png)


## Contexte et enjeux

Nous avons fait un premier benchmark sur les outils de monitoring de type agent. Nous cherchons maintenant à évaluer les outils de génération de graphiques compatibles avec les outils de collecte de métriques que nous avons testés précédemment.
Suite à notre précédent article, nous avons choisit de conserver **Collectd** comme agent. Les prochains articles de ce blog seront donc orientés vers une utilisation compatible avec l'usage d'un agent **Collectd**. Cependant, avec un peu de travail, il semble possible de réaliser le mème type de test avec **Vector** en passant par l'utilisation de Sink Socket (vous pourrez notamment vous inspirer de ce que nous avons fait pou Zabbix).

## Les solutions à étudier

Chaque solution de monitoring doit avoir les caractéristiques suivantes :

- Être compatible avec **Collectd** pour la collecte de métriques.
- Fournir une **interface web**.
- Permettre la création de **graphiques** personnalisés et donc de **stocker les données temporelles**.
- Être capable de gérer des **alertes**.
- Être capable de gérer des **utilisateurs** et des permissions, idéalemnet multi-tenant.
- Être **open-source** ou avoir une version open-source.

Nous nous sommes concentrés sur trois solutions de dashboard open-source, qui sont souvent utilisées pour visualiser les données collectées par des outils de monitoring :
- **Nagios**
- **Zabbix**
- **Graphite** combiné avec **Grafana**
- **InfluxDB** combiné avec **Grafana**

## Objectifs du benchmark

Notre benchmark vise principalement à identifier l'outil le plus simple conceptuellement, le plus simple à installer et maintenir, le moins consommateur en ressources et capable de fournir des graphiques utiles à notre gestion de plateforme. Nous allons également prendre en compte la qualité de la documentation et notre courbe d'apprentissage.

- **CPU** : Pourcentage d'utilisation totale  
- **RAM** : Pourcentage d'utilisation totale  

L'objectif est de tester chaque outil sur ces deux métriques afin de déterminer lequel offre le meilleur compromis entre performance et consommation.

## Démarche méthodologique

### Mise en place du test

Nous avons choisi d'utiliser une version dockerisé officielle pour chaque outils de monitoring. Cela simplifie la configuration et l'installation et nous permet de tester chaque outil dans un environnement isolé. De plus, il existe déjà des images Docker officielles pour chacun de ces outils, ce qui nous a fait gagner du temps lors de la configuration initiale.

### Conditions du test

Nous avons développé un script de benchmark basé sur rrdtool afin de collecter les métriques CPU et RAM de chaque outil de monitoring.

Nous avons tenté de reproduire la même configuration pour chaque outil de monitoring, en utilisant les mêmes paramètres de collecte de métriques et en configurant les mêmes graphiques. Cela nous permet de comparer les résultats de manière équitable. Nous avons fait face à certaines difficultés notamment avec la configuration de Nagios qui ne permet pas la création de dashboard de manière simple depuis sa version open-source disponible avec Docker. Nous nous sommes donc contenté de la version web de Nagios qui ne permet pas de créer des graphiques avec Nagiosgraph.

Afin d'avoir des données significatives, nous les avons configurés pour qu'ils collectent les métriques toutes les secondes et conservent cette résolution (1 apr seconde) sur une période de 24 heures. Cela nous permet de tester la capacité de chaque outil à gérer un volume significatif de données.

### Déroulement du benchmark

Le benchmark doit être lancé sur une machine avec un minimum de processus en cours d'exécution. Chaque outil de monitoring va être lancé les uns après les autres ainsi qu'un bench témoin (_empty_) sur la même durée pour que les résultats soient comparables. Les graphiques seront ensuite agrégés en un seul graphique par métrique pour faciliter la comparaison.


Retrouvez les autres articles de cette série (à venir dans les prochains jours) :

- [Benchmark monitoring - Agents](/monitoring-agents/)
- [Benchmark monitoring - Nagios](/monitoring-nagios/)
- [Benchmark monitoring - Zabbix](/monitoring-zabbix/)
- [Benchmark monitoring - Graphite + Grafana](/monitoring-graphite/)
- [Benchmark monitoring - InfluxDB + Grafana](/monitoring-influxdb)
- [Benchmark monitoring - Conclusion](/monitoring-conclusion/)
