---
layout: post
title: Les enjeux humains et éthiques de l'IA
author:
  name: iroco
categories:
  - Grand public
tags:
  - Numérique responsable
  - IA Responsable
---


## Les données d'entraînement

L’étape d’entraînement des IA demande des quantités de données très importantes, en particulier pour les modèles génératifs comme ChatGPT ou Midjourney. Ces modèles ont été rendus possibles en exploitant la quasi-intégralité de l’information disponible sur internet, sans toujours respecter les licences d’utilisation ni le droit d’auteur. L’actualité récente a mis en évidence ce problème : ChatGPT a permis la génération en masse d’images dans le style du Studio Ghibli, laissant supposer que l’IA avait été entraînée sur les films d’animation du studio, alors que Hayao Miyazaki, l’un de ses cofondateurs, est très critique à l’égard de l’IA.

La récupération sur internet des données d’entraînement se fait notamment à travers des “crawlers”, des programmes qui parcourent en permanence le web pour récolter ces données et alimenter les IA. Mais cela pose des problèmes : dans certains cas, ces crawlers aspirent une telle quantité de données que les organisations qui les hébergent doivent redimensionner leurs infrastructures à la hausse pour que leurs utilisateurs puissent continuer à utiliser normalement leurs services ! C’est par exemple [le cas de la Fondation Wikimedia](https://diff.wikimedia.org/2025/04/01/how-crawlers-impact-the-operations-of-the-wikimedia-projects/), qui héberge notamment Wikipédia.

Le deuxième problème relatif aux données d’entraînement, c’est leurs biais. Les modèles sont en effet susceptibles de reproduire les biais présents dans les données d'entraînement lors de la phrase d’inférence, c’est-à-dire au moment où ils produisent leurs prédictions, leurs réponses, etc. Il existe plein de biais différents, qui peuvent provenir par exemple de la sous-représentation de certains groupes au sein des données d’entraînement (c’est le biais d’échantillonnage), ou encore des convictions personnelles des programmeurs qui les conduiront inconsciemment à utiliser des données d’entraînement confirmant ces convictions (c’est le biais de confirmation). Un exemple célèbre nous vient de chez Amazon : leurs ingénieurs avaient eu l’idée de se faire assister par l’IA lors de la phase de tri des candidatures aux postes de développeurs. Les programmeurs déjà embauchés par la société étant en très grande partie des hommes, ils avaient eu la surprise de voir que les candidatures sélectionnées par l’IA étaient quasi exclusivement… des hommes : [l’IA reproduisait ce qu’elle avait constaté lors de son entraînement](https://www.reuters.com/article/us-amazon-com-jobs-automation-insight/amazon-scraps-secret-ai-recruiting-tool-that-showed-bias-against-women-idUSKCN1MK08G/).

## Les travailleurs du clic

Pour produire des résultats lors de la phase d’inférence, les IA doivent être entraînées avec des données « étiquetées ». Dans le cas de la reconnaissance d’images, cela signifie qu’une image de chat doit être annotée pour indiquer à la machine qu’il s’agit d’un chat. Sans cela, le modèle d’IA ne pourra jamais apprendre à distinguer l’animal. De cette manière, les valeurs des millions voire milliards de paramètres - pour les plus gros modèles - sont ajustées progressivement jusqu’à ce que la performance de l’algorithme soit satisfaisante.

L’étiquetage des données n’est pas toujours automatisable : il doit parfois être réalisé par des êtres humains manuellement. Ce travail d’annotation peut prendre plusieurs formes : encadrer un chat au sein d’une photo, surligner dans une phrase les mots désignant une personne, un lieu, une date... ou encore évaluer les réponses d’un chatbot. Deux objectifs sont recherchés : améliorer la qualité des prédictions ou réponses apportées par les IA et donner des limites (morales, légales) à ces réponses (dans le cas des chatbots).

Ce processus, même assisté, est fastidieux et très faiblement rémunéré. Par ailleurs, dans l’amélioration de la qualité d’outils de modération automatique, ou la prise en compte des réglementations nationales et internationales, des êtres humains vont devoir analyser des images, textes, contenus audio ou vidéo possiblement violents ou dérangeants. Ce travail occasionne chez certains des syndromes post-traumatiques, comme ceux observés chez les vétérans de guerre. Ces travailleurs du clic habitent souvent dans le “Sud global” (à [Madagascar par exemple pour le travail en français](https://theconversation.com/enquete-derriere-lia-les-travailleurs-precaires-des-pays-du-sud-201503)), ce qui permet notamment aux grandes sociétés d’IA de limiter leurs coûts afin de conserver un modèle économique le plus rentable possible.

##  L’IA, des usages multiples… et pas toujours positifs

L’IA offre une multiplicité d’usages, mais ceux-ci ne sont pas toujours bénéfiques pour les utilisateurs… et certains effets négatifs, comme les bulles de filtre, ne se révèlent que sur le long terme. Tour d’horizon (non exhaustif) de quelques problèmes posés par l’IA.

Deepfakes : reproduction de la voix ou de l’apparence physique d’une personne pour générer de l’audio ou de la vidéo lui prêtant des paroles ou des actions qu’elle n’a jamais eues. Peut être utilisé par exemple pour de la désinformation, des escroqueries, de la malveillance à caractère pornographique...

Recommandations sur les réseaux sociaux : bien qu’il ne s’agisse pas de pratiques illicites, plusieurs expériences ont montré que les algorithmes de recommandations sur certains réseaux sociaux ou plateformes de contenu avaient tendance à recommander des contenus clivants, idéologiquement extrêmes ou dérangeants. Ils peuvent également avoir tendance à “enfermer” les utilisateurs dans leurs croyances : c’est ce qu’on appelle la bulle de filtre.

Cybermalveillance assistée par IA : génération de textes par IA pour envoi de spam, analyse par IA de sites cibles pour identifier les meilleures stratégies d’attaque, etc.

Content spinning : génération automatique d’articles plagiant des articles à succès existants pour améliorer le classement d’un site dans les moteurs de recherche, ou encore génération de sites de e-commerce frauduleux.

## Explicabilité, transparence et confiance

Parce que les modèles d’IA sont constitués de très nombreux paramètres, il est extrêmement complexe, pour ne pas dire impossible, d’expliquer pourquoi l’IA a produit telle ou telle réponse : c’est le problème de l’explicabilité de l’IA, qui constitue un champ de recherche à part entière. Dans ce contexte, et compte tenu des enjeux déjà évoqués plus haut, comment faire confiance aux résultats produits par les IA ?

En 2020, dans son livre blanc, “Intelligence artificielle : Une approche européenne axée sur l'excellence et la confiance”, la Commission Européenne listait 7 principes éthiques auxquels les modèles d’IA doivent satisfaire pour être considérées comme dignes de confiance. Ces exigences ont été rappelées par le Règlement sur l’IA, mais aussi confirmées par l’OCDE et d’autres organisations internationales comme l’UNESCO.

**Action humaine et contrôle humain** : les systèmes d’IA sont développés et utilisés comme un outil au service des personnes, qui respecte la dignité humaine et l’autonomie de l’individu, et qui fonctionne de manière à pouvoir être contrôlé et supervisé par des êtres humains

**Robustesse technique et sécurité** : les systèmes d’IA sont développés et utilisés de manière à ce qu’ils soient techniquement robustes en cas de problème et résilients aux tentatives visant à en corrompre l’utilisation ou les performances afin de permettre à des tiers d’en faire une utilisation abusive, et à réduire le plus possible les atteintes involontaires

**Respect de la vie privée et gouvernance des données** : les systèmes d’IA sont développés et utilisés conformément aux règles en matière de respect de la vie privée et de protection des données, dans le cadre d’un traitement de données répondant à des normes élevées en matière de qualité et d’intégrité

**Transparence** : les systèmes d’IA sont développés et utilisés de manière à permettre une traçabilité et une explicabilité appropriées, faisant en sorte que les personnes réalisent qu’elles communiquent ou interagissent avec un système d’IA, que les déployeurs soient dûment informés des capacités et des limites de ce système d’IA et que les personnes concernées soient informées de leurs droits

**Diversité, non-discrimination et équité** : les systèmes d’IA sont développés et utilisés de manière à inclure des acteurs divers et à promouvoir l’égalité d’accès, l’égalité de genre et la diversité culturelle, tout en évitant les effets discriminatoires et les biais injustes, qui sont interdits par le droit de l’Union ou le droit national

**Bien-être social et environnemental** : les systèmes d’IA sont développés et utilisés d’une manière durable et respectueuse de l’environnement, mais aussi de manière à ce que tous les êtres humains en profitent, tout en surveillant et en évaluant les effets à long terme sur l’individu, la société et la démocratie

**Responsabilité** : les systèmes d’IA sont développés et utilisés de manière à être auditables, à réduire au minimum les incidences négatives et à permettre la transparence au sujet de ces incidences, et à permettre arbitrages et recours

