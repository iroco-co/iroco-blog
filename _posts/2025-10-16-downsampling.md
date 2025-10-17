---
layout: post
title: Downsampling avec Influxdb v1 et Grafana
author:
  name: iroco
categories:
- Sous le capot
tags:
- monitoring
---

![Image d'un âne soulevé par une charrette trop pleine](/images/over-delivering-donkey.jpg)

_Suite à [notre série](/monitoring-conclusion/) sur les outils ouverts de monitoring nous avons mis en production [collectd](https://collectd.org/)/[Influxdb V1](https://docs.influxdata.com/influxdb/v1/)/[grafana](https://grafana.com/) mais la question de gestion des données de monitoring s'est rapidement posée. Nous allons vous parler de deux fonctionalités des bases de données temporelles : le sous-échantillonnage et les politiques de rétention._


La mise en production notre système de monitoring [collectd](https://collectd.org/)/[Influxdb V1](https://docs.influxdata.com/influxdb/v1/)/[grafana](https://grafana.com/) nous a posé une nouvelle question : 

> Comment faire pour ne pas stocker indéfiniment toutes les données enregistrées sur l'espace disque ?

En effet, au rythme de chaque métrique toutes les 5 min, notre système de monitoring risque de prendre de plus en plus de place sur nos serveurs.

Afin de résoudre ce problème, nous avons dû nous informer sur deux nouveau concepts pour nous, le sous-échantillonnage (_downsampling_) de données temporelles (_time series_)  et la mise en place de politiques de rétention.

Le principe est simple : comme l'intérêt de la précision des données diminue avec le temps, il suffit de la réduire au delà de certaines dates. A quoi cela nous servirait-il d'avoir des données toutes les 5 minutes pour le mois de septembre 2021 ? En revanche, c'est intéressant d'avoir des tendances globales pour comprendre et anticiper les évolutions futures du service. 

Par exemple, nous conservons les traces applicatives pendant un mois. Nous souhaitons conserver la meilleure précision des indicateurs dont nous disposons pendant cette période : si nous constatons un incident, nous avons un maximum d'information pour _débugger_ un éventuel dysfonctionnement, une attaque ou une fausse manipulation.

Nous avons décidé d'opter pour 3 granularités : 

- 5 minutes (conservation de toutes les données collectées) pour les 30 derniers jours afin de résoudre nos problèmes d'exploitation ;
- 1 heure pendant les 6 derniers mois pour voir les tendances d'évolution de manière relativement fine ;
- 1 jour sur les 5 dernières années pour un historique plus long terme de nos services.

Nous estimons que les données plus anciennes ne valent pas la peine d’être conservées.

La [documentation officielle d'InfluxDB](https://docs.influxdata.com/influxdb/v1/guides/downsample_and_retain/)  nous explique comment faire pour mettre en place ces nouveaux besoins.

# Les [Retention Policies](https://docs.influxdata.com/influxdb/v1/query_language/manage-database/#retention-policy-management) InfluxDB
    
Elles indiquent le temps qu'une données sera conservée. Il est possible d'en créer autant que de périodes pendant lesquelles vous voulez conserver un groupe de données avec une certaine granularité.
  
Par défaut, lors de la création d'une base de données, InfluxDB génère une retention policy "autogen" dans laquelle sont insérées toutes les données sur une durée infinie.

Nous allons donc définir trois _retention policies_ :  30 jours, 6 mois, 5 ans :

```sql
ALTER RETENTION POLICY "autogen" ON "database" DURATION 30d REPLICATION 1  DEFAULT
CREATE RETENTION POLICY "6_months" ON "database" DURATION 26w REPLICATION 1
CREATE RETENTION POLICY "5_years" ON "database" DURATION 260w REPLICATION 1
```

Nous modifions la RP "autogen" pour qu'elle ait une durée de rétention de 30 jours (Attention, toutes les données plus anciennes de 30 jours seront directement supprimées après avoir fait cette modification).

Ensuite, nous créons deux nouvelles RP sur cette base de donnée, une `6_months` d'une durée de 26 semaines et une `5_years` d'une durée de 260 semaines.

Si vous avez déjà des données de plus de 30 jours, nous vous conseillons de commencer par créer les deux RP `6_months` et `5_years` et de _downsampler_ les données depuis `autogen`   avec les requêtes suivantes:
```sql
SELECT mean(value) AS value INTO my_database."6_months".my_measurement FROM my_database."autogen".my_measurement WHERE time > now() - 26w GROUP BY time(1h), *
SELECT mean(value) AS value INTO my_database."5_years".my_measurement FROM my_database."autogen".my_measurement WHERE time > now() - 260w GROUP BY time(1d), *
```
Vous pourrez ensuite modifier la duration de "autogen" sans rien avoir perdu.

# Les [Continuous Queries](https://docs.influxdata.com/influxdb/v1/query_language/continuous_queries/) InfluxDB
   
Ce sont des requêtes InfluxQl qui sont exécutées automatiquement par influxdb. Elles doivent contenir un `SELECT ... GROUP BY time()` qui définit à la fois la granularité de _downsampling_ ainsi que les moments où elles seront appelées. `GROUP BY time(1h)`  sera exécutée à la fin de chaque heure et agrégera les données de l'heure qui vient de s'écouler pour les insérer dans un autre _measurement_ (équivalent d'une table SQL).

Attention, si vous créez une _continuous query_ sur les données existantes d'un  _measurement_, celles-ci ne seront pas agrégées automatiquement. Il sera nécessaire de faire une insertion manuelle (comme les deux requêtes ci-dessus). Seules les données du dernier intervalle défini dans `GROUP BY time(interval)` et les suivantes seront prises en comptes.

Nous n'avons pas trouvé de moyen de créer des CQ's qui s'appliqueraient à tous les _measurements_ d'une base de données. Il vous sera donc nécessaire d'ajouter une CQ pour chaque _measurement_.

Pour un _measurement_ nous avons donc ceci:

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
- Le `, *` permet de distinguer par `tag::type_instance` lors du `GROUP BY`.

Une fois les RP's et les CQ's créées, InfluxDB gère automatiquement le Downsampling.


# La visualisation avec Grafana

Grafana vas chercher les données d'un graphique dans un _measurement_. Si vous avez un graphique représentant `autogen.my_measurement` avec la configuration InfluxDB précédente, vous n'aurez donc accès qu'aux données des 30 derniers jours. Si vous voulez voir les données des 6 derniers mois il faudra relier un autre graphique au _measurement_ `6_months.my_measurement`. 🤔

> Comment faire pour afficher les données des 3 différentes granularités dans un seul graphique ?

Nous avons passés un certain temps pour trouver un moyen simple de naviguer entre les données de différentes granularités depuis grafana. Nous sommes tombés sur [un message dans une issue github](https://github.com/grafana/grafana/issues/4262#issuecomment-475570324) qui présentait une solution élégante.

L'objectif est de trouver un moyen de contourner le fait que grafana ne soit pas capable de gérer des variables conditionnelles. Ici, il définit une retention policy "forever" infinie et insère 3 correspondances entre des tailles de fenêtre temporelle et les RPs:

```sql
CREATE RETENTION POLICY "forever" ON my_database DURATION INF REPLICATION 1
INSERT INTO forever rp_config,idx=1 rp="autogen",start=0i,end=2592000000i -9223372036854775806
INSERT INTO forever rp_config,idx=2 rp="6_months",start=2592000000i,end=11321856000i -9223372036854775806
INSERT INTO forever rp_config,idx=3 rp="5_years",start=11321856000i,end=271724544000i -9223372036854775806
```

Voyons en détail ce que font ces requêtes selon la [doc infuxdb](https://docs.influxdata.com/influxdb/v1/write_protocols/line_protocol_tutorial/):
- `forever` : la retention policy créée pour stocker les différentes fenêtres temporelles.
- `rp_config` : un _measurement_ `rp_config` créé pour la gestion de ces fenêtre. Nous créons 3 enregistrements dans ce _measurement_.
- `idx=1` : c'est un tag d'index avec la valeur 1 (il n'est pas obligatoire mais il sert à ordonner les 3 différentes granularités)
- `rp="autogen,start=0i,end=2592000000i` : ce sont les champs (_fields_)  du measurement. Rp est le nom de la RP, start et end définissent la taille de fenêtre (en ms) pour laquelle mapper la RP. Le `i` désigne le type de la donnée : un entier.
- `-9223372036854775806` : c’est l’horodatage (timestamp) du point écrit (en ns). Obligatoire car influxdb ne peut stocker que des données temporelles. La faible valeur (-272 années) correspond à la [date minimale gérée par Influxdb](https://github.com/influxdata/influxdb-java/issues/626) (max 64 bits). Elle ne pourra pas interférer avec d'autres données. Grafana ne la voit pas.

Une fois la RP `forever` ainsi configurée, il suffit de créer une variable grafana qui récupère la bonne `rp_config` en fonction de la taille de la fenêtre d'affichage de grafana : 

```sql
SELECT rp FROM forever.rp_config WHERE $__to-$__from > start and $__to-$__from <= "end"
```
Détaillons la requête :
- `SELECT rp FROM forever.rp_config`: récupère l'enregistrement dans le measurement rp_config
- `$__to-$__from`: correspond à la taille de la fenêtre actuellement observée dans grafana (en ms).
- `WHERE $__to-$__from > start and $__to-$__from <= "end"`: permet de s'assurer que la taille de la fenêtre est bien comprise entre la taille minimale (start) et la taille maximale (end) de fenêtre acceptée pour la `rp_config`.

Il ne faut pas oublier de configurer le `Refresh` pour que la variable se mette à jour lorsque la fenêtre change.

Il suffit ensuite d'appeler cette variable dans tous les graphiques.

Bien qu'impressionnés par cette solution, après l'avoir testée, nous avons constaté quelques inconvénients : si on affiche les données d'un mois il y a un an, tout va bien, grafana fait la requête sur le _measurement_ `5_years.my_measurement`. Mais si on on zoom sur une période de une semaine, alors il va utiliser `autogen.my_measurement` et l'affichage est cassé. En d'autres termes il ne nous semble pas pertinent de faire dépendre la `rp_config`  de la taille de la fenêtre grafana.  Nous préférerions que celle-ci dépende plutôt de l'ancienneté de la plus ancienne variable affichée dans la fenêtre.

Nous devons pouvoir comparer notre `$__from` au temps actuel. Malheureusement il n'existe pas de variable `$__now` ou équivalent dans grafana. Mais nous pouvons utiliser la fonction `now()` de InfluxDB. Malheureusement, cette fonction ne peut être utilisé qu'avec un filtre `WHERE time` qui compare un timestamp. Nous ne pourrons donc pas utiliser de champ comme `start` ou `end` pour nous aider. Il va falloir stocker cette information directement dans l'enregistrement.

```sql
INSERT INTO forever rp_config,idx=1 rp="autogen",group_by="5m" 2592300000000000
INSERT INTO forever rp_config,idx=2 rp="6_months",group_by="1h" 15782400000000000
INSERT INTO forever rp_config,idx=3 rp="5_years",group_by="1d" 157874400000000000
```

Nous avons gardé les 3 enregistrements dans notre _measurement_ de configuration. Ce que nous avons changé:
- retrait de `start` et `end` car devenus inutiles.
- ajout d'un field `group_by` permettant d'avoir directement accès à la granularité en fonction de la RP.
- utilisation du timestamp pour intégrer l'ancienneté maximale des données d'une rp (en ns à partir du temps 0 informatique, le 1er janvier 1970 minuit). 

Ces queries vont insérer 3 données dans notre _measurement_ `rp_config` aux instants `temps 0 + 30d`, `temps 0 + 6M` et `temps 0 + 5y`  avec pour chacune un index, le nom d'une RP et une valeur de  `group_by`.

Il suffit maintenant de récupérer ces valeurs dans Grafana:

rp:
```sql
SELECT first(rp) FROM forever.rp_config WHERE time >= (now() - ${__from}ms)
```
group_by:
```sql
SELECT first(group_by) FROM forever.rp_config WHERE time >= (now() - ${__from}ms)
```
- `first()`: permet de ne récupérer que le premier élément des `rp_config`  pour le début de fenêtre grafana (non obligatoire mais permet d'adapter automatiquement à la résolution maximale disponible pour une date donnée)
- `${__from}ms`: indique le début de la fenêtre temporelle grafana actuellement observée (ms est obligatoire pour rendre compatible avec `now`, sinon sera interprété en nanosecondes)
- `now() - ${__from}ms`: calcul de la période avec la meilleure granularité dans influxdb
- `WHERE time >= (now() - ${__from}ms)`: ne récupère que les données pour lesquelles `time` est supérieur au début de la fenêtre.

Ainsi nous avons bien un graphique par indicateur et quand nous changeons de période dans grafana, ou que nous zoomons sur un graphique, grafana va automatiquement sélectionner la bonne `rp_config` et utilise le prefix pour charger les données depuis le _measurement_ correspondant, avec la bonne granularité.

Si vous avez des remarques, des suggestions pour faire mieux, n'hésitez pas !
