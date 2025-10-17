---
layout: post
title: Inscription au service de mail
author:
  name: iroco
categories:
- Grand public
tags:
- iroco
---

_Lors de l'inscription, la banque de certains utilisateurs n'est pas disponible. Nous travaillons à simplifier la démarche pour qu'elle fonctionne pour le plus de banques possibles (au moins celles localisées en France et en Allemagne selon [notre prestataire de paiement](https://support.gocardless.com/hc/fr/articles/17143507209500-FAQ-sur-l-outil-Verified-Mandates)), tout en maintenant  la sécurité de notre plateforme. Merci pour votre compréhension._

Nous avons noté une augmentation des inscriptions à notre service récemment, avec un problème récurrent pour certains utilisateurs : leur banque n'est pas disponibles chez notre prestataire de paiement (gocardless). 

[Suite à des tentatives de fraude](/incident-de-securite) nous avions mis en place un paiement initial avec la technologie [_instant bank pay_](https://gocardless.com/solutions/instant-bank-pay/). Cette technologie n'est malheureusement disponible que pour [certaines banques](https://support.gocardless.com/hc/fr/articles/360021349239-FAQ-sur-la-fonction-Instant-Bank-Pay). Nous allons supprimer cette étape et n'utiliser que des prélèvements SEPA standards, en activant les comptes uniquement lorsque le premier paiement est passé. Cela a un léger inconvénient : le compte restera en lecture seule (pas de possibilité d'envoi de mail) jusqu'à l'exécution effective du premier virement.

Nous vous tiendrons informés de ces avancées via ce blog sous peu. En attendant, voici la liste des banques compatibles pour la France à ce jour (selon la source [ici](https://support.gocardless.com/hc/fr/articles/360021349239-FAQ-sur-la-fonction-Instant-Bank-Pay)) &nbsp;:

    BNP Paribas
    Banque Chalus
    Banque Palatine
    Banque Populaire Alsace Lorraine Champagne
    Banque Populaire Aquitaine Centre Atlantique
    Banque Populaire Auvergne et Rhône-Alpes
    Banque Populaire Bourgogne Franche Comté
    Banque Populaire Grand Ouest
    Banque Populaire Méditerranée
    Banque Populaire Occitane
    Banque Populaire Rives de Paris
    Banque Populaire Val de France
    Banque Populaire du Nord
    Banque Populaire du Sud
    Banque de Savoie
    Boursorama
    Caisse d'Epargne Aquitaine Poitou-Charentes
    Caisse d'Epargne Auvergne et Limousin
    Caisse d'Epargne Bourgogne Franche-Comté
    Caisse d'Epargne Bretagne-Pays De Loire
    Caisse d'Epargne Côte d'Azur
    Caisse d'Epargne Grand Est Europe
    Caisse d'Epargne Hauts de France
    Caisse d'Epargne Ile De France
    Caisse d'Epargne Languedoc-Roussillon
    Caisse d'Epargne Loire Drôme Ardèche
    Caisse d'Epargne Loire-Centre
    Caisse d'Epargne Midi-Pyrénées
    Caisse d'Epargne Normandie
    Caisse d'Epargne Provence Alpes Corse
    Caisse d'Epargne Rhône Alpes
    Crédit Agricole Alpes Provence
    Crédit Agricole Alsace Vosges
    Crédit Agricole Atlantique Vendée
    Crédit Agricole Brie Picardie
    Crédit Agricole Champagne-Bourgogne
    Crédit Agricole Charente Périgord
    Crédit Agricole Charente-Maritime Deux-Sèvres
    Crédit Agricole Nord Midi-Pyrénées
    Crédit Agricole Pyrénées Gascogne
    Crédit Agricole Sud Méditerranée
    Crédit Agricole Sud Rhône-Alpes
    Crédit Agricole Toulouse31
    Crédit Agricole Val De France
    Crédit Agricole d'Aquitaine
    Crédit Agricole d'Ille et Vilaine
    Crédit Agricole de Centre France
    Crédit Agricole de Centre Loire
    Crédit Agricole de Centre-Est
    Crédit Agricole de Franche-Comté
    Crédit Agricole de Guadeloupe
    Crédit Agricole de Loire Haute-Loire
    Crédit Agricole de Lorraine
    Crédit Agricole de Nord De France
    Crédit Agricole de Normandie
    Crédit Agricole de Normandie Seine
    Crédit Agricole de Paris et d'Ile de France
    Crédit Agricole de Provence Côtes d'Azur
    Crédit Agricole de l'Anjou et du Maine
    Crédit Agricole de la Corse
    Crédit Agricole de la Martinique et de la Guyane
    Crédit Agricole de la Réunion
    Crédit Agricole de la Touraine et du Poitou
    Crédit Agricole des Côtes d'Armor
    Crédit Agricole des Savoie
    Crédit Agricole du Centre Ouest
    Crédit Agricole du Finistère
    Crédit Agricole du Languedoc
    Crédit Agricole du Morbihan
    Crédit Agricole du Nord Est
    Crédit Coopératif
    LCL
    La Banque Postale
    N26 Bank
    Revolut
    Société Générale Small Enterprise
    Wise

