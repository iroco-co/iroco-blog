---
layout: post
title: Comment limiter l'impact des mails ?
description: Dans l'ACV comparative réalisée avec Hubblo, nous nous sommes demandé comment limiter l'impact des mails.
authors:
  - adeline
  - bruno
categories:
- Grand public
tags:
- ACV Mail
---

![Illustration de l'article](/images/ACV/mathyas-kurmann-fb7yNPbT0l8-unsplash.jpg)
Photo de <a href="https://unsplash.com/fr/@mathyaskurmann?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Mathyas Kurmann</a> sur <a href="https://unsplash.com/fr/photos/six-boites-aux-lettres-de-couleurs-assorties-fb7yNPbT0l8?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>

_Nous avons rapidement compris que l'optimisation de l'usage du mail n'allait pas changer de manière drastique son impact environnemental puisque les effets les plus importants sont ceux du matériel (serveurs, infrastructure réseau, mobiles, ordinateurs portables, de bureau, tablettes). Nous voulions alors saisir l'opportunité de la réalisation d'une Analyse de Cycle de Vie en collaboration avec [Hubblo](https://hubblo.org/) et l'[ADEME](https://www.ademe.fr/) pour creuser d'autres pistes sur des changements d'usage ou des temporalités différentes._

Au départ d'Iroco était l'optimisation. L'hypothèse était que la diminution de la charge machine, de l'usage de la mémoire, du réseau allait limiter l'impact environnemental. Et puis nous avons appris sur le sujet du numérique responsable (ou acceptable[^1]) grâce à [Boavizta](http://boavizta.org/) entre autre, et compris que les impacts les plus importants du numérique étaient ailleurs :
* par ex ~80% des gaz à effet de serre sont du scope 3 c'est à dire la construction et le recyclage des équipements informatiques ;
* l'utilisation de l'eau et des minerais est principalement liée à la fabrication ;
* la pollution également.

[^1]: voir [Manifeste pour un alternumérisme radical](https://louisderrac.com/2023/10/manifeste-pour-un-alternumerisme-radical-v1/) qui part du constat que le numérique a toujours un impact négatif et donc n'est pas responsable, pour définir le "numérique acceptable" dont on connaît les effets délétères, mais qu'on accepte par compromis au regard de la valeur que le service rend.

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

## Levier 1 : modification dynamique du réseau d'accès

Nous savons qu'au niveau exploitation il existe des différences significatives entre l'utilisation du réseau en mode itinérant (3G, 4G, 5G) et fixe (wifi, cable). Nous considérons la consommation électrique des équipements uniquement. Comme l’ont montré Malmodin (2020)[^2] la consommation électrique des réseaux numériques n’est pas linéairement reliée à la quantité de données transférées : ils se comportent comme une fonction affine (de type a*x+b). Pour maintenir un haut niveau de disponibilité, une partie importante de la consommation électrique est fixe. Cette part implique une consommation électrique du réseau, peu importe s’il participe à un transfert de données ou non. Nous imaginons alors que nous pourrions avec une application mobile différer dans le temps l'envoi de message non urgents lorsque le mobile est en itinérance, et les envoyer quand la connexion wifi est à nouveau activée. Ce sera notre premier scénario "modification dynamique du réseau d'accès".

[^2]: Jens Malmodin (Ericsson), 2020, Fraunhofer IZM, www.electronicsgoesgreen.org 87ISBN 978-3-8396-1659-8 [Electronics Goes Green 2020+](https://online.electronicsgoesgreen.org/wp-content/uploads/2020/10/Proceedings_EGG2020_v2.pdf)

## Levier 2 : Déplacement de la demande dans le temps

L'impact carbone par kilowatt/heure est aussi sujet à une variabilité importante[^3]. Il peut fluctuer entre 25g avec des production d'énergie décarbonées (EnR, nucléaire) et 800g avec une production d'électricité à base de centrales thermiques au charbon. Soit un facteur 32. Sur la même hypothèse d'urgence de message nous pourrions décaler dans le temps la délivrance des messages non urgents en attendant un mix énergétique optimum, ou des sous-charges dans l'infrastructure électrique. Comme il existait avant des timbres de couleurs et prix différents pour le courrier en fonction du temps d'acheminement. Voici notre second scénario "déplacement de la demande dans le temps".

[^3]: [electricitymaps.com](https://app.electricitymaps.com/map) est un site qui donne la quantité de carbone émise par KW/h par pays en temps réel.

## Levier 3 : Diminution du dimensionnement de l'infrastructure

Toujours sur la temporalité du mail, le dimensionnement d'une infrastructure informatique est conçu pour absorber les pics d'utilisation. Du coup l'infrastructure est soit surdimensionnée, soit adaptative à la demande de charge (en scalabilité élastique). En lissant les pics de traitement des messages dans le temps, nous pourrions limiter le nombre de serveurs à fabriquer, recycler, et leur usage d'énergie lors de leur utilisation (même en scalabilité élastique). Ce sera notre troisième levier "Diminution du dimensionnement de l'infrastructure".

## Levier 4 : Compatibilité du service mail avec les terminaux utilisateurs

Enfin pour diminuer le remplacement des terminaux, leur recyclage et leur fabrication, nous pourrions concevoir nos services (notamment les parties web) pour qu'ils soient compatibles avec des terminaux anciens. Limiter l'obsolescence programmée.  Ce sera notre dernier levier "Compatibilité du service mail avec les terminaux utilisateurs".

Nous partons de mesures (taille, pièce jointes, destinataires) faites sur un échantillon de mail relevés sur notre serveur pour 3 utilisateurs typiques du service pendant une semaine. Et voila! "Il ne reste plus qu'à" modéliser ces scénarii avec cet échantillon !

## Méthodologie

Pour la méthodologie, nous avons utilisé deux méthodes d'analyse. La méthode "traditionnelle" dite ***attributionnelle*** (ACV-A). Cette méthode caractérise les impacts de l'unité fonctionnelle (ici l'envoi et la réception de mail pour un utilisateur à une dizaine d'interlocuteurs pendant une semaine) relativement à l'ensemble de la technosphère. Et la méthode ***conséquentielle*** : c'est une approche de type "delta" : on pense un changement par rapport à l'état actuel ses impacts sur différents critères environnementaux [^4].

3 articles feront suite à cette introduction :

- Quel est l'impact de l'immédiateté du mail (leviers 1 et 2)
- Quel est l'impact de la taille des infrastructures sur l'environnement (levier 3) ?
- Quel est l'impact de faire durer les terminaux plus longtemps (levier 4 avec la conclusion de l'étude) ?

[^4]: cf cet article sur notre ACV par David Ekchajzer de [Hubblo](https://hubblo.org) [Counting environmental impacts using attributional and consequential approaches](https://hubblo.org/blog/attributional-vs-consequential/) qui présente les différences entre ACV attributionnelle et conséquentielle.
