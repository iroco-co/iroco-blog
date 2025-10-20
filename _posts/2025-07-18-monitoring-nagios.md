---
layout: post
title: Benchmark monitoring - Nagios
authors:
  - arthur
  - bruno
categories:
- Sous le capot
tags:
- benchmark
- monitoring
---


[![Exemple de dashboard de Grafana](/images/monitoring-dasboard-benchmark/Pres_nagios.png)](https://www.nagios.org/)

**Description** : Né en 1999, Nagios s’appuie sur une configuration textuelle (nombreux fichiers de conf) avec un noyau central et un vaste écosystème de plugins pour surveiller les services réseau, les hôtes et équipements. Originellement open-source, il ne l'est aujourd'hui que partiellement (licence GPLv2) avec des plugins payants. Il est souvent utilisé dans les entreprises pour sa robustesse et sa fiabilité, mais son interface web est vieillissante et peu intuitive. Il est compatible avec un grand nombre de logiciels différents, mais nécessite une configuration complexe pour fonctionner comme attendu notamment pour fonctionner avec collectd.

**Docker** : Il existe un docker Nagios qui permet de le déployer facilement avec Nagiosgraph. Il est disponible sur [Docker Hub](https://hub.docker.com/r/jasonrivers/nagios).

**Alternative** :   Il existe un fork open-source de Nagios appelé [**Icinga**](https://icinga.com/) qui propose une interface web moderne de nagios, mais nous ne l'avons pas testé car il ne propose pas de création de graphiques ni de stockage de données sur sa version Docker officiel. Il est donc nécessaire de le coupler avec un outil externe comme **Nagiosgraph** ou **Graphite + Grafana**.

## Structure

[![Schéma descriptif du fonctionnement de Nagios](/images/monitoring-dasboard-benchmark/Schema_nagios.png)](https://www.nagios.org/)

  - **Nagios-Core** : Gère la surveillance des métriques, les utilisateurs et les notifications. Il fournit l'interface web.
  - **Nagiosgraph** : Utilise **RRDTool** pour stocker les données en séries temporelles et générer des graphiques.
  - **Interface Web** : Permet de visualiser l'état des services et hôtes.
  - [**collectd-nagios**](https://www.collectd.org/documentation/manpages/collectd-nagios.html) : Un utilitaire tiers qui convertit les données de Collectd en un format que Nagios peut comprendre. Il est utilisé pour intégrer Collectd avec Nagios.
  - **check_collectd_combined.sh**: Combine les métriques de Collectd par services (RAM, CPU, Disk File, Network) et les affiche dans un mème graphique.

## Configuration

### Service de formatage des séries de données

Nous avons installé l'utilitaire [**collectd-nagios**](https://www.collectd.org/documentation/manpages/collectd-nagios.html) pour utiliser Collectd avec Nagios.

### Script shell

Nous avons écrit un script [**check_collectd_combined.sh**](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/nagios/Custom-Nagios-Plugins/check_collectd_combined.sh) pour récupérer des métriques multi-critères (Comme la CPU: user/system/idle).

### Fichiers de configuration

- [**/etc/nagios/objects/templates.cfg**](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/nagios/nagios/etc/objects/templates.cfg) : Fichier de configuration des templates pour la configuration du template (fréquence de récupération des données, type) de tous les services (RAM, CPU, Disk File, Network) qui utilisent Collectd.
- [**/etc/nagios/objects/localhost.cfg**](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/nagios/nagios/etc/objects/localhost.cfg) : Fichier de configuration de l'hôte local pour la configuration des services basés sur notre template. C'est ici que nous définissons le nom des métriques pour chaque service.
- [**/etc/nagios/objects/commands.cfg**](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/nagios/nagios/etc/objects/commands.cfg) : Fichier de configuration pour récupérer les données collectd du script [**check_collectd_combined.sh**](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/nagios/Custom-Nagios-Plugins/check_collectd_combined.sh).
- [**/etc/nagiosgraph/nagiosgraph.conf**](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/nagios/nagiosgraph/etc/nagiosgraph.conf) : Fichier de configuration des graphiques et des bases de données en *time series* **RRDTool** utilisé par **NagiosGraph**.

## Résultats

### Observations

Une première observation est que Nagios et Collectd ne sont pas directement compatibles : Nagios ne peut pas directement lire les données envoyées par Collectd. Nous avons utilisé un l'utilitaire [**collectd-nagios**](https://www.collectd.org/documentation/manpages/collectd-nagios.html). Cela nécessite une configuration supplémentaire, mais assure l'intégration de Collectd dans Nagios. La configuration de Nagios doit être modifiée à chaque ajout de variable observée dans Collectd ce qui rend l'évolution du système fastidieuse. Peut-être l'agent Nagios ([NCPA](https://www.nagios.org/projects/ncpa/)) fournit plus de dynamisme dans la configuration des métriques.

### Performances

#### CPU

[![Graphique d'utilisation CPU de Nagios sur les 3600 dernières secondes.](/images/monitoring-dasboard-benchmark/nagios_cpu_usage.png)](/images/monitoring-dasboard-benchmark/nagios_cpu_usage.png)

Nagios est peu gourmand en CPU. On observe une utilisation moyenne de **22,71%** de celui-ci. De plus, son utilisation est stable dans le temps, ce qui est un bon point pour la fiabilité de l'outil.

#### RAM

[![Graphique d'utilisation mémoire de Nagios sur les 3600 dernières secondes.](/images/monitoring-dasboard-benchmark/nagios_memory_usage.png)](/images/monitoring-dasboard-benchmark/nagios_memory_usage.png)

Nagios est économe en RAM également. On en observe une utilisation moyenne de **2,99%**. De plus, son utilisation est stable dans le temps. Il ne semble pas y avoir de fuite mémoire

## Conclusion

Nagios est un outil de monitoring robuste et fiable. Il offre de bonnes performances en termes de consommation CPU et RAM.
Cependant, sa configuration avec de nombreux fichiers est statique, notamment pour intégrer Collectd. Dans sa version opensource l'interface web n'a pas beaucoup évolué et ne permet pas de créer simplement des dashboards.

ÉDITE (28/08/2025): 
- nouveau tir pour clarifier les résultats CPU et RAM.
- correction du scripte de benchmark mesure qui consommait de la mémoire.

Retrouvez les autres articles de cette série (à venir dans les prochains jours) :

- [Benchmark monitoring - Agents](/monitoring-agents/)
- [Benchmark monitoring - Introduction](/monitoring-introduction/)
- [Benchmark monitoring - Zabbix](/monitoring-zabbix/)
- [Benchmark monitoring - Graphite + Grafana](/monitoring-graphite/)
- [Benchmark monitoring - InfluxDB + Grafana](/monitoring-influxdb)
- [Benchmark monitoring - Conclusion](/monitoring-conclusion/)
