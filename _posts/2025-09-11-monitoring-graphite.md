---
layout: post
title: Benchmark monitoring - Graphite + Grafana
author:
  name: iroco
categories:
- Sous le capot
tags:
- benchmark
- monitoring
---
# Graphite + Grafana

## Présentation

[![Exemple de dashboard de Grafana](/images/monitoring-dasboard-benchmark/Pres_graphite+grafana.png)](https://www.grafana.com/)

### [Graphite](https://graphiteapp.org/)

**Description** : Conçu en 2006 pour collecter, stocker (via Whisper) et visualiser des séries temporelles de données grâce à Carbon et une interface web Graphite-Web graphite est un logiciel open-source modulaire (on peut changer whisper par d'autres technos si besoin). Il est compatible avec un grand nombre de logiciels différents (Icinga, Zabbix, Grafana, etc) mais reste cependant limité dans ses capacités avec sa configuration de base (pas d'alerting) et son interface web est vieillissante.

**Docker** : Il existe une image docker officielle de Graphite disponible sur [Github](https://github.com/graphite-project/docker-graphite-statsd)

### [Grafana](https://grafana.com/)

**Description** : Grafana est une plateforme de représentation graphique de données statistiques en license libre AGPL, lancée en 2013. Elle peut être facilement combinée à Graphite pour fournir une interface web moderne et simple d'utilisation.

**Docker** : Il existe une image docker officielle de Grafana disponible sur [Docker hub](https://hub.docker.com/r/grafana/grafana-oss).

## Structure

[![Schéma descriptif du fonctionnement de Graphite + Grafana](/images/monitoring-dasboard-benchmark/Schema_graphite+grafana.png)](https://graphiteapp.org/)
- [**Graphite**](https://graphiteapp.org/) : logiciel de stockage et de gestion de données temporelles.
- [**Carbon**](https://graphite.readthedocs.io/en/latest/carbon-daemons.html) : composant principale de [**Graphite**](https://graphiteapp.org/) permettant la reception et la gestion des métriques collectées. Sa compatibilité avec **collectd** nous permet de nous passer d'utilitaire externe.
- [**Whisper**](https://graphite.readthedocs.io/en/latest/whisper.html) : composant de [**Graphite**](https://graphiteapp.org/) fournissant le stockage de données temporelles. (peut être remplacé par d'autres technologies si besoin)
- [**Grafana**](https://grafana.com/) : interface utilisateur web, génération de graphiques, alerting et gestion des utilisateurs. Il fonctionne nativement avec graphite.

## Configuration

### Fichiers de configuration

- [**/opt/graphite/conf/storage-schemas.conf** (Graphite)](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/docker_grafana_graphite/graphite/conf/storage-schemas.conf) : Fichier de configuration des schémas de stockage des données Collectd.
- [**docker-compose.yaml**](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/docker_grafana_graphite/docker-compose.yaml) : Docker compose pour lancer Graphite et Grafana.

### Interface Web / BDD (Grafana)

**Data Source** : Nous devons configurer une source de données Graphite dans Grafana pour qu'il utilise les données de Graphite.

**Dashboard** : Nous avons créé un dashboard pour visualiser les données dans Graphana. Grafana permet d'explorer automatiquement les métriques disponibles dans Graphite, ce qui simplifie grandement la création de graphiques.

## Résultats

### Observations

Collectd envoie ses données à Carbon grâce au plugin [write_graphite](https://github.com/jssjr/collectd-write_graphite) qui a été intégré à collectd. Grafana peut explorer les données Collectd/Carbon pour les afficher dans son interface web.

### Performances

#### CPU

[![Graphique d'utilisation CPU de Graphite + Grafana sur les 3600 dernières secondes.](/images/monitoring-dasboard-benchmark/graphite+grafana_cpu_usage.png)](/images/monitoring-dasboard-benchmark/graphite+grafana_cpu_usage.png)

Graphite + Grafana sont moins consommateurs en CPU que Nagios et Zabix avec une utilisation moyenne de **16,06%**. On note une légère augmentation de la CPU sur l'heure de test. C'est peut-être lié à la "chauffe" du serveur qui doit se stabiliser dans le temps.

#### RAM

[![Graphique d'utilisation mémoire de Graphite + Grafana sur les 3600 dernières secondes.](/images/monitoring-dasboard-benchmark/graphite+grafana_memory_usage.png)](/images/monitoring-dasboard-benchmark/graphite+grafana_memory_usage.png)

On en observe une utilisation moyenne de **3,63%** pour la RAM avec également un légère augmentation dans la durée. Comme pour les autres tests, nous faisons l'hypothèse que cela viendrait de les données qui seraient montée en partie en RAM.

### Conclusion

Graphite + Grafana est une solution de monitoring moderne et simple à configurer. Elle est compatible avec Collectd, ce qui permet de découpler la solution de collecte, de stockage et présentation des données. La gestion des utilisateurs est un plus qui permet d'envisager des perspectives multi-tenant. Elle offre de bonnes performances en termes de consommation CPU et RAM.

Nous comprenons que la configuration étendue de ces outils et modules de monitoring permet de les rendre compatibles les uns avec les autres. Il est envisageable de choisir carbon/graphite et d'utiliser cette stack avec avec Icinga2 ou Zabbix pour de futures évolutions. C'est un peu déroutant, mais cela permet d'éviter de devoir prendre tout ou rien d'une solution de monitoring. Il y a quand même certaines affinités qui rendent le déploiement plus simple, nous le verrons plus tard.

Retrouvez les autres articles de cette série (à venir dans les prochains jours) :

- [Benchmark monitoring - Agents](/monitoring-agents/)
- [Benchmark monitoring - Introduction](/monitoring-introduction/)
- [Benchmark monitoring - Nagios](/monitoring-nagios/)
- [Benchmark monitoring - Zabbix](/monitoring-zabbix/)
- [Benchmark monitoring - InfluxDB + Grafana](/monitoring-influxdb)
- [Benchmark monitoring - Conclusion](/monitoring-conclusion/)
