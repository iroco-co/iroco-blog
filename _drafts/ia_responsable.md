---
layout: post
title: IA Responsable
author:
  display_name: Iroco
categories:
  - Grand public
tags
  - Numérique responsable
---

L’IA est aujourd’hui partout dans nos vies professionnelles et personnelles. Or nous ne prenons pas toujours le temps de comprendre les enjeux environnementaux et humains derrière la fabrication et l’utilisation du numérique en général, et de l’IA en particulier.

#  Le cycle de vie de l’IA

Le numérique en général, et l’IA en particulier, nous paraissent souvent immatériels : ne parle-t-on pas de « dématérialisation » ou de « cloud » ? L’IA en particulier ne nous est-elle pas souvent présentée comme un peu magique, à grand renfort d’étoiles et d’étincelles ? Pourtant, utiliser l’IA nécessite le recours à de nombreuses infrastructures qui ne sont pas sans impact sur l’environnement et les humains. Comme pour tous les produits et tous les services, l’IA a un cycle de vie.

1. Extraction des matières premières et fabrication des équipements. Le cycle de vie de l’IA commence dans la mine, où sont extraits les métaux nécessaires à la fabrication des équipements numériques qui serviront à développer ou utiliser l’IA. Les composants puis les équipements sont ensuite fabriqués et assemblés en usine pour devenir nos ordinateurs et nos téléphones mais aussi les GPU (graphics processing units) nécessaires à l’entraînement et à l’utilisation des grands modèles d’IA, et les data centers qui hébergent les serveurs sur lesquels tournent beaucoup de services numériques.

2. Développement, entraînement et renforcement des modèles. Une fois développée la structure algorithmique de base d’un modèle d’IA, une phase d’entraînement est nécessaire : le modèle lit de grandes quantités de données afin « d’apprendre » à accomplir la tâche pour laquelle il a été conçu (par exemple reconnaître une image, prédire une température ou encore générer du texte ou une image dans le cas de l’IA générative). Cette phase d’entraînement nécessite notamment deux choses : une capacité de calcul, c’est-à-dire du temps de processeur, qui croît avec la taille du modèle et la quantité de données d’entraînement, et bien évidemment des données d’entraînement de bonne qualité.

3. Utilisation des modèles (inférence). Une fois entraînés, les modèles d’IA sont utilisés pour diverses finalités : c’est la phase d’inférence, où le modèle tire des conclusions sur la base des données d’entrée qui lui sont fournies par la personne qui l’utilise. Cette phase nécessite également une capacité de calcul, plus ou moins importante selon la tâche à accomplir et selon le type et la taille du modèle d’IA utilisé. La diversité des modèles disponibles et de leurs capacités fait de l’IA un outil très puissant pouvant être utilisé à de nombreuses fins... qui ne sont pas toujours licites ou utiles.

4. Fin de vie des équipements. Les équipements numériques finissent par tomber en panne... ou par être remplacés par des modèles plus performants ou plus récents. Ces équipements en fin de vie sont très peu recyclables et finissent la plupart du temps enfouis, incinérés ou dans des décharges à ciel ouvert.

# Les enjeux environnementaux de l'IA

## Consommation d'énergie

En amont du cycle de vie du numérique, les procédés d’extraction minière, de fabrication des équipements et de construction des data centers sont très consommateurs d’énergie et émetteurs de gaz à effet de serre.

Par ailleurs, l’entraînement et l’utilisation des modèles d’IA nécessitent dans certains cas de très grandes capacités de calcul : c’est notamment le cas des LLM comme GPT. Concrètement, cela signifie que les modèles d’IA sollicitent de nombreux processeurs, parfois très gourmands en énergie, pendant des durées allant de quelques secondes pour une inférence (une réponse d’Archi+, par exemple) à plusieurs semaines ou mois pour l’entraînement d’un modèle. Les data centers qui hébergent ces processeurs consomment donc de grandes quantités d’électricité. Même si toute la consommation des data centers n’est pas imputable à l’IA, l’AIE (Agence Internationale de l'Energie) projette qu’en 2030, ceux-ci consommeront à eux seuls 945 TWh par an, soit la consommation annuelle du Japon aujourd’hui.

Cela pose plusieurs problèmes : tout d’abord, la majeure partie de l’électricité produite dans le monde l’est à partir d’énergies fossiles, fortement émettrices de gaz à effet de serre. Aux Etats-Unis par exemple, le mix électrique est composé à environ 60% d’énergie fossile ; en France, l’électricité est nettement moins carbonée (6% d’énergie fossile), grâce notamment à l’énergie nucléaire.

Un second problème est la cohabitation entre les usages : les data centers fragilisent les réseaux de transmission d’électricité du fait de leur très importante consommation, ce qui peut entraîner des perturbations affectant l’ensemble des usagers du réseau électrique. Dans certains cas, les opérateurs de data centers choisissent d’avoir recours sur place à [des générateurs fonctionnant au diesel ou au gaz](https://www.geo.fr/environnement/le-chiffre-de-geo-2000-tonnes-d-oxydes-d-azote-polluent-memphis-pour-le-superordinateur-d-elon-musk-226624), ce qui engendre des nuisances de voisinage et émet des gaz à effet de serre.

## Consommation en eau

De l’eau dans l’IA ? Mais oui ! Les ressources en eau interviennent à plusieurs reprises dans le cycle de vie de l’IA.

En effet, les nombreux serveurs hébergés dans les data centers finissent par chauffer lorsqu’ils sont sollicités, tout comme votre ordinateur lorsque vous lui demandez d’accomplir une tâche gourmande en puissance de calcul. Il est donc nécessaire de refroidir ces serveurs afin qu’ils puissent continuer à fonctionner dans de bonnes conditions : il existe plusieurs techniques de refroidissement, et une très répandue consiste à faire circuler de l’eau douce froide à l’intérieur des data centers afin d’absorber la chaleur. Une partie de cette eau s’évapore ensuite. Ce procédé consomme donc des quantités parfois importantes d’eau douce, ce qui peut notamment entraîner des conflits d’usage dans des régions où il y a peu d’eau ET des habitants qui en ont besoin pour vivre.

Plus en amont sur la chaîne de valeur, certains composants électroniques ont également besoin de beaucoup d’eau pour être fabriqués : c’est par exemple le cas des semi-conducteurs.

## Consommation de matières premières

Le numérique en général, et l’IA en particulier, nécessitent de nombreux métaux pour fonctionner. La plupart des ressources minières se situent en Asie, en Afrique, en Amérique du sud et en Australie. Or l’extraction de ces métaux se fait rarement dans de bonnes conditions environnementales et sociales, et la compétition pour ces ressources critiques - et qui s’épuisent - mène parfois à des conflits géopolitiques. Travail forcé, emploi d’enfants, financement de groupes armés, aucun moyen n’est écarté pour tirer profit de ces précieuses matières. Parfois appelés « minerais de sang », ils sont difficiles à tracer.

On peut citer par exemple

Ressource : Palladium
Pays producteurs : Russie (42%), Afrique du Sud (38%)
Utilisation : circuits imprimés

Ressource : Tantale
Pays producteurs : République Démocratique du Congo (35%), Rwanda (17%), Brésil (16%)
Utilisation : condensateurs (smartphones, disques durs)

Ressource : Cobalt
Pays producteurs : République Démocratique du Congo (68%)
Utilisation : batteries (véhicule électriques, appareils électroniques)

Ressource : Antimoine
Pays producteurs : Chine (54%), Russie (18%), Tadjikistan (15%)
Utilisation : circuits imprimés, semi-conducteurs, gaines de câbles

cf https://www.mineralinfo.fr/fr/actualite/actualite/cartes-de-geopolitique-des-ressources-minieres-production-reserves-mondiales


# Les enjeux humains et étiques de l'IA

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


# Réglementation et souveraineté numérique

## RIA

Face aux enjeux liés aux usages de l’IA, le [Règlement européen sur l’Intelligence Artificielle](https://eur-lex.europa.eu/legal-content/FR/TXT/?uri=CELEX:32024R1689) (RIA) - aussi appelé AI Act - qui entre en vigueur progressivement, constitue un cadre réglementaire permettant le développement et le déploiement d’IA respectueuses des valeurs européennes. Ce règlement classifie les modèles et les systèmes d’IA en utilisant une approche par les risques : une série de critères permet de déterminer le niveau de risque dont relève le modèle ou le système considéré, et ainsi de déterminer les obligations auxquelles les organisations doivent se conformer, étant donné leur rôle vis-à-vis du modèle ou système en question.

Le RIA distingue 4 niveaux de risque pour les systèmes d’IA automatisés :
- les systèmes présentant un risque minime ou inexistant pour leurs utilisateurs : un filtre anti-spam par exemple. Ces systèmes ne font l’objet d’aucune restriction au titre du RIA, dès lors qu’ils respectent les autres réglementations.
- les systèmes interagissant avec des personnes physiques mais ne présentant pas de risque élevé, et pour lesquels il importe principalement à l’utilisateur de savoir qu’il interagit avec une machine : un chatbot ou un générateur d’images par exemple. Les entités fournissant ou déployant ces systèmes doivent faire en sorte que les utilisateurs sachent clairement qu’ils interagissent avec une IA, ou que le contenu qu’ils consultent a été généré par une IA.
- les systèmes présentant un risque élevé, qui peuvent avoir un impact direct sur la sécurité ou les droits fondamentaux de personnes physiques : les systèmes de recrutement automatisé par IA ou de reconnaissance biométrique par exemple. Ces systèmes sont soumis à diverses obligations incluant par exemple la conservation de logs d’activité, la mise en place d’un contrôle humain, la mise en place d’un système de gestion de la qualité, etc.
- les systèmes présentant un risque inacceptable, c’est-à-dire portant atteinte aux droits fondamentaux ou contrevenant aux valeurs de l’Union Européenne : les systèmes de score social ou permettant la manipulation subliminale des opinions par exemple. Ces systèmes sont purement et simplement interdits.

Le RIA constitue une réglementation pionnière en matière d’encadrement des activités basées sur l’IA. On peut noter que les Etats-Unis et la Chine, principaux rivaux dans la course au développement de l’IA, prennent le parti de moins réguler l’IA, même si le cadre réglementaire progresse également dans ces deux pays. Le RIA établit également des sanctions à l’encontre des entreprises ne respectant pas ses obligations : une entreprise contrevenant par exemple à l’interdiction des systèmes d’IA présentant un risque inacceptable peut se voir infliger une amende allant jusqu’à 7% de son chiffre d’affaires.

##  IA et souveraineté numérique

Le paysage de l’IA souffre aujourd’hui d’une domination des acteurs étatsuniens et chinois : les géants de la tech tels que Google, Meta ou OpenAI ont imposé leurs modèles d’IA auprès du grand public et comptent de très nombreux utilisateurs ; la Chine mobilise de son côté de nombreuses ressources pour faire émerger ses propres géants nationaux, dont certains ont créé la surprise dans le monde occidental à l’image de DeepSeek. Les deux pays mènent une course effrénée à l’innovation en matière d’IA, mêlant enjeux technologiques, économiques et géopolitiques complexes.

A l’ère de l’IA générative, la prédominance de systèmes d’IA provenant des Etats-Unis ou de la Chine pose plusieurs problèmes. Un premier problème concerne nos données personnelles : nous confions effectivement parfois des données sensibles à des chatbots, pour leur demander de résumer des documents, de nous conseiller sur un cadeau à offrir voire de nous fournir un avis médical… Se pose alors la question des usages qui pourraient être faits de ces données par des tiers soumis à des réglementations extra-européennes qui n'en garantissent pas forcément la protection. Les Etats-Unis, typiquement, disposent d’une réglementation moins contraignante en matière de protection des données personnelles. Avec le règlement européen sur l'IA et le RGPD, les entreprises européennes doivent s'assurer que leurs technologies respectent les exigences en matière de transparence et de protection des données personnelles.

On peut également craindre l’émergence de monopoles qui peuvent s’établir pour l’utilisation de certains outils, et induire des rapports de force : il peut être risqué de dépendre exclusivement d’outils étrangers pour certaines tâches importantes. Dans ce cadre, disposer d’outils souverains, c’est-à-dire relevant de nos Etats et réglementations (France, Union Européenne), est un enjeu crucial. Enfin, l’enjeu des biais, dont nous avons parlé plus tôt dans ce module, joue également un rôle : un modèle entraîné sur une majorité de données en langue anglaise ou chinoise par exemple sera moins adapté, en matière de culture, de valeurs (idéologiques, politiques...) ou de vision du monde, à une utilisation en français.

Face à ces enjeux, des réponses européennes et françaises existent. Une première réponse est constituée par la réglementation, notamment le RIA, dont nous avons parlé dans la séquence précédente. Une deuxième réponse est bien entendu l’émergence d’acteurs souverains : par exemple, des entreprises françaises qui développent des modèles d’IA entraînés sur des données adaptées au contexte français ou européen et dans le respect des réglementations encadrant le traitement des données personnelles ou le droit d’auteur. Enfin, l’utilisation d’infrastructures souveraines - data centers français par exemple - permet de réduire notre dépendance aux acteurs étrangers et d’héberger modèles et données sur le sol européen. Il convient toutefois de garder à l’esprit que les enjeux de souveraineté en matière d’IA ne doivent pas méconnaitre les principes fondamentaux de la commande publique, notamment les principes de non-discrimination et de liberté d’accès à la commande publique.

# Bonnes pratiques individuelles et métier

##  Les bonnes pratiques métier et projet

Qu’on parle ou non d’IA, lorsqu’on identifie un besoin dans une organisation, la première question à se poser est souvent la suivante : a-t-on besoin du numérique pour y répondre ? Et si oui, l’IA est-elle réellement nécessaire ? Ou une “simple” digitalisation sans IA est-elle suffisante ?

Pour aborder cette première question, plusieurs éléments sont à prendre en compte :
- Quelle est la valeur ajoutée de l’IA dans le cas de figure étudié ? L’IA apporte-t-elle un surplus de performance significatif comparée à une simple digitalisation ?
- Le processus en jeu peut-il s’accommoder du caractère aléatoire des IA ? Dit autrement, le processus peut-il supporter une erreur de prédiction du modèle, car rappelez-vous, les IA ne sont jamais infaillibles ? Dans certains cas, un traitement manuel ou digital sans IA peut être plus rapide — et source de moins d’erreurs ou de frustration — qu’un traitement par l’IA.

En définitive, il s’agit de mettre en balance les bénéfices et les coûts de la mise en place d’un système embarquant de l’IA.

Si l’IA est de manière certaine la solution la plus adaptée, l’utilisation de modèles d’IA spécifiques et proportionnés à l'objectif visé entraîne des gains de temps et d’énergie considérables comparé à un LLM “bon à tout faire”. La chercheuse Sasha Luccioni a notamment mesuré qu’il existait parfois plusieurs ordres de grandeur entre la consommation d’énergie de différents modèles d’IA. Le graphique suivant donne la valeur des émissions d’équivalent CO2 (axe vertical, en échelle logarithmique) générées lorsqu’une tâche donnée est confiée à un modèle d’IA (les différentes tâches sont sur l’axe horizontal). On voit qu’une IA “simple” de classification de texte consommera en moyenne 10 fois moins d’énergie pour une requête qu’une IA de génération de texte adossée à un LLM.

Par exemple, il est tout à fait possible d’extraire des entités nommées (des noms de personnes, de lieux, d’entreprises…) dans un texte avec un LLM ; mais des outils de traitement du langage naturel bien plus frugaux comme spaCy (https://spacy.io/) ont une précision comparable. N’hésitez pas aborder ces enjeux de frugalité avec le data scientist qui vous accompagne sur votre projet d’IA !

Par ailleurs, on peut se poser des questions sur l’impact cognitif de l’IA : son utilisation représente-t-elle un risque de perte de compétence pour les collaborateurs, ou une perte d'expertise pour l'organisation ? Lorsqu’on itère sur un prompt pour aboutir à un résultat, on ne réalise pas la tâche soi-même : on perd potentiellement une partie du lien avec son activité professionnelle. Il est donc nécessaire de bien vérifier et relire le résultat pour se l’approprier, et il ne faut pas hésiter à faire soi-même des tâches que l’on pourrait confier à l’IA afin de monter en compétences ou de les préserver.

## Les bonnes pratiques individuelles

Nous avons compris qu’utiliser l’IA n’est pas sans impact sur l’environnement et sur les personnes. Par conséquent, une bonne posture consiste à en avoir une utilisation à bon escient et en pleine conscience des enjeux qu’elle pose.

Prenons l’exemple des recherches sur internet : l’utilisation d’un moteur de recherche “classique” représente un impact environnemental environ 10 fois moindre que l’utilisation d’un robot conversationnel. Dans ce contexte, une démarche individuelle simple pourrait être de commencer par faire une recherche sur son moteur de recherche habituel (Qwant, Google ou autre), puis de basculer sur Archi+ dans le cas d’une recherche complexe, tant par le volume de documents à consulter que par la précision de la question posée. Par exemple, il n’est pas pertinent d’utiliser l’IA pour avoir la météo du jour ou l’itinéraire pour se rendre à son prochain rendez-vous, sachant que cela consomme beaucoup de ressources et que la réponse a une probabilité assez élevée d’être fausse !

Prenons un second exemple : vous avez besoin d’une image pour illustrer une présentation PowerPoint. Vous pouvez en première intention utiliser des banques d’images gratuites comme Unsplash ; et, si vous ne trouvez pas votre bonheur, vous pouvez modifier une image approchante dans un logiciel de retouche, qui disposera de fonctions assistées par IA bien plus ciblées et efficaces qu’un générateur d’images comme Midjourney ou Dall-E. D’une manière générale, et comme pour les usages métier, prenez le temps de la réflexion pour identifier l’outil le plus adapté à votre besoin. Une astuce : quel outil auriez-vous utilisé avant l'avènement des IA génératives ?

Enfin, soyez vigilants face aux biais et aux fausses informations parfois fournies par les IA : utilisez-les comme une aide à la réflexion mais ne vous reposez jamais intégralement sur leurs réponses. D’une manière générale, soyez curieux et exercez votre esprit critique, pour l’IA comme pour le reste ! Vous ferez ainsi de l’IA une vraie ressource et une plus-value maîtrisée pour votre activité.
