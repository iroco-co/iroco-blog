---
layout: post
title: Comment limiter l'impact des mails ?
description: Dans l'ACV comparative réalisée avec Hubblo, nous nous sommes demandé comment limiter l'impact des mails.
author:
  display_name: iroco
categories:
- Grand public
tags:
- ACV Mail
---

_Nous avons rapidement compris que l'optimisation de l'usage du mail n'allait pas changer de manière importante son impact environnemental puisque les impact les plus importants sont ceux du matériel (serveurs, infrastructure réseau, mobiles, ordinateurs portables, de bureau, tablettes). Nous voulions alors saisir l'opportunité de la réalisation d'une Analyse de Cycle de Vie pour creuser d'autres pistes sur des changements d'usage ou des temporalités différentes._

Au départ d'Iroco était l'optimisation. L'hypothèse était que la diminution de la charge machine, de l'usage de la mémoire, du réseau allait limiter l'impact environnemental. Et puis nous avons appris sur le sujet du numérique responsable (ou acceptable) grâce à [Boavizta](http://boavizta.org/) entre autre, et compris que les impacts les plus importants du numérique étaient ailleurs :
* par ex ~80% des gaz à effet de serre sont du scope 3 c'est à dire la construction et le recyclage des équipements informatiques ;
* l'utilisation de l'eau et des minerais est principalement liée à la fabrication ;
* la pollution également.

L'étude de l'Analyse du Cycle de Vie du mail nous permettait d'aller plus loin que l'optimisation. Nous avons commencé par détailler tous les paramètres qui représentent des impacts pour les traitements informatique du mail, afin de définir plusieurs scénarii qui seront ensuite comparés dans l'étude :

* le nombre de messages envoyés/reçus
* la présence de pièce jointe
* le temps passé en itinérance
* la taille des messages (simple texte, html...)
* les types de terminaux (mobile, ordinateur portables, ordinateur de bureau, tablette)
* l'obsolescence programmée des terminaux
* le taux de mutualisation
* le nombre de destinataires
* les pics d'utilisation des serveurs/réseau (dimensionnement des infrastructures)
* la localisation des systèmes émetteurs/récepteurs
* l'urgence du message
* le mix électrique à l'envoi et à la réception

Plusieurs considérations nous aiguillent sur les gains les plus prometteurs.

Nous savons déjà qu'au niveau exploitation, il existe des différences importantes entre l'utilisation du réseau en mode itinérant (3G, 4G, 5G) et fixe (wifi, cable)[^1]. Nous imaginons alors que nous pourrions avec une application mobile différer dans le temps l'envoi de message non urgents lorsque le mobile est en itinérance, et les envoyer quand la connexion wifi est à nouveau activée. Ce sera notre premier scénario "modification dynamique du réseau d'accès".

[^1]: ?????????????

L'impact carbone par kilowatt/heure est aussi sujet à une variabilité importante[^2]. Il peut fluctuer entre 25g avec des production d'énergie décarbonées (EnR, nucléaire) et 800g avec une production d'électricité à base de centrales thermiques au charbon. Un facteur 32. Sur la même hypothèse d'urgence de message nous pourrions décaler dans le temps la délivrance des messages non urgents en attendant un mix énergétique optimum, ou des sous-charges dans l'infrastructure électrique. Comme il existait avant des timbres de couleurs et prix différents pour le courrier en fonction du temps d'acheminement. Voici notre second scénario "déplacement de la demande dans le temps".

[^2]: [electricitymaps.com](https://app.electricitymaps.com/map) est un site qui donne la quantité de carbone émise par KW/h par pays en temps réel

Toujours sur la temporalité du mail, le dimensionnement d'une infrastructure informatique est conçu pour absorber les pics d'utilisation. Du coup l'infrastructure est soit surdimensionnée, soit adaptative à la demande de charge (en scalabilité élastique). En lissant les pics de traitement des messages dans le temps, nous pourrions limiter le nombre de serveurs à fabriquer, recycler, et leur usage d'énergie lors de leur utilisation (même en scalabilité élastique). Ce sera notre troisième levier "Diminution du dimensionnement de l'infrastructure".

Enfin pour diminuer le remplacement des terminaux, leur recyclage et leur fabrication, nous pourrions concevoir nos services (notamment les parties web) pour qu'ils soient compatibles avec des terminaux anciens. Limiter l'obsolescence programmée.  Ce sera notre dernier levier "Compatibilité du service mail avec les terminaux utilisateurs".

Nous partons de mesures (taille, pièce jointes, destinataires) faites sur un échantillon de mail relevés sur notre serveur pour 3 utilisateurs typiques du service pendant une semaine. Et voila! "Il ne reste plus qu'à" modéliser ces scénarii avec cet échantillon !

Pour la méthodologie il s'agit dans cet article de la méthode "traditionnelle" dite attributionnelle (ACV-A). Cette méthode caractérise les impacts de de l'unité fonctionnelle (ici l'envoi et la réception de mail pour un utilisateur à une dizaine d'interlocuteurs) relativement à l'ensemble de la technosphère. La méthode conséquentielle adopte une approche de type "delta" : on pense un changement par rapport à l'état actuel et ses impacts sur différents critères environnementaux [^3].

[^3]: cf cet article sur notre ACV par David Ekchajzer de [Hubblo](https://hubblo.org) [Counting environmental impacts using attributional and consequential approaches](https://hubblo.org/blog/attributional-vs-consequential/)

Vous pourrez retrouver les résultats par levier dans le rapport final [^4]. En synthèse si on scénarise ces différents leviers selon 3 niveaux différents :

[^4]: [rapport détaillé de l'ACV](/images/ACV/ACV-mail-Hubblo-Iroco-01032024.pdf)

* “minimum” : la gestion de l’urgence des mails va permettre une moindre utilisation du réseau mobile et une diminution de 10% de l’infrastructure nécessaire (lissage minimum des traitements). L'éco-conception de l’application de mail participe à l’allongement “minimum” - un an en moyenne- des terminaux
* “raisonnable” : on vise une diminution de 20% de l’infrastructure nécessaire et un allongement de deux ans des terminaux
* “utopique” : diminution de 50% de l’infrastructure nécessaire et allongement de quatre ans des terminaux

On obtient les résultats suivants :

| Scénario | Changement climatique (kgCO2 eq.) | Ressources abiotiques (kgSB eq) | Acidification de l'air (mol H+ eq) | Particules fines (Disease incidence) | Radiation ionisante (kBq U235 eq) |
|:---------|:----------------------------------|:--------------------------------|:-----------------------------------|:-------------------------------------|:----------------------------------|
| Référence | 1,23E-01 | 3,27E-06 | 7,20E-04 | 7,87E-01 | 9,49E-09 |
| Minimum | 1,06E-01 | 2,66E-06 | 6,01E-04 | 6,30E-01 | 7,71E-09 |
| Raisonnable | 9,34E-02 | 2,25E-06 | 5,30E-04 | 5,72E-01 | 6,92E-09 |
| Utopique | 7,19E-02 | 1,67E-06 | 4,07E-04 | 4,05E-01 | 5,07E-09 |


![Graph des résultats de l'ACV-A](/images/ACV/resultats_attributionnel.png)
