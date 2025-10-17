---
layout: post
title: Benchmark monitoring - Zabbix
author:
  name: iroco
categories:
- Sous le capot
tags:
- benchmark
- monitoring
---
# Zabbix

## Présentation

[![Exemple de dashboard de Zabbix](/images/monitoring-dasboard-benchmark/Pres_zabbix.png)](https://www.zabbix.com/)

**Description** : Zabbix est un outil open source d’entreprise doté d’une architecture distribuée (agents, proxies) et d’une base de données (MySQL/PostgreSQL/Oracle) pour stocker les métriques. Il fournit une interface moderne et un grand nombre de fonctionnalités relatives au monitoring.

**Docker** : Il existe un docker compose officiel de Zabbix qui permet de déployer facilement Zabbix avec une base de données MySQL ou PostgreSQL. Il est disponible sur [Github](https://github.com/zabbix/zabbix-docker).


## Structure

[![Schéma descriptif du fonctionnement de Zabbix](/images/monitoring-dasboard-benchmark/Schema_zabbix.png)](https://www.zabbix.com/)

  - [**Zabbix-server**](https://www.zabbix.com/documentation/7.2/en/manual/appendix/config/zabbix_server) : Noyau central qui gère la gestion des métriques, les utilisateurs et le système d'alerte.
  - **Mysql/PostgreSQL** : Base de données utilisée pour stocker les métriques et la configuration de Zabbix.
  - [**Zabbix-Web-Interface**](https://hub.docker.com/r/zabbix/zabbix-web-service) : Interface web pour visualiser l'état des services et hôtes, ainsi que de configurer Zabbix. C'est également lui qui génère les graphiques.
  - [**zabbix-sender**](https://www.zabbix.com/documentation/current/en/manpages/zabbix_sender) : Un utilitaire tiers qui permet d'envoyer des données à Zabbix. Il utilise le protocole Zabbix trapper avec le script [zabbix-sender.sh](https://github.com/iroco-co/bench-monitoring-dashboard/blob/main/src/zabbix-sender.sh) pour récupérer les métriques de Collectd et les envoyer.

## Configuration

### Interface Web / BDD 

(*Zabbix peut également être configuré via des fichiers de config*)
  
**Data Collection/Hosts** : hôte(s) pour notre serveur de test ;

**Data Collection/Hosts/items** : Configure chaque métrique que nous voulions surveiller (CPU, RAM, Réseau) en utilisant les types de données **Zabbix trapper** et  **Collectd** ;

**Dashboard** : Enfin, nous spécifions un graph par groupe de métriques (CPU, RAM, Réseau, Disk File) pour visualiser les données à partir des métriques définies précédemment.

## Résultats

### Observations

Première observation, il faut utiliser le script  [**zabbix-sender**](https://www.zabbix.com/documentation/current/en/manpages/zabbix_sender) pour intégrer Collectd et zabbix.  La configuration de zabbix doit être modifiée à chaque ajout de variable observée dans Collectd ce qui peut être lourd en cas d'évolution du système.

Zabbix peut être configuré, soit via l'interface web, soit par fichier de conf ce qui le rend flexible.

### Performances

#### CPU

[![Graphique d'utilisation CPU de Zabbix sur les 3600 dernières secondes.](/images/monitoring-dasboard-benchmark/zabbix_cpu_usage.png)](/images/monitoring-dasboard-benchmark/zabbix_cpu_usage.png)

Zabbix est plus gourmand en CPU que nagios. Par ailleurs on observe de très fortes variations, avec des pics à plus de 200%. La moyenne d'utilisation CPU est de **153,62%** là où nagios était à 22,71%. Nous avons des doutes sur l'origine de cette consommation. Il est probable que cela vienne de la méthode que nous employons pour envoyer les données vers zabbix et non pas de zabbix lui mème (à confirmer).

#### RAM

[![Graphique d'utilisation mémoire de Zabbix sur les 3600 dernières secondes.](/images/monitoring-dasboard-benchmark/zabbix_memory_usage.png)](/images/monitoring-dasboard-benchmark/zabbix_memory_usage.png)

Pour la RAM c'est plus proche que ce que nous avions avec nagios : **4,17%** (nagios : 2,99%) . Cependant, il reste une légère augmentation de l'utilisation de la RAM au fil du temps, ce qui pourrait causer des problèmes de performance à long terme. Nous faisons l'hypothèse que cela viendrait de la gestion des données qui serait montée en partie en RAM (à confirmer).

### Conclusion

Zabbix est un outil de monitoring complet et moderne, mais il est intensif en CPU. Il nécessite une configuration supplémentaire pour intégrer Collectd (probablement à l'origine de la forte consommation CPU), ce qui peut être une difficulté supplémentaire en ce qui concerne la maintenabilité. Ou bien il faut déployer l'[agent Zabbix](https://www.zabbix.com/download_agents) sur les serveurs à observer. Dans ce cas, il y a moins d'inter-opérabilité si on veut changer de système de supervision.

Mis à part cela, Zabbix reste assez simple à configurer. Il offre une interface web moderne et une grande flexibilité dans la configuration des graphiques et des alertes. Il est compatible avec les bases de données MySQL et PostgreSQL, ce qui laisse le choix de la technologie de stockage.  Zabbix est entièrement open-source, ce qui est un bon point selon nos critères.

ÉDITE (28/08/2025): 
- nouveau tir pour clarifier les résultats CPU et RAM.
- correction du scripte de benchmark mesure qui consommait de la mémoire.

Retrouvez les autres articles de cette série (à venir dans les prochains jours) :

- [Benchmark monitoring - Agents](/monitoring-agents/)
- [Benchmark monitoring - Introduction](/monitoring-introduction/)
- [Benchmark monitoring - Nagios](/monitoring-nagios/)
- [Benchmark monitoring - Graphite + Grafana](/monitoring-graphite/)
- [Benchmark monitoring - InfluxDB + Grafana](/monitoring-influxdb)
- [Benchmark monitoring - Conclusion](/monitoring-conclusion/)
