---
layout: post
title: Pourquoi quitter GitHub ?
authors:
  - iroco
categories:
- Grand Public
tags:
- Futurs numériques
---

_Lorsque Microsoft a racheté Github en 2018 nous avions hésité à migrer tous nos dépôts logiciels vers une solution alignée avec notre volonté de créer des communs numériques. Nous pensions à l'époque que la valeur du code hébergé dissuaderait Microsoft de reproduire l'histoire de Skype. C'est justement la valeur du code et l'évolution de la stratégie de Microsoft vers le cloud et l'IA qui font que nous souhaitons quitter cette plateforme à présent._ 

> Pourquoi ce projet n'est plus sur GitHub ?

Résumé: 

En tant qu'organisation qui valorise la construction de communs numériques, nous ne souhaitons pas alimenter les modèles LLM OpenAI/Microsoft. 

1. Nous pensons l'IA générative est délétère, pour la [cognition humaine](https://www.bloomberg.com/news/articles/2025-08-12/ai-eroded-doctors-ability-to-spot-cancer-within-months-in-study), le [respect des données](https://jskfellows.stanford.edu/theft-is-not-fair-use-474e11f0d063), l'[environnement](https://iea.blob.core.windows.net/assets/ed0483fd-aab4-4cf9-b25a-5aa362b56a2f/EnergyandAI.pdf) (l'utilisation de copilot représente une puissance de [20,8W avec 90% de perte](https://arxiv.org/abs/2411.11892)), la [désinformation](https://www.technologyreview.com/2023/10/04/1080801/generative-ai-boosting-disinformation-and-propaganda-freedom-house/), et tous ses biais : le [colonialisme](https://karendhao.com/), le [racisme](https://www.npr.org/2025/07/09/nx-s1-5462609/grok-elon-musk-antisemitic-racist-content), le [sexisme](https://www.unwomen.org/en/news-stories/interview/2025/02/how-ai-reinforces-gender-bias-and-what-we-can-do-about-it). Nous ne sommes pas contre l'IA en tant que telle, nous sommes contre la manière dont l'IA est mise en oeuvre avec Copilot par GitHub  et finalement Microsoft et OpenAI.

2. nous ne voulons pas alimenter l'[écosystème techno-autoritaire](https://www.authoritarian-stack.info/) qui se met en place aux Etats-Unis, nous réprouvons les implications de Microsoft [avec l'utilisation de l'IA/Azure par les armées Israélienne et Américaines](https://www.972mag.com/microsoft-azure-openai-israeli-army-cloud/) et nous souhaitons conserver la souveraineté sur notre environnement informatique.

----
Version longue

A la QCon de Londre, vendredi 9 mars 2012, Zach Holman [présente](https://qconlondon.com/london-2012/qconlondon.com/london-2012/presentation/How%20GitHub%20Works.html) une nouvelle manière de [travailler](https://zachholman.com/posts/how-github-works/), sans patrons (ou presque), sans horaires, voire sans bureaux. 

<iframe title="vimeo-player" src="https://player.vimeo.com/video/43684882?h=db53c6e031" width="640" height="360" frameborder="0" referrerpolicy="strict-origin-when-cross-origin" allow="autoplay; fullscreen; picture-in-picture; clipboard-write; encrypted-media; web-share"   allowfullscreen></iframe>

Ce que l'on allait appeler [une disruption](https://books.google.com/ngrams/graph?content=disruption&year_start=1800&year_end=2022&corpus=fr&smoothing=3&case_insensitive=false). Ca l'était également du point de vue technique : 

```
(Gestion de version distribuée) git + web = social coding
```

S'en sont suivi une adoption massive par les développeurs, séduits par le concept, la praticité et la gratuité du service (dont nous faisions partie), ainsi que [des levées de fond pour accompagner la croissance](https://thelinuxcode.com/lets-unpack-microsofts-acquisition-of-github/) de la startup.

Le 4 juin 2018 Microsoft [rachète GitHub](https://www.cnet.com/tech/tech-industry/microsoft-acquire-github-7-5-billion-stock-solidify-developer-ties/) pour 7,5 milliards de dollars en stock options. 100&nbsp;000 projets sur les 75 millions présents sur la plateforme quittent GH. A l'origine du rachat, Satya Nadella, le nouveau dirigeant de Microsoft, opère un virage à 180 degrés vers l'opensource qu'ont toujours combattu Bill Gates et Steve Ballmer (notamment au travers de linux). Satya Nadella s'engage par ailleurs à respecter la communeauté des développeurs. Certes, l'accès à github est toujours gratuit ([dans certaines limites](https://github.com/pricing)) mais Microsoft ayant besoin d'un relai de croissance s'est orienté vers le cloud et l'IA.

Depuis 2019 ils ont investi plus de 13 milliards de dollars dans OpenAI et en février 2023, ils développent [Copilot](https://en.wikipedia.org/wiki/Microsoft_Copilot), un LLM basée sur GPT-4. Ils intègrent copilot dans la suite Office et dans VSCode (un éditeur de code). Pour entraîner la génération de code ils utilisent les projets publics GitHub — avec un certain [manque de transparence](https://github.com/orgs/community/discussions/148571) sur [les dépôts personnels privés](https://github.com/orgs/community/discussions/135400) — en se basant sur la notions de _fair use_ et les Conditions Générales d'Utilisation de GH.

[Dans une analyse juridique](https://static.fsf.org/nosvn/copilot/Copyright-Implications-of-the-Use-of-Code-Repositories-to-Train-a-Machine-Learning-Model.pdf) la Free Software Fondation indique que l'entraînement par GitHub et l'usage par les utilisateurs de Copilot _may not_ (peut ne pas) être une violation des conditions d'attribution des licenses open source. N'est-ce pas le flou juridique sur lequel se base l'ubérisation ? "_Move fast and break things_" comme dit Mark Zuckerberg.

En tant qu'organisation qui valorise la construction de communs numériques, nous avons des dépôts opensource publics et nous ne voulons pas alimenter les modèles LLM OpenAI/Microsoft. Nous préférons le modèle "[_move slow and fix things_](https://endler.dev/2024/move-slow-and-fix-things/)". 

D'une part car nous pensons que ce modèle est délétère, pour la [cognition humaine](https://www.bloomberg.com/news/articles/2025-08-12/ai-eroded-doctors-ability-to-spot-cancer-within-months-in-study), le [respect des données](https://jskfellows.stanford.edu/theft-is-not-fair-use-474e11f0d063), l'[environnement](https://iea.blob.core.windows.net/assets/ed0483fd-aab4-4cf9-b25a-5aa362b56a2f/EnergyandAI.pdf) (l'utilisation de copilot représente une puissance de [20,8W avec 90% de perte](https://slides.com/tristancoignion/green-my-llm-interne/)), la [désinformation](https://www.technologyreview.com/2023/10/04/1080801/generative-ai-boosting-disinformation-and-propaganda-freedom-house/), et tous ses biais : le [colonialisme](https://karendhao.com/), le [racisme](https://www.npr.org/2025/07/09/nx-s1-5462609/grok-elon-musk-antisemitic-racist-content), le [sexisme](https://www.unwomen.org/en/news-stories/interview/2025/02/how-ai-reinforces-gender-bias-and-what-we-can-do-about-it). Nous ne sommes pas contre l'IA en tant que telle, nous sommes contre la manière dont l'IA est mise en oeuvre avec Copilot par GitHub  et finalement Microsoft et OpenAI. Nous l'utilisons (par exemple pour des traductions) avec parcimonie et en conscience. 

D'autre part, nous ne voulons pas alimenter l'[écosystème techno-autoritaire](https://www.authoritarian-stack.info/) qui se met en place aux Etats-Unis, nous réprouvons les implications de Microsoft [avec l'utilisation de l'IA/Azure par les armées Israélienne et Américaines](https://www.972mag.com/microsoft-azure-openai-israeli-army-cloud/) et nous souhaitons conserver la souveraineté sur notre environnement informatique.

Nous avons déjà migré une grande partie de nos dépôts logiciels. Ce blog est maintenant hébergé sur [Codeberg](https://codeberg.org/). Suivra un autre blog post sur ce que nous aurons appris et "Comment quitter GitHub ?".

----
English version: 

TLDR;

As an organization that values the building of digital commons, we do not want to participate to the OpenAI/Microsoft LLM model development. 

1. we believe that this model is harmful to [human cognition](https://www.bloomberg.com/news/articles/2025-08-12/ai-eroded-doctors-ability-to-spot-cancer-within-months-in-study), [data privacy](https://jskfellows.stanford.edu/theft-is-not-fair-use-474e11f0d063), the [environment](https://iea.blob.core.windows.net/assets/ed0483fd-aab4-4cf9-b25a-5aa362b56a2f/EnergyandAI.pdf) (Copilot consumes [20.8W of power with 90% loss](https://slides.com/tristancoignion/green-my-llm-interne/)), [misinformation](https://www.technologyreview.com/2023/10/04/1080801/generative-ai-boosting-disinformation-and-propaganda-freedom-house/), and all its biases: [colonialism](https://karendhao.com/), [racism](https://www.npr.org/2025/07/09/nx-s1-5462609/grok-elon-musk-antisemitic-racist-content), [sexism](https://www.unwomen.org/en/news-stories/interview/2025/02/how-ai-reinforces-gender-bias-and-what-we-can-do-about-it). We are not against AI, we are against the way AI is implemented with Copilot by GitHub and ultimately Microsoft and OpenAI. We use it (for example for translations) sparingly and conscientiously.

2. we do not want to contribute to the [techno-authoritarian stack](https://www.authoritarian-stack.info/) that is developing in the United States. We disapprove of Microsoft's involvement in the [use of AI/Azure by the Israeli](https://www.972mag.com/microsoft-azure-openai-israeli-army-cloud/) and American armies, and last but not least, we wish to maintain sovereignty over our IT stack.

----

_When Microsoft acquired GitHub in 2018, we hesitated to migrate all our software repositories to a solution aligned with the digital commons spirit. At the time, we believed that the value of the hosted code would dissuade Microsoft from repeating the Skype story. It is precisely the value of the code and Microsoft's shift in strategy towards the cloud and AI that have led us to want to leave this platform now._

> Why is this project no longer on GitHub?

At QCon London on Friday, March 9, 2012, Zach Holman presented a new way of working, without bosses (or almost), without schedules, and even without offices.

<iframe title="vimeo-player" src="https://player.vimeo.com/video/43684882?h=db53c6e031" width="640" height="360" frameborder="0" referrerpolicy="strict-origin-when-cross-origin" allow="autoplay; fullscreen; picture-in-picture; clipboard-write; encrypted-media; web-share"   allowfullscreen></iframe>

What would come to be known as disruption. It was also disruptive from a technical point of view:

```
(Distributed version control) git + web = social coding
```

This was followed by widespread adoption by developers, who were attracted by the concept, the practicality, and the fact that the service was free (we were among them), as well as fundraising [to support the startup's growth](https://thelinuxcode.com/lets-unpack-microsofts-acquisition-of-github/).

On June 4, 2018, Microsoft [acquired GitHub for $7.5 billion stock](https://www.cnet.com/tech/tech-industry/microsoft-acquire-github-7-5-billion-stock-solidify-developer-ties/). 100,000 of the 75 million projects on the platform left GH. Behind the acquisition, Satya Nadella, Microsoft's new CEO, made a 180-degree shift toward open source, which Bill Gates and Steve Ballmer had always fought against (particularly through Linux). Satya Nadella also committed to respecting the developer community. While access to GitHub is still free ([within certain limits](https://github.com/pricing)), Microsoft, in need of a growth driver, turned its attention to the cloud and AI.

Since 2019, they have invested more than $13 billion in OpenAI. February 2023, they developed Copilot, an LLM based on GPT-4. They integrated Copilot into the Office suite and VSCode (an IDE). To train code generation, they use public GitHub projects — with a certain [lack of transparency](https://github.com/orgs/community/discussions/148571) on [private personal repositories](https://github.com/orgs/community/discussions/135400) — based on the concepts of fair use and GH's Terms of Service.

In [a legal analysis](https://static.fsf.org/nosvn/copilot/Copyright-Implications-of-the-Use-of-Code-Repositories-to-Train-a-Machine-Learning-Model.pdf), the Free Software Foundation indicates that training by GitHub and use by Copilot users may not be open source license attribution terms infringements. Isn't this the legal gray area on which uberization is based? “Move fast and break things,” as Mark Zuckerberg says.

As an organization that values the construction of digital commons, we have public open source repositories and do not want to feed into the OpenAI/Microsoft LLM models. We prefer the “[move slow and fix things](https://endler.dev/2024/move-slow-and-fix-things/)” model.

On one hand, because we believe that this model is harmful to [human cognition](https://www.bloomberg.com/news/articles/2025-08-12/ai-eroded-doctors-ability-to-spot-cancer-within-months-in-study), [data privacy](https://jskfellows.stanford.edu/theft-is-not-fair-use-474e11f0d063), the [environment](https://iea.blob.core.windows.net/assets/ed0483fd-aab4-4cf9-b25a-5aa362b56a2f/EnergyandAI.pdf) (Copilot consumes [20.8W of power with 90% loss](https://arxiv.org/abs/2411.11892)), [misinformation](https://www.technologyreview.com/2023/10/04/1080801/generative-ai-boosting-disinformation-and-propaganda-freedom-house/), and all its biases: [colonialism](https://karendhao.com/), [racism](https://www.npr.org/2025/07/09/nx-s1-5462609/grok-elon-musk-antisemitic-racist-content), [sexism](https://www.unwomen.org/en/news-stories/interview/2025/02/how-ai-reinforces-gender-bias-and-what-we-can-do-about-it). We are not against AI, we are against the way AI is implemented with Copilot by GitHub and ultimately Microsoft and OpenAI. We use it (for example for translations) sparingly and conscientiously.

Furthermore, we do not want to contribute to the [techno-authoritarian stack](https://www.authoritarian-stack.info/) that is developing in the United States. We disapprove of Microsoft's involvement in the [use of AI/Azure by the Israeli](https://www.972mag.com/microsoft-azure-openai-israeli-army-cloud/) and American armies, and we wish to maintain sovereignty over our IT environment.

We have already migrated a large part of our software repositories. This blog is now hosted on Codeberg. Another blog post will follow on what we have learned and “How to leave GitHub?”.

Partialy translated with DeepL.com.

