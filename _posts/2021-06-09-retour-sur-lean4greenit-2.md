---
layout: post
title: L'écoconception et le "software craftsmanship" ?
author:
  display_name: Bruno Thomas
tags:
- greenIT
comments: true
---
*Article initialement publié sur [barre verte](https://www.barreverte.fr) le 17 octobre 2018*

![Image : le bourgeois gentilhomme]({{ site.url }}/images/ecoconception/aof2014.jpg)

Lors de l'[Agile Open France](http://agileopenfrance.com/), j'ai été déçu que mon sujet sur l'écoconception n'ait pas attiré grand monde : nous étions au plus 5. Pour ceux qui ne connaissent pas l'événement, il y a beaucoup d'indépendants, *coaches* et *software craftsmen* passionnés. C'est précisément ce qui m'intéressait : l'avis d'experts du développement. Mais le peu de personnes "votant avec leurs pieds" pour l'écoconception était déjà un enseignement, et grâce aux personnes qui sont venues échanger sur le sujet (merci à elles), j'ai pu comprendre pourquoi.

> "C'est un problème d'optimisation, ça coûte."

Effectivement, c'est un souci d'efficacité. Et ce problème est souvent abordé par nécessité économique. Lorsque vous faites en sorte d'utiliser 5 serveurs au lieu de 20 pour le même nombre d'utilisateurs, afin de baisser les coûts d'exploitation de votre service, vous faites de l'écoconception.

On retrouve la proximité entre les termes **éco-nomique** (de "*[oikos](https://fr.wikipedia.org/wiki/Oikos)*" la maison, "*[nomos](https://fr.wiktionary.org/wiki/nomos)*" l'administration) et **éco-logique** ("*[logos](https://fr.wikipedia.org/wiki/Logos)*" le récit). Ce n'est pas toujours le cas, mais dans l'exploitation de services web, l'amélioration des performances économiques va en général de pair avec celle des performances écologiques.

Et donc, ce n'est pas un sujet, car un bon *craftsman* ou artisan logiciel, gardera toujours en tête l'efficacité des programmes qu'il développe, sans en faire une priorité.

> "L'optimisation prématurée est la racine de tous les maux" -- [Donald Knuth](http://wiki.c2.com/?PrematureOptimization)

Car de l'autre côté, si on considère non plus l'efficacité de l'exploitation des programmes sur les serveurs, mais l'efficacité du développement et de la maintenance de ces programmes, l'optimisation coûte, et peut même coûter très cher. Optimisation du code et lisibilité/testabilité sont antinomiques : l'amélioration du temps de traitement d'un programme par la machine demandera à l'humain plus d'efforts pour le comprendre. Essayez de lire de l'assembleur, du javascript minifié ou du bytecode. Essayez également de poser des tests unitaires sur du code Java principalement statique (ecoconception web [bonne pratique n°66](https://collectif.greenit.fr/ecoconception-web/2018-09-Ref-eco_web-checklist.v2.pdf)).

La mise en évidence des améliorations de performances est elle aussi coûteuse : faire des programmes de tests de charge, des campagnes de benchmark.

Plus le code est optimisé, plus il sera cher à élaborer et à maintenir. Les sociétés qui développent des services en ligne veulent diminuer les coûts de développement. L'amélioration des performances n'est considérée que si le sujet est mis sur le devant de la scène par les utilisateurs, ou par la gestion de l'exploitation.

> "Le vrai sujet c'est l'expérience utilisateur"

Si l'optimisation d'un programme permet de faire de l'écoconception, l'amélioration de l'expérience utilisateur peut aussi entraîner des gains d'utilisation des resources. La minification des fichiers javascript et CSS assure de meilleurs temps de chargement d'un site et une réactivité de service. De la même manière, le *offline first* évite à l'utilisateur de télécharger des données inutiles sur son forfait mobile et fluidifie les interactions avec l'application.

L'écoconception est donc au *craftsman* ce que la prose est à Monsieur Jourdain.

![Image : le bourgeois gentilhomme]({{ site.url }}/images/ecoconception/bourgeois_gentilhome.jpg)

## Optimisation certes, et aussi :

### Des choix technologiques

Nous pouvons améliorer notre code pour consommer moins de CPU, de mémoire et de réseau. C'est vrai pour un environnement donné mais qu'en est-il de l'impact sur la consommation d'énergie d'un serveur d'application en PHP, Java, python, nodeJS, ruby, etc. ?

[Un article](https://hal.inria.fr/hal-00681560v3/document) du CNRS à propos de la "[réduction de consommation énergétique des logiciels](http://www.cnrs.fr/ins2i/spip.php?article2365)" traite des différences entre plusieurs langages. En [mesurant la consommation électrique](http://powerapi.org/) d'un programme de résolution du problème de la tour de Hanoï écrit en différents langages, ils ont mis en évidence que :

> Pour une même application, un langage interprété comme Python consomme 100 fois plus qu’un langage compilé comme Java. (...) pour les langages compilés orientés objets, Java consomme moins que du C++ avec les options par défaut et autant en niveau d'optimisation O3.


![Image : tour de hanoi]({{ site.url }}/images/ecoconception/tour-hanoi800.jpg)
Source : Flickr / Photo © [lilszeto](https://www.flickr.com/photos/mszeto/)

Ce programme de la tour de Hanoï est orienté orienté calcul (utilisant quasiment exclusivement le CPU), par opposition à un programme orienté entrées/sorties. Un serveur d'application faisant du web en architecture 3 tiers, sera souvent orienté entrées/sorties : le facteur limitant ne sera pas le CPU mais l'utilisation accrue des entrées/sorties. Mais ce que montre l'article, c'est que l'environnement technologique a des conséquences importantes sur la puissance consommée par les serveurs.

Les environnements web, avec un grand nombre de communications réseau (proxies, base de données, bus de données), de lecture-écriture de fichiers, utilisent de plus en plus la programmation asynchrone. NodeJS, [asyncio](https://docs.python.org/3/library/asyncio.html) pour python3, [NIO](https://stackoverflow.com/questions/33692992/does-jdk7-nio-2-use-epoll-etc-on-linux) pour Java, basés sur les couches epoll (pour linux) et kqueue (pour FreeBSD/MacOS), ont eu un essor important pour des raisons de [performance](http://www.kegel.com/c10k.html). Ces solutions sont aussi intéressantes au niveau de l'écoconception puisqu'elles permettent aux serveurs d'attendre des événements sur des entrées sorties.


### La lutte contre l'obsolescence programmée

Si on prend en compte le cycle de vie des produits technologiques, une grande partie des dommages causés à la planète est lié au rythme d'obsolescence des produits. Par exemple, un mobile est changé tous les 18 mois en moyenne, alors qu'il serait capable de fonctionner jusqu'à 5 à 7 ans. La fréquentation de sites qui ne sont pas adaptés peuvent pousser certains internautes à changer leurs terminaux.

![Image : tour de hanoi]({{ site.url }}/images/ecoconception/mobile_garbage.jpg)
Source: Photo © [Fairphone](https://www.fairphone.com/en/2016/07/14/closing-the-loop-the-garbage-collectors-of-the-mobile-industry/)

Or, lors du développement d'un site, il est possible de prendre en compte la compatibilité avec d'anciens appareils. En tant que développeur, nous pouvons faire en sorte qu'un site se "dégrade" tout en restant fonctionnel : les bords ronds d'une CSS3 seront carrés, le *smooth scrolling* en javascript n'est pas rendu, mais la page est chargée, ou l'ancre atteinte, etc. En faisant de la sorte, nos utilisateurs peuvent consulter nos sites même avec un vieux mobile, et nous ne pesons pas dans leur décision de changer de mobile.

En revanche, cela demande généralement de consacrer plus de temps au développement, pour tester le site avec différents mobiles, et adapter le code en fonction des dysfonctionnements.

### La participation aux communs numériques

Internet est construit sur des communs numériques. Les protocoles standard sont ouverts :

* web : [HTTP](https://www.ietf.org/rfc/rfc2616.txt), [HTTP2](https://tools.ietf.org/html/rfc7540),
* mail : [IMAP](https://tools.ietf.org/html/rfc3501), [SMTP](https://tools.ietf.org/html/rfc5321),
* usegroup : [NNTP](https://tools.ietf.org/html/rfc3977),
* réseau : [DNS](https://www.ietf.org/rfc/rfc1035.txt), [ARP](https://tools.ietf.org/html/rfc826), [BGP](https://tools.ietf.org/html/rfc4271), [SNMP](https://tools.ietf.org/html/rfc1157)

...pour n'en citer que quelque-uns. Ces protocoles sont simples et efficaces. Quand ils peuvent être améliorés, des [RFC complémentaires](https://www.imapwiki.org/ImapRFCList) peuvent être proposées. Ils peuvent aussi être repensés comme le HTTP2 qui apporte des nouvelles fonctions majeures (push serveur, pipelining, multiplexing, compression des entêtes). Ces améliorations ont des leviers énormes car le réseau mondial en bénéficie. Quand ils ne sont pas respectés par un acteur c'est au prix d'une augmentation de la complexité du code des composants qui interagissent avec cet acteur, et souvent également d'inefficacité.

Par exemple, yahoo mail n'implémente pas la [commande IDLE](https://tools.ietf.org/html/rfc2177), ce qui oblige les clients mails en IMAP à scruter l'arrivée de nouveaux mails régulièrement.

<img class="right" alt="logo creative commons" src="{{ site.url }}/images/ecoconception/Creative_Commons_logo.png" />

Dans les [bonnes pratiques](https://collectif.greenit.fr/ecoconception-web/2018-09-Ref-eco_web-checklist.v2.pdf) de conception d'un site web, il est indiqué de valider les pages auprès du W3C pour éviter au navigateur de devoir corriger les erreurs à l'affichage, ou encore, de valider le javascript avec JSLint.

Enfin, après avoir développé dans plusieurs grands groupes français, j'ai vu plusieurs projets de dizaines voire centaines de milliers de lignes de code partir à la benne (parfois même avant d'aller en production). Pourquoi ne recyclerait-t-on pas ce code en le donnant à la communauté ? Des développeurs pourraient s'y intéresser et en reprendre certaines parties.

### L'accessibilité

<img class="right" alt="image accessibilité" src="{{ site.url }}/images/ecoconception/accessibility.jpg" />

L'accessibilité d'un site web, c'est faire en sorte qu'il soit utilisable par le plus grand nombre :

* avec un petit écran
* avec un vieil ordinateur
* en grossissant la police de caractère
* en faisant lire le texte par synthèse vocale

Même si c'est lié à l'UX, à la lutte contre l'obsolescence programmée, au respect des standards du web, ça va plus loin, en fournissant par exemple des textes alternatifs aux images, des liens alternatifs pour les liens dans les images...

## L'écoconception : une opportunité

Alors oui, tout bon *craftsman* aura en tête ces pratiques. Et c'est une opportunité supplémentaire pour :

* améliorer la satisfaction des utilisateurs
* diminuer ses charges d'exploitation
* gagner des parts de marché, en permettant à plus d'utilisateurs d'utiliser ses services
* avoir une responsabilité sociétale d'entreprise et des collaborateurs engagés
* mettre en avant l'argument d'un développement durable auprès des utilisateurs

Ainsi, une démarche d’écoconception peut mener à l’innovation d'un point de vue différent, en mettant l’environnement et l’humain au centre.
