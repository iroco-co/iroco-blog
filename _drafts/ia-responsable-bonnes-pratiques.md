---
layout: post
title: Les bonnes pratiques de l'IA responsable
authors:
  - adeline
  - bruno
categories:
  - Grand public
tags:
  - Numérique responsable
  - IA Responsable
---

_Qu’on parle ou non d’IA, lorsqu’on identifie un besoin dans une organisation, ou dans un contexte personnel, la première question à se poser est souvent la suivante : a-t-on besoin du numérique pour y répondre ? Et si oui, l’IA est-elle réellement nécessaire ? Ou une “simple” digitalisation sans IA est-elle suffisante ?._

![photo: please take nothing but picture, leave nothing but footsteps](/images/ia-responsable/florida-guidebook-unsplash.jpg)
_Photo de [lorida-Guidebook.com](https://unsplash.com/fr/@thefloridaguidebook) sur [Unsplash](https://unsplash.com/fr/photos/un-panneau-avertissant-les-gens-de-ne-pas-prendre-de-photos-9CRd1J1rEOM)_
      

## Les bonnes pratiques individuelles

Nous avons compris qu’utiliser l’IA n’est pas sans impact sur l’environnement et sur les personnes. Par conséquent, une bonne posture consiste à en avoir une utilisation à bon escient et en pleine conscience des enjeux qu’elle pose.

Prenons l’exemple des recherches sur internet : l’utilisation d’un moteur de recherche “classique” représente un impact environnemental environ 10 fois moindre que l’utilisation d’un robot conversationnel. Dans ce contexte, une démarche individuelle simple pourrait être de rester sur son moteur de recherche habituel ([Qwant](https://www.qwant.com), [Kagi](https://kagi.com/), [Google](https://google.fr) ou autre). Par exemple, il n’est pas pertinent d’utiliser l’IA pour avoir la météo du jour ou l’itinéraire pour se rendre à son prochain rendez-vous (évitez par exemple [de rater votre avion après avoir demandé à ChatGPT](https://www.reddit.com/r/Fauxmoi/comments/1mr44zm/influencer_breaks_down_in_tears_after_trusting/) et sauvez 2 arbres), sachant que cela consomme beaucoup de ressources et que la réponse a une probabilité assez élevée d’être fausse !

Prenons un second exemple : vous avez besoin d’une image pour illustrer une présentation PowerPoint. Vous pouvez en première intention utiliser des banques d’images gratuites comme [Unsplash](https://unsplash.com) (cf plus haut dans cet article) ; vous pouvez ensuite laisser parler votre créativité et créer votre propre illustration (cf plus bas), et si vous ne trouvez pas votre bonheur, vous pouvez modifier une image approchante dans un logiciel de retouche, qui disposera de fonctions assistées par IA bien plus ciblées et efficaces qu’un générateur d’images comme Midjourney ou Dall-E. D’une manière générale, et comme pour les usages métier, prenez le temps de la réflexion pour identifier l’outil le plus adapté à votre besoin. Une astuce : 

> quel outil auriez-vous utilisé avant l'avènement des IA génératives ?

Enfin, soyez vigilants face aux biais et aux fausses informations parfois fournies par les IA : utilisez-les comme une aide à la réflexion mais ne vous reposez jamais intégralement sur leurs réponses. D’une manière générale, soyez curieux et exercez votre esprit critique, pour l’IA comme pour le reste !

##  Et au niveau professionnel ?

![photo: un mur de l'agile open](/images/ia-responsable/openspace.jpg)
_Un mur de postit bien décorés..._

Plusieurs éléments sont à prendre en compte :

- Quelle est la valeur ajoutée de l’IA dans le cas de figure étudié ? L’IA apporte-t-elle un surplus de performance significatif comparée à une simple digitalisation ?
- Le processus en jeu peut-il s’accommoder du caractère aléatoire des IA ? Dit autrement, le processus peut-il supporter une erreur de prédiction du modèle, car les IA ne sont jamais infaillibles ? Dans certains cas, un traitement manuel ou digital sans IA peut être plus rapide — et source de moins d’erreurs ou de frustration — qu’un traitement par l’IA.

En définitive, il s’agit de mettre en balance les bénéfices et les coûts de la mise en place d’un système embarquant de l’IA.

Si l’IA est de manière certaine la solution la plus adaptée, l’utilisation de modèles d’IA **spécifiques** et **proportionnés** à l'objectif visé entraîne **des gains de temps et d’énergie considérables** comparé à un LLM “bon à tout faire”. La chercheuse Sasha Luccioni [a notamment mesuré](https://arxiv.org/abs/2311.16863) qu’il existait parfois plusieurs ordres de grandeur entre la consommation d’énergie de différents modèles d’IA. 

![graph montrant la quantité d'émission de CO2 en fonction du modèle utilisé](/images/ia-responsable/ia-models-co2-emissions.png)

Le graphique donne la valeur des émissions d’équivalent CO2 (axe vertical, en échelle logarithmique) générées lorsqu’une tâche donnée est confiée à un modèle d’IA (les différentes tâches sont sur l’axe horizontal). On voit qu’une IA “simple” de classification de texte consommera en moyenne 10 fois moins d’énergie pour une requête qu’une IA de génération de texte adossée à un LLM.

Par exemple, il est tout à fait possible d’extraire des entités nommées (des noms de personnes, de lieux, d’entreprises…) dans un texte avec un LLM ; mais des outils de traitement du langage naturel bien plus frugaux comme [spaCy](https://spacy.io/) ont une précision comparable. N’hésitez pas aborder ces enjeux de frugalité avec le data scientist qui vous accompagne sur votre projet d’IA !

Par ailleurs, on peut se poser des questions sur l’impact cognitif de l’IA : son utilisation représente-t-elle un risque de perte de compétence pour les collaborateurs, ou une perte d'expertise pour l'organisation ? Lorsqu’on itère sur un prompt pour aboutir à un résultat, on ne réalise pas la tâche soi-même : on perd potentiellement une partie du lien avec son activité professionnelle. Il est donc nécessaire de bien vérifier et relire le résultat pour se l’approprier, et il ne faut pas hésiter à faire soi-même des tâches que l’on pourrait confier à l’IA afin de monter en compétences ou de les préserver.

----
Retrouvez les autres articles de cette série :

- [Le cycle de vie de l'IA](/ia-responsable-cycle-de-vie)
- [Les enjeux humains et éthiques de l'IA](/ia-responsable-enjeux-humains-ethiques/)
- [Les enjeux de règlementation et souveraineté numérique liés à l'IA](/ia-responsable-reglementation-et-souverainete/)

