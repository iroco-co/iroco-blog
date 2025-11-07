---
layout: post
title: Pourquoi quitter GitHub ?
authors:
  - bruno
categories:
- Grand Public
tags:
- Futurs numériques
---

Pourquoi ce projet n'est plus sur GitHub ?

A la QCon de Londre, vendredi 9 mars 2012, Zach Holman [présente](https://qconlondon.com/london-2012/qconlondon.com/london-2012/presentation/How%20GitHub%20Works.html) une nouvelle manière de [travailler](https://zachholman.com/posts/how-github-works/), sans patrons (ou presque), sans horaires, voire sans bureaux. 

<iframe title="vimeo-player" src="https://player.vimeo.com/video/43684882?h=db53c6e031" width="640" height="360" frameborder="0" referrerpolicy="strict-origin-when-cross-origin" allow="autoplay; fullscreen; picture-in-picture; clipboard-write; encrypted-media; web-share"   allowfullscreen></iframe>

Ce que l'on allait appeler [une disruption](https://books.google.com/ngrams/graph?content=disruption&year_start=1800&year_end=2022&corpus=fr&smoothing=3&case_insensitive=false). Ca l'était également du point de vue technique : 

```
(Gestion de version distribuée) git + web = social coding
```

S'en sont suivi une adoption massive par les développeurs, séduits par le concept, la praticité et la gratuité du service ainsi que [des levées de fond pour accompagner la croissance](https://thelinuxcode.com/lets-unpack-microsofts-acquisition-of-github/) de la startup.

Le 4 juin 2018 Microsoft [rachète GitHub](https://www.cnet.com/tech/tech-industry/microsoft-acquire-github-7-5-billion-stock-solidify-developer-ties/) pour 7,5 milliards de dollars en stock options. 100&nbsp;000 projets sur les 75 millions présents sur la plateforme quittent GH. A l'origine du rachat, Satya Nadella, le nouveau dirigeant de Microsoft, opère un virage à 180 degrés vers l'opensource qu'ont toujours combattu Bill Gates et Steve Ballmer (notamment au travers de linux). Satya Nadella s'engage par ailleurs à respecter la communeauté des développeurs. Certes, l'accès à github est toujours gratuit ([dans certaines limites](https://github.com/pricing)) mais Microsoft ayant besoin d'un relai de croissance s'est orienté vers le cloud et l'IA.

Depuis 2019 ils ont investi plus de 13 milliards de dollars dans OpenAI et en février 2023, ils développent [Copilot](https://en.wikipedia.org/wiki/Microsoft_Copilot), un LLM basée sur GPT-4. Ils intègrent copilot dans la suite Office et dans VSCode (un éditeur de code). Pour entraîner la génération de code ils utilisent les projets publics GitHub — avec un certain [manque de transparence](https://github.com/orgs/community/discussions/148571) sur [les dépôts personnels privés](https://github.com/orgs/community/discussions/135400) — en se basant sur la notions de _fair use_ et les Conditions Générales d'Utilisation de GH.

[Dans une analyse juridique](https://static.fsf.org/nosvn/copilot/Copyright-Implications-of-the-Use-of-Code-Repositories-to-Train-a-Machine-Learning-Model.pdf) la Free Software Fondation indique que l'entraînement et l'usage par les utilisateurs de copilot _may not_ (peut ne pas) être une violation des conditions d'attribution des licenses open source.

En tant qu'organisation, nous avons des dépôts opensource publics et nous ne voulons pas alimenter les modèles LLM OpenAI/Microsoft. D'une part car nous pensons que ce modèle est délétère, pour la [cognition humaine](https://www.bloomberg.com/news/articles/2025-08-12/ai-eroded-doctors-ability-to-spot-cancer-within-months-in-study), le [respect des données](https://jskfellows.stanford.edu/theft-is-not-fair-use-474e11f0d063), l'[environnement](https://iea.blob.core.windows.net/assets/ed0483fd-aab4-4cf9-b25a-5aa362b56a2f/EnergyandAI.pdf) (l'utilisation de copilot représente une puissance de [18W avec 80% de perte]()), la [désinformation](https://www.technologyreview.com/2023/10/04/1080801/generative-ai-boosting-disinformation-and-propaganda-freedom-house/), et tous ses biais : le [colonialisme](https://karendhao.com/), le [racisme](https://www.npr.org/2025/07/09/nx-s1-5462609/grok-elon-musk-antisemitic-racist-content), le [sexisme](https://www.unwomen.org/en/news-stories/interview/2025/02/how-ai-reinforces-gender-bias-and-what-we-can-do-about-it). 

Enfin, nous ne sommes pas contre l'IA en tant que telle, nous sommes contre la manière dont l'IA est mise en oeuvre avec Copilot par GitHub  et finalement Microsoft et OpenAI.

Nous avons déjà migré une partie de nos dépôts logiciels, ce blog va également suivre le chemin pour Codeberg. Suivra un autre blog post sur ce que nous auront appris et "Comment quitter GitHub ?"



