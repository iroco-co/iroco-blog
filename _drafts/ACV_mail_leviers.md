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

L'étude de l'Analyse du Cycle de Vie du mail nous permettait d'aller plus loin que l'optimisation. Nous avons commencer par lister tous les paramètres qui pouvaient représenter des impacts pour le mail, afin de définir plusieurs scénarii qui seront ensuite comparés dans l'étude :

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

L'impact carbone par kilowatt/heure est aussi sujet à une variabilité importante[^2], il peut être autour de 25g avec des production d'énergie décarbonées (EnR, nucléaire), jusqu'à 800g avec une production d'électricité avec des centrales thermiques au charbon. Un facteur 32. Sur la même hypothèse d'urgence de message nous pourrions décaler dans le temps la délivrance des messages non urgents, en attendant un mix énergétique optimum, ou des sous-charges dans l'infrastructure électrique. Un peu comme il existait avant des timbres de couleurs et prix différents pour le courrier en fonction du temps d'acheminement. Voici notre second scénario "déplacement de la demande dans le temps".

[^2]: https://app.electricitymaps.com/map

En restant aussi sur la temporalité du mail, le dimensionnement des infrastructures est imaginé pour absorber les pics d'utilisation. En diminuant le nombre de serveurs nécessaires et en lissant les pics avec un décalage dans le temps du traitement des messages, nous pourrions aussi limiter le nombre de serveurs à fabriquer, recycler, et leur usage d'énergie lors de leur utilisation (même en scalabilité élastique). Ce sera notre troisième levier "Diminution du dimensionnement de l'infrastructure".

Enfin pour diminuer le remplacement des terminaux, leur recyclage et leur fabrication, nous pourrions concevoir nos services (notamment les parties web) pour qu'ils soient compatibles avec des terminaux anciens. Limiter l'obsolescence programmée.  Ce sera notre dernier levier "Compatibilité du service mail avec les terminaux utilisateurs".

Nous partons de mesures (taille, pièce jointes, destinataires) faites sur un échantillon de mail relevés sur notre serveur pour 3 utilisateurs typiques du service pendant une semaine. Et voila, "il ne reste plus qu'à" modéliser ces scénarii avec cet échantillon !

Vous pourrez retrouver les résultats par levier dans le rapport final. En synthèse si on scénarise ces différents leviers selon 3 niveaux différents :

* “minimum” : la gestion de l’urgence des mails va permettre une moindre utilisation du réseau mobile et une diminution de 10% de l’infrastructure nécessaire (lissage minimum des traitements). L'éco-conception de l’application de mail participe à l’allongement “minimum” - un an- des terminaux
* “raisonnable” : on vise une diminution de 20% de l’infrastructure nécessaire et un allongement de deux ans des terminaux
* “utopique” : diminution de 50% de l’infrastructure nécessaire et allongement de quatre ans des terminaux

On obtient les résultats suivants :

| Changement climatique (kgCO2 eq.) | Ressources abiotiques (kgSB eq) | Acidification de l'air (mol H+ eq) | Particules fines (Disease incidence) | Radiation ionisante (kBq U235 eq) |
|:----------------------------------|:--------------------------------|:-----------------------------------|:-------------------------------------|:----------------------------------|
