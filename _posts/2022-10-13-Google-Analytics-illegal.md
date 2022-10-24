---
layout: post
title: Google Analytics est-il illégal en France ?
description: La CNIL a annoncé la mise en demeure des sites utilisant Google Analytics, pour non-respect du RGPD. Quelles en sont les conséquences ?
author:
  display_name: Iroco
categories:
- Décryptage
- Niveau de lecture grand public
tags:
- Google Analytics
- Données personnelles et confidentialité
- RGPD
---
![google analytics monitoring](/images/google_analytics/google-analytics-monitoring.jpg)

*Google Analytics est une plateforme de statistiques Web lancée en 2005 par Google. On estime que 80% des sites web dans le monde l'utilisent pour analyser leur trafic. Pourquoi son utilisation pourrait-elle finalement être interdite ? Décryptage.*

## Google Analytics : qu'est-ce que c'est ?

[Google Analytics](https://analytics.google.com/analytics/web/)
est un service d'**analyse web** qui fournit des statistiques de fréquentation et des outils d'analyse permettant d'améliorer son référencement naturel dans les moteurs de recherche (*search engine optimization* ou SEO) et de marketing. Ce service est disponible gratuitement dès lors qu'on possède un compte Google.

Il est utilisé particulièrement par les petites et moyennes entreprises (TPE et PME) afin d'obtenir diverses **données**, qui peuvent être exploitées pour **améliorer les campagnes marketing** et ainsi **augmenter le trafic d'un site web**.

## Comment fonctionne l'analyse web ?

Les services d'analyse web, dont **Google Analytics**, acquièrent les données utilisateur de chaque visiteur d'un site web afin d'analyser le comportement de ces visiteurs. Dans le cas de Google Analytics, cela se fait via un **code Javascript** installé sur chaque page du site.

````javascript
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-xxxxxx-1', 'auto');
  ga('send', 'pageview');
</script>
````

Le code Javascript n'est ni plus ni moins qu'un **traceur**, ou plus communément un **cookie** (fichier témoin), qui génère un fichier **stocké sur votre ordinateur ou votre téléphone** afin de **recueillir des informations sur votre navigation web**. Cependant, le système ne peut pas collecter de données pour les utilisateurs qui désactivent les cookies.

Sur la base de ces données de navigation, Google Analytics et les autres outils d'analyse web peuvent alors générer des rapports personnalisables servant notamment à suivre et à visualiser deux types d'informations : les **données d'acquisition** et les **données de comportement**.

**Les données d'acquisition** sont basées sur la manière dont les visiteurs arrivent sur votre site internet et incluent par exemple :

* le canal d'acquisition, qui détermine comment un visiteur donné est arrivé sur votre site : a-t-il cliqué sur l'une de vos publicités, a-t-il suivi un lien sur un réseau social, vous a-t-il trouvé dans son moteur de recherche ?
* l'appareil utilisé pour se connecter : un smartphone, un ordinateur, une tablette...
* des données démographiques : âge, genre, centres d'intérêt...

Ces informations permettent d'**optimiser le ciblage dans une stratégie d'acquisition de prospects et d'ambassadeurs** : on peut par exemple modifier l'âge ciblé dans une publicité pour correspondre à l'âge des visiteurs du site internet.

**Les données sur le comportement de l'utilisateur** permettent quant à elles de comprendre comment les visiteurs se comportent réellement sur votre site web. Elles incluent :

* le nombre de visiteurs ;
* le nombre de sessions, c'est-à-dire le nombre de fois où un visiteur se connecte sur le site ;
* la durée moyenne des sessions ;
* les pages vues par l'utilisateur ;
* le taux de rebond, c'est-à-dire le pourcentage de visiteurs qui visitent une seule page du site avant d'en sortir.

On trouve également dans ces données le chemin que les visiteurs empruntent généralement lorsqu'ils accèdent au site web : c'est ce qu'on appelle le "flux de comportement" :

![google analytics parcours utilisateur](/images/google_analytics/google-analytics-parcours-utilisateur.png)

*crédit image : limpide blog*

Un autre outil important proposé par les services d'analyse web est la mesure de la **vitesse du site**. Cet outil permet de déterminer les zones du site qui devraient être optimisées en raison d'une vitesse de chargement anormalement lente, en se basant sur les données suivantes :  

* le temps de chargement moyen des pages ;
* le temps de redirection moyen ;
* le temps moyen passé en recherche de domaine (recherche DNS) pour une page ;
* le temps moyen de téléchargement d'une page donnée ; etc.

En plus des informations de base fournies par le service, il est souvent possible de **définir des informations personnalisées et uniques** telles que par exemple la mesure de la fluidité d'un achat pour un site de e-commerce. Cela peut aider à identifier des problèmes d'expérience utilisateur, comme par exemple un processus de paiement trop compliqué.

En clair, les outils d'analyse d'audience permettent de :

* identifier vos sources de trafic (comment les internautes découvrent-ils votre site ?)
* mieux comprendre les fluctuations de vos visites (pourquoi y a-t-il eu une baisse ou une hausse ?)
* suivre l'évolution de votre site internet (quel impact la refonte de votre site a-t-elle eue ?)
* identifier les pages les plus consultées (y a-t-il un problème avec votre contenu ?)
* mieux comprendre votre audience (quelles sont ses attentes, ses recherches, ses pratiques de navigation ...)
* évaluer la fidélisation des internautes (combien de visiteurs, reviendront-ils ? Si oui, où ?)
* optimiser son référencement dans les moteurs de recherche (quels mots-clés vos visiteurs ont-ils tapé dans leur moteur de recherche pour arriver sur votre site ? où votre site est-il visible dans les résultats ?)
* évaluer la vitesse de chargement des pages (quelle est la vitesse moyenne de chargement des pages ? comment l'améliorer ?)

## Pourquoi est-il essentiel pour une entreprise d'utiliser un outil d'analyse web ?

Selon le [baromètre France Num](https://www.francenum.gouv.fr/guides-et-conseils/strategie-numerique/barometre-france-num-2021-le-numerique-dans-les-tpe-pme-0), **66% des TPE et PME disposent d'un site internet en 2021**. Pour ces entreprises, il est primordial de connaître les détails de ce que font les internautes lorsqu'ils visitent leur site web : combien de temps y restent-ils ? Quelles pages visitent-ils ? C'est pourquoi l'analyse web est un outil puissant pour étudier le comportement des visiteurs, suivre et mesurer le résultat de chaque action marketing, et donc pour **mesurer son retour sur investissement (ROI)**.

## Pourquoi Google Analytics pourrait-il être interdit en Europe ?

En février 2022, la [CNIL](https://www.cnil.fr/fr/cookies-et-autres-traceurs/regles/google-analytics-et-transferts-de-donnees-comment-mettre-son-outil-de-mesure-daudience-en-conformite) (Commission nationale de l'informatique et des libertés, chargée en France de veiller au respect des droits de l'homme et de la vie privée par les acteurs du numérique) considérait l'utilisation de Google Analytics comme illicite en transférant et en **exposant illégalement des données européennes** aux États-Unis, violant ainsi le **règlement européen sur la protection des données** (RGPD). Cependant, prédire la fin de Google Analytics n'est pas aussi simple qu'il n'y paraît.

## Quelles sont les menaces européennes actuelles contre Google Analytics ?

L'affaire a commencé lorsque le Centre européen pour les droits numériques ([NOYB](https://noyb.eu/fr)) a déposé une plainte contre NetDoktor, une société autrichienne d'informations médicales qui utilisait des cookies de Google Analytics. Le 22 décembre 2021, l'Agence autrichienne de protection des données (DPA) a conclu que l'utilisation de Google Analytics **violait le RGPD** car la société NetDoktor n'avait pas correctement configuré le masquage des adresses IP, ce qui peut permettre une identification précise des utilisateurs.

En outre, la CNIL a critiqué  le transfert vers les États-Unis des données collectées par Google, qui ne restreint pas suffisamment l'accès des agences de renseignement américaines à ces données.

## La France va-t-elle interdire Google Analytics ?

Pour l'instant, l'Autriche est le seul pays européen à avoir déclaré illégale l'utilisation de Google Analytics.

En ce qui concerne la France, la CNIL se contente de conseiller officiellement aux propriétaires de sites web utilisant Google Analytics de cesser d'utiliser la plate-forme ou de trouver d'autres **outils de suivi des données conformes du RGPD** et n'envoyant pas de données en dehors de l'Europe.

Si Google Analytics est effectivement interdit en Europe, cela affectera des millions de sites web européens qui s'appuient sur la plateforme de Google pour le **suivi des données**. Cela affectera également des fournisseurs de services tels que Stripe (plateforme de paiement par internet pour professionnels), dont l'infrastructure est située et opère aux États-Unis.

À long terme, deux options se dessinent : soit la modification par les États-Unis de leurs lois de surveillance, soit l'hébergement par les fournisseurs de services américains des données des utilisateurs européens en Europe.

## Quel est l'avenir de l'analyse web en Europe ?

De nombreuses entreprises européennes se demandent si Google Analytics doit être supprimé de leurs sites web ou si elles seront exposées à des sanctions. Plutôt que d'attendre que la loi évolue en ce sens, pourquoi ne pas adopter dès maintenant des [alternatives éthiques à Google Analytics validées par la CNIL](https://www.cnil.fr/fr/cookies-et-autres-traceurs/regles/cookies-solutions-pour-les-outils-de-mesure-daudience), qui respectent **les lois ePrivacy et de RGPD** ?

Pour les entreprises qui souhaitent continuer à utiliser Google Analytics, la CNIL recommande la [proxyfication](https://www.cnil.fr/sites/default/files/atoms/files/statistiques_avec_proxyfication.pdf). Cependant, sa mise en œuvre de manière valable "peut se révéler coûteuse et complexe et ne permet pas toujours de répondre aux besoins opérationnels des professionnels. Pour éviter ces difficultés, il est également possible pour les professionnels de recourir à une solution ne réalisant pas de transferts de données personnelles en dehors de l’Union européenne" déclare la [CNIL](https://www.cnil.fr/fr/cookies-et-autres-traceurs/regles/google-analytics-et-transferts-de-donnees-comment-mettre-son-outil-de-mesure-daudience-en-conformite).

## Et chez Iroco ?

Chez Iroco, nous utilisons **Matomo** (anciennement Piwik), un logiciel libre et open source afin d'assurer la **sécurité des données de nos visiteurs**.

Cette solution nous permet d'assurer un suivi qualitatif de nos données web tout en étant respectueux de la vie privée de nos visiteurs : les données sont **anonymisées** et ne sont pas transmises en dehors de l'Union Européenne, dans le respect du RGPD.


Sources : [Les Échos](https://www.lesechos.fr/tech-medias/hightech/lutilisation-de-google-analytics-enfreint-le-droit-europeen-selon-la-cnil-1386157) | [CNIL](https://www.cnil.fr/fr/utilisation-de-google-analytics-et-transferts-de-donnees-vers-les-etats-unis-la-cnil-met-en-demeure)
