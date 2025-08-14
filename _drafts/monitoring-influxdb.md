---
layout: post
title: Benchmark monitoring - InfluxDB
author:
  display_name: Iroco
categories:
- Sous le capot
tags:
- benchmark
- monitoring
---
# InfluxDB

Après avoir rédigé notre série d'articles sur nos benchmarks sur les options de monitoring, nous avons essayé d'ansibliser notre prototype graphite+grafana. Malheureusement, graphite est un système composé de plusieurs composant avec pour chacun ses propres dépendances python. Nous n'avons pas trouvé de roles ansible de moins de 6 ans et malgrès plusieurs tentatives de mises à jour manuelles, ils nous restaient plusieurs problèmes de compatibilités python. C'est en cherchant des alternatives à graphite compatiblent avec collectd et grafana que nous nous sommes penchés sur influxdb. 

## Présentation

[![Exemple de dashboard de Grafana](../images/monitoring-dasboard-benchmark/Pres_graphite+grafana.png)](https://www.grafana.com/)

**Description** : InfluxDB est une base de données temporelle (time‑series database) conçue en 2013 et qui priorise la rapidité. Il en existe aujourd'hui 3 versions gratuites open source et chacune a sa version entreprise. Influxdb V1 écrit en **Go** est compatible nativement avec collectd sans intermédiaire et n'intègre pas d'interface web. Ses version V2 et V3, écrite en **rust** intègrent bien une interface web mais ne sont pas compatibles avec collectd sans passer par son agent Telegraph.
Toutes es versions s'integrent nativement avec grafana.

**Docker**: Il existe plusieurs [images docker officielles](https://hub.docker.com/_/influxdb/) pour chaque version de Influxdb. Nous avons choisit la plus ressente de la V1: **influxdb:1.11.8**


## Structure

[![Schéma descriptif du fonctionnement de Influxdb + Grafana](../images/monitoring-dasboard-benchmark/Schema_influxdb+grafana.png)](../images/monitoring-dasboard-benchmark/Schema_influxdb+grafana.png)
- [**Influxdb V1**](https://docs.influxdata.com/influxdb/v1/): Base de donnée temporelle qui reçoit les données, les indexe, les stocke et les met à disposition sur le port dédié.
- [**Grafana**](https://grafana.com/) : Plateforme de représentation graphique fournissant une interface web moderne, la génération de graphique, l'alerting et la gestion des utilisateurs. Il se plug directement sur Influxdb ce qui lui permet d'observer les données collectées par ce dernier.

## Configuration

### Fichiers de configuration

- [**/etc/influxdb/influxdb.conf** (InfluxdbV1)](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/docker_grafana_influxdb/influxdb/conf/influxdb.conf) : Fichier de configuration d'influxdb. Ajout de la configuration pour collectd.
- [**docker-compose.yaml**](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/docker_grafana_influxdb/docker-compose.yaml) : Docker compose pour lancer influxdb, Grafana avec un Docker-Network pour la communication.

### Interface Web / BDD (Grafana)

**Data Source** : Nous avons ajouté une source de données Influxdb dans Grafana. Cela permet à Grafana de se connecter à Influxdb et d'explorer les données envoyées par Collectd.

**Dashboard** : Nous avons créé un dashboard pour visualiser les données collectées par Collectd. Nous avons ensuite créé chaque graphique pour qu'il utilise les données envoyées par Collectd. Grafana permet d'explorer automatiquement les métriques disponibles dans Influxdb, ce qui simplifie grandement la création de graphiques.

## Résultats

### Observations

Influxdb V1 est un simple binaire sans dépendances externe et est donc très simple à installer. Il est très accès sur l'efficacité et la vitesse d'execution ce qui est encourageant pour la suite. Il est nativement compatible avec collectd et grafana ce qui le rend très simple à configurer.

### Performances




### Conclusion

InfluxdbV1 + Grafana est la solution de monitoring qui semble la plus adaptée à nos besoins. Le fait de remplacer graphite par influxdb nous a permis de gagner en performances, simplicité du modèle, simplicité de configuration, une réduction considérable des dépendances et donc simplifier l’installation et la maintenance. De plus,cette solution ne se concentre que sur nos besoins sans fonctionnalités superflues. La seule ombre au tableau est que nous devons nous contenter d'une version antérieur(bien que encore maintenue) d'influxdb pour pouvoir avoir une compatibilité native avec collectd. Nous espérons que cette version restera maintenue dans les années à venir.

Retrouvez les autres articles de cette série (à venir dans les prochains jours) :

- [Benchmark monitoring - Agents](/monitoring-agents/)
- [Benchmark monitoring - Introduction](/monitoring-introduction/)
- [Benchmark monitoring - Nagios](/monitoring-nagios/)
- [Benchmark monitoring - Zabbix](/monitoring-zabbix/)
- [Benchmark monitoring - Graphite + Grafana](/monitoring-graphite/)
- [Benchmark monitoring - Conclusion](/monitoring-conclusion/)
