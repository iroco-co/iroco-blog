---
layout: post
title: Benchmark de différents outils de monitoring dashboard
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


## Les outils en compétition

Nous nous sommes concentrés sur trois solutions de dashboard open-source, qui sont souvent utilisées pour visualiser les données collectées par des outils de monitoring :
- **Nagios**: 
- **Zabbix**: 
- **Graphite** combiné avec **Grafana**: 



## Objectifs du benchmark

Notre benchmark vise principalement à identifier l'outil le moins consommateur en ressources, compatible avec Collectd ou vector, et capable de fournir des graphiques de qualité. Nous avons choisi de nous concentrer sur les outils open-source. Nous allons également prendre en compte la simplicité de configuration, d'utilisation et la qualité de la documentation,.

- **CPU** : Pourcentage d'utilisation totale  
- **RAM** : Pourcentage d'utilisation totale  
- **Réseau** : Volume de données en upload (en KB)  

L'objectif est de tester chaque outil sur ces trois métriques afin de déterminer lequel offre le meilleur compromis entre performance et consommation.

## Démarche méthodologique
 

### Mise en place du test
  Affin de simplifier grandement la configuration et l'installation de chaque outil, nous avons choisi d'utiliser des conteneurs Docker. Cela nous permet de tester chaque outil dans un environnement isolé et de garantir que les résultats sont comparables.
  De plus, il existe déjà des images Docker officielles pour chacun de ces outils, ce qui permet de gagner du temps lors de la configuration initiale.

### Conditions du test


### Déroulement du benchmark


---
# Nagios

## Présentation
  - **Origine & Architecture** : Né en 1999, il s’appuie sur une configuration textuelle avec un noyau central et un vaste écosystème de plugins pour surveiller les services réseau, les hôtes et équipements.

  - **Points forts** : Flexibilité via les templates et notifications détaillées, interface web pour une vue d’ensemble.


## Configuration

## Résultats

  Une première observation est que Nagios et Collectd ne sont pas directement compatibles. En effet, Nagios ne peut pas directement lire les données envoyées par Collectd. Cependant, il existe un utilitaire appelé **Collectd-Nagios** qui permet de convertir les données de Collectd en un format que Nagios peut comprendre. Cela nécessite une configuration supplémentaire, mais cela permet d'utiliser Collectd pour surveiller les hôtes et les services dans Nagios. La configuration de Nagios et doit être modifié à chaque ajout de variable observée dans Collectd.
---
# Zabbix

## Présentation
  - **Origine & Architecture** : Outil open source d’entreprise doté d’une architecture distribuée (agents, proxies) et d’une base de données (MySQL/PostgreSQL/Oracle) pour stocker les métriques.

  - **Points forts** : Tableaux de bord dynamiques, auto-découverte, alertes flexibles et configuration centralisée adaptée aux grandes infrastructures.
## Configuration

## Résultats

### Observations 
  Une première observation est qu'il n'existe pas de solution simple pour intégrer Collectd et zabbix. Cependant, il existe un utilitaire, **zabbix-sender**, qui permet d'envoyer des données de Collectd à Zabbix. Cela nécessite une configuration supplémentaire et le développement d'un script pour convertir les données de Collectd en un format que Zabbix peut comprendre. Cependant, cela permet d'utiliser Collectd pour surveiller les hôtes et les services dans Zabbix. La configuration de zabbix doit être modifiée à chaque ajout de variable observée dans Collectd.

---

# Graphite

## Présentation
  - **Origine & Architecture** : Conçu en 2006 pour collecter, stocker (via Whisper) et visualiser des séries temporelles de données grâce à Carbon et une interface web Graphite-Web.
    ![alt text](image.png)
    - Ici, nous remplaçons Graphite-Web par Grafana, qui est plus moderne et intuitive. Graphana permet également nativement la gestion d'alertes.

  - **Points forts** : 
    - Simplicité d’envoi de données et efficacité dans la visualisation, souvent associé à Grafana pour enrichir les dashboards.
     - De plus, graphite est compatible avec de nombreux outils différents:
  ![alt text](image-1.png)
## Configuration

## Résultats
### Observations
  - Une première observation est que Graphite et Collectd sont compatibles. En effet, Collectd peut directement envoyer des données à Graphite grace au plugin **write_graphite** . Cela permet d'utiliser Collectd pour surveiller les hôtes et les services dans Graphite. Graphite explore les données envoyées par Collectd et les affiche dans son interface web. Il est nécessaire de configurer chaque graphique manuellement.


---
# Conclusion


## Tableau récapitulatif des observations

| Outil | Compatibilité avec Collectd | Type de configuration | Technologie de Stockage | Technologie de visualisation | Interface | Performances | Système d'alerte | OpenSource |
|------------ |---------|---------|-------------|-----------| ----------|---|---|---|
|**Nagios**| Compliqué avec Collectd-Nagios | Complexe, Fichiers de conf | rrd | Nagiosgraph -> rrdgraph | Ancienne, peu intuitive | Très bonnes | Oui, non testé | Partiellement, plugins payants (Icnga -> Fork OpenSource) |
|**Zabbix**| Compliqué avec Zabbix-Sender | Moyen-Simple, Base de donnée | choix: mysql/postgresql | Zabbix | Moderne, moyennement intuitive | Moyennes | Oui, testé | Oui|
|**Graphite + Grafana**| Natif | Simple, Base de donnée + fichiers de conf  | whisper | Grafana | Moderne, intuitive | Bonnes | Oui, testé | Oui|

## Tableau récapitulatif des points forts et faibles

|Outil | points forts | points faibles |
|---|---|---|
| **Nagios** | 🟢 Très Bonnes performances <br> 🟢 Outil Approuvé | 🔴 Configuration complexe <br> 🔴 Interface vieillissante <br> 🔴 N'est pas compatible avec collectd nativement <br> 🔴 Documentation éparpillée <br> 🔴 N'est pas totalement OpenSource | 
| **Zabbix** | 🟢 Interface moderne <br> 🟢  Documentation complète <br> 🟢  Plutôt simple à configurer <br> 🟢  Configuration | 🔴 Performances moyennes <br> 🔴 N'est pas compatible avec collectd nativement <br> 🔴 La configuration et les données sont stockées dans la mème bdd |
| **Graphite + Grafana** | 🟢 Interface moderne <br> 🟢  Simple à configurer et à prendre en main <br> 🟢  Compatible avec collectd nativement (Permet l'exploration automatique des métriques disponibles) <br> 🟢  Modularité (Découplage stockage des données et génération de graphs) | 🔴 Performances moins bonne que nagios <br> 🔴  Nécessite deux outils pour fonctionner|