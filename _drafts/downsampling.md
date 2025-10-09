---
layout: post
title: Downsampling avec Influxdb v1 et Grafana
author:
  display_name: Iroco
categories:
- Sous le capot
tags:
- monitoring
---

_chapeaux_
sute à notre série

# Contexte

Après avoir mis en fonctionnement notre système de monitoring finale composé de Influxdb V1 pour le stockage et grafana pour l'interface graphique et la generation de grafs, il nous est arrivé une nouvelle problématique. Comment faire pour ne pas stocker indéfiniment toutes les données enregistrées sur l'espace disque. En effet, au rythme de chaque métrique toutes les 5 min, notre système de monitoring risque de prendre de plus en plus de place sur notre serveur ce qui n'est pas ce qu'on veut.

Afin de résoudre ce problème, nous avons dû nous informer sur sur un nouveau concepts pour nous, le downsampling de données en time series et la mise en place de politiques de retention.

Le principe est simple. En partant du principe que la précision des données perd en interet avec le temps, il suffit de réduire cette précision lorsque certains delais sont dépassés. Ce qui permet à la fois de gagner de l'espace sur le long termes mais également de se concentrer sur des tendances générales plustot que de se concentrer sur des événements précis. le downsampling correspond alors au processus de réduction de la précision en définissant des granularités temporelles, et les politiques de rétention suppriment les données trop anciennes qui ne valent plus le coup d'être conservées.

Pour notre part, nous avons décidées d'opter pour 3 différentes granularités. Une granularité de 5 min (conservation des données de base) pour les données antérieures à 30 jours qui servira principalement à la gestion de crise et le retrassage de bugs ou d'erreurs avec une bonne précision, une de 1h avec une politique de rétention de 6 mois pour voir les tendances d'évolution sur une période plus longue, et enfin une granularité de 1 jour sur les 5 dernières années par avoir un historique sur le long terme de notre évolution. Nous estimons que les données plus anciennes que cela ne valent pas la peine d’être conservées.

# Influxdb

## Principes

Afin de mettre en place un système respectant ces contraintes, nous devons dans un premier temps configurer Influxdb.
En nous basant sur la [documentation officielle](https://docs.influxdata.com/influxdb/v1/guides/downsample_and_retain/#Copyright), influxdb nécessite la manipulation de deux concepts clés.

1. Les [Retention Policies](https://docs.influxdata.com/influxdb/v1/concepts/glossary/#retention-policy-rp):
    
    Elles peuvent être créées pour définir le temps qu'une données sera conservé si insérée à l’intérieure. Il est possible de créer autant de retention policies que de périodes pendant lesquelles vous voulez conserver un groupe de données.
  
    Par défaut, lors de la création d'une db, influxdb génère une retention policy "autogen" dans laquelle est insérée par défaut toute donnée insérée, pour une durée infinie.


    C'est avec les retention policies que nous allons configurer nos différentes périodes de retentions (30 jours, 6 mois, 5 ans).
2. Les [Continuous Queries](https://docs.influxdata.com/influxdb/v1/concepts/glossary/#continuous-query-cq):
   
    Ce sont des requêtes InfluxQl qui sont exécutées automatiquement par influxdb. Elles doivent contenir un SELECT et un GROUP BY time() qui servira à définir la fréquences à laquelle elles seront exécutées (un GROUP BY time(1h) sera exécuté à la fin de chaque heure et agrégera les données de l'heure qui vient d'être écoulée).

    C'est avec elles que nous allons définir quelles granularités vont être insérées dans quelle rétention policy.

    Attention, si vous créez des continuous queries récupérant des données sur une retention policy contenant déjà des données, celles-ci ne seront pas gérées automatiquement par la continuous query, il sera nécessaire de faire une insertion manuelle. Seul les données du dernier interval défini dans GROUP BY time(interval) et toutes les suivantes seront prises en comptes.

## Mise en place

### Retention Policies
Concrètement, qu'est ce que nous avons:
```sql
ALTER RETENTION POLICY "autogen" ON "database" DURATION 30d REPLICATION 1  DEFAULT

CREATE RETENTION POLICY "6_months" ON "database" DURATION 26w REPLICATION 1

CREATE RETENTION POLICY "5_years" ON "database" DURATION 260w REPLICATION 1
```
Donc nous modifions la RP "autogen" pour qu'elle ait une durée de rétention de 30 jours (Attention, toutes les données plus anciennes de 30 jours seront directement supprimées après avoir fait cette modification).

Ensuite, nous créons deux nouvelles rp sur cette base de donnée, une "6_months" d'une durée de 26 semaines et une "5_years" d'une durée de 260 semaines.

Si vous avez déjà des données de plus de 30 jours, je vous conseille de commencer par créer les deux RP "6_months" et "5_years" et de downsampler les données depuis "autogen" vers ces RPs avec les requettes suivantes:
```sql
SELECT mean(value) AS value INTO my_database."6_months".my_measurement FROM my_database."autogen".my_measurement WHERE time > now() - 26w GROUP BY time(1h), *
SELECT mean(value) AS value INTO my_database."5_years".my_measurement FROM my_database."autogen".my_measurement WHERE time > now() - 260w GROUP BY time(1d), *
```
Vous pourrez ensuite modifier la duration de "autogen" sans rien avoir perdu.

### Continuous queries

Nous n'avons pas trouvé de moyen de créer de continuous queries qui s'appliquerait à tous les measurements d'une database. Il vous sera donc nécessaire d'ajouter une continuous query pour chaque rp.measurement que vous voudrez gérer.

Pour un measurement nous avons donc ceci:

```sql
CREATE CONTINUOUS QUERY "cq_my_measurement_6_months" ON "my_database" 
BEGIN
  SELECT mean(value) AS value
  INTO "6_months"."my_measurement"
  FROM "autogen"."my_measurement"
  GROUP BY time(1h)
  , *
END

CREATE CONTINUOUS QUERY "cq_my_measurement_5_years" ON "my_database"
BEGIN
  SELECT mean(value) AS value
  INTO "5_years"."my_measurement"
  FROM "autogen"."my_measurement"
  GROUP BY time(1d)
  , *
END
```
notes: 
- `AS` permet de conserver le nom du champ car Influxdb ajoute mean_ par défaut. Cela est nécessaire pour simplifier la configuration grafana.
- Le `, *` permet de distinguer par tag::type_instance lors du `GROUP BY`.

Une fois les retention policies et les continuous queries configurées configurées, influxdb gère automatiquement le Downsampling.


# Grafana

Par défaut, grafana vas chercher les données dans la retention policy marquée default. Si vous avez suivi les étapes précédentes et que vous n'avez pas configuré de rp pour vos grafs vous n'aurez donc accès qu'aux données des 30 derniers jours. 

Nous avons passés un certain temps pour trouver un moyen simple et ergonomique pour naviguer entre les retentions policies depuis grafana.
Nous sommes tombés sur cette solution qui nous a semblé élégante: https://github.com/grafana/grafana/issues/4262#issuecomment-475570324

L'objectif est de trouver un moyen de contourner le problème que grafana n'est pas capable de générer des variables conditionnelles. Ici, il utilise une retention policy "forever" définir un mapping entre des tailles de fenêtre temporelle et les RPs:

```sql
CREATE RETENTION POLICY "forever" ON my_database DURATION INF REPLICATION 1
INSERT INTO forever rp_config,idx=1 rp="autogen",start=0i,end=2592000000i -9223372036854775806
INSERT INTO forever rp_config,idx=2 rp="6_months",start=2592000000i,end=11321856000i -9223372036854775806
INSERT INTO forever rp_config,idx=3 rp="5_years",start=11321856000i,end=271724544000i -9223372036854775806
```
Voyons plus en détaille ce que font ces requêtes selon la [doc infuxdb](https://docs.influxdata.com/influxdb/v1/write_protocols/line_protocol_tutorial/):
- `forever` : la retention policy créée pour stocker les infos.
- `rp_config` : un measurement rp_config créé à l'occasion.
- `idx=1` : c'est un tag idx avec la valeur 1 (il n'est pas obligatoire mais peut être utile)
- `rp="autogen,start=0i,end=2592000000i` : ce sont les fields du measurement. Rp correspond à la rp voulue, start et end définissent la range de taille de fenêtre (en ms) pour laquelle mapper la rp. Le `i` désigne un entier.
- `-9223372036854775806` : c’est l’horodatage (timestamp) du point écrit. Obligatoire car influxdb ne peut stocker que des données de type time series. La faible valeur semble être si loin dans le passé pour éviter toute interférence avec d'autres données.

Une fois la rp forever configurée, il suffit de créer un variable grafana qui récupère la bonne rp en fonction de la taille de la fenêtre actuelle. 

```sql
SELECT rp FROM forever.rp_config WHERE $__to-$__from > start and $__to-$__from <= "end"
```
Ici,:
- `SELECT rp FROM forever.rp_config`: récupère rp dans le measurement rp_config
- `$__to-$__from`: correspond à la taille de la fenêtre actuellement observée dans grafana(en ms).
- `WHERE $__to-$__from > start and $__to-$__from <= "end"`: permet de s'assurer que la taille de la fenêtre est bien comprise entre la taille minimale (start) et la taille maximale (end) de fenêtre acceptée pour la rp.

Il ne faut pas oublier de configurer le Refresh pour que la variable se mette à jour lorsque la fenêtre change.

Il suffit ensuite d'appeler cette variable dans tous les graphiques et c'est bon.

Cette solution, bien qu'élégante, ne nous a pas convenu parfaitement. En effet, il ne nous semble pas pertinent de faire dépendre la rp affichée en fonction de la taille de la fenêtre, nous préférerions que celle-ci dépende plutôt de l'ancienneté de la plus ancienne variable affichée dans la fenêtre. Cela nous permettrait de pouvoir zoomer dans le passer à des périodes antérieures à ma taille de fenêtre minimale.

Pour se faire, nous devons pouvoir comparer notre `$__from` au temps actuel. Malheureusement il n'existe pas de variable `$__now` ou équivalent à notre connaissance dans grafana, il va donc falloir passer par la fonction `now()` de influxdb ne peut être utilisé qu'avec un filtre `WHERE time` qui compare le timestamp de notre variable. Nous ne pourrons donc pas utiliser de field comme `start` ou `end` pour nous aider. Il va falloir stocker cette information directement dans le timestamp.

```sql
INSERT INTO forever rp_config,idx=1 rp="autogen",group_by="5m"   2592300000000000
INSERT INTO forever rp_config,idx=2 rp="6_months",group_by="1h" 15782400000000000
INSERT INTO forever rp_config,idx=3 rp="5_years",group_by="1d" 157874400000000000
```
Nous avons gardé la structure globale, ce que nous avons changé:
- retrait de `start` et `end` car devenus inutiles.
- ajout d'un field `group_by` permettant d'avoir directement accès à la granularité en fonction de la rp.
- utilisation de la timestamp pour intégrer l'anciènetée maximale des données d'une rp (en ns à partir du temps 0). 

Ces queries vont insérer 3 données en time série aux instants `temps 0 + 30d`, `temps 0 + 6M` et `temps 0 + 5y`  avec pour chacune un idx, une rp et un group_by.

Il suffit maintenant de récupérer ces valeurs via Grafana:

rp:
```sql
SELECT first(rp) FROM forever.rp_config WHERE time >= (now() - ${__from}ms)
```
group_by:
```sql
SELECT first(group_by) FROM forever.rp_config WHERE time >= (now() - ${__from}ms)
```
- `first()`: permet de ne récupérer que le premier élément des rp disponibles pour cette ancienneté (non obligatoire mais permet d'adapter automatiquement à la résolution maximum disponible pour une ancienneté donnée)
- `${__from}ms`: indique l'anciènetée maximum en temps absolu de la fenêtre temporelle actuellement observée (ms est obligatoire pour rendre compatible avec now, sinon sera interprété en ns)
- `now() - ${__from}ms`: calcul l'ancienneté relative maximum au niveaux d'influxdb
- `WHERE time >= (now() - ${__from}ms)`: ne récupère que données pour lesquelles le `time` est supérieur au temps relatif.


