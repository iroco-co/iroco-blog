---
layout: post
title: Les inscriptions sont à nouveau ouvertes !
description: Après des mésaventures avec un groupe de spammeurs nous avons du renforcer les contôles d'inscription pour notre service.
authors:
  - bruno
categories:
- Sous le capot
tags:
- sécurité, spam
---
_Nous venons de rouvrir les inscriptions sur Iroco après avoir été victime d'attaques d'un groupe de spammeurs. Nous avons du renforcer les contrôles lors de l'inscription et ajouter un paiement initial. Nous en avons aussi profité pour nous adapter au nouveau fonctionnement de l'interface de paiement de notre partenaire GoCardless. Voici le résumé de nos aventures en 3 épisodes._

# Premier épisode (03/03/2024)

Il y a à peu près un mois, nous avons subi une attaque d'un groupe de spam, probablement localisé en Russie (de nombreuses sources géographiques différentes convergent vers des domaines et IP Russes). Ils ont utilisé notre plateforme pour envoyer des messages d'hameçonnage (phishing). Ces messages ont été repérés par les autres plateformes de messagerie qui à leur tour nous ont signalé comme serveur de spam.

Nous avions déjà constaté des tentatives permanentes, à bas bruit, de détournement ou utilisation frauduleuse de notre serveur d'envoi de mail. Par exemple des tentatives de connexion sur des comptes existants toutes les 5 ou 10 minutes. Ces tentatives ne sont pas repérées car elles sont difficilement discernables d'échecs de connexion (ex: mauvais mot de passe) d'un utilisateur légitime. Néanmoins, en regardant de plus près les adresses internet (IP), ce sont la plupart du temps des adresses qui sont référencées dans des bases de spammeurs ([abuseIPDB](https://www.abuseipdb.com/), [Spamhaus](https://www.spamhaus.org/)...).

Le mode opératoire est le suivant :

* Création automatique ou semi-automatique de comptes mails de test (notre service permet aux utilisateurs de tester gratuitement pendant un mois), le plus souvent pendant la nuit ;
* Utilisation de ces comptes pour explorer la configuration de SMTP/postfix ;
* Le cas échéant, exploitation d'une faille de configuration, ou simple mise en œuvre d'envois en masse avec ces utilisateurs.

Pour avons alors pris des contre-mesures pour palier à ce problème :

* Renforcement de la configuration du serveur d'envoi SMTP/postfix ;
* Ajout d'un [reCAPTCHA](https://fr.wikipedia.org/wiki/ReCAPTCHA) à l'inscription pour dissuader les robots ;
* Abonnement à un service de référencement d'adresses frauduleuses pour mettre à jour de manière dynamique nos pare-feux avec des listes noires ;
* Utilisation de ce service pour ne pas accepter des inscription issues d'IP [TOR](https://www.torproject.org/) ou d'IP référencées au moins une fois dans ces bases de données ;
* Fermeture du service d'inscription pendant la nuit (pour pouvoir dormir).

Ces bases de référencements d'adresses frauduleuses sont une mutualisation de nombreux acteurs du monde entier, qui exposent des services en ligne et qui notifient de manière automatique (avec [fail2ban](http://www.fail2ban.org/) par ex) ou manuelle ces attaques. C'est très utile pour anticiper la protection des serveurs.

En prenant un peu de recul avec l'écoute d'un des derniers épisodes de Techologie sur les [Incompatibilités des transitions numérique et écologique](https://techologie.net/episodes/86-transitions-numerique-et-ecologique-incompatibles/), des questions se posent :

* Quel surplus d'énergie est nécessaire pour se protéger de la malveillance. Plus globalement, que représente la quantité d'énergie de la malveillance dans le numérique ?
* Qu'arrive-t-il aux adresses IP une fois que les spammeurs les abandonnent ?
* Pourquoi devons-nous payer un service de protection privé ?
* Comment en est-on arrivé là ? Que font les États ?

Commençons avec le coût de notre contre mesures :

* téléchargement toutes les 3 heures d'un fichier de près de 60K adresses IP. Ajout à [iptables](https://netfilter.org/projects/iptables/index.html). Ce qui fait que le filtrage de chaque requête IP légitimes est considérablement alourdi pour le kernel (même si c'est très efficace) ;
* remontée de tous les bannissements au service de référencement (une requête HTTP par bannissement) ;
* envoi d'une requête HTTP pour chaque inscription pour vérifier l'état de l'adresse d'inscription ;
* calcul d'une preuve de travail (Proof of Work) pour la soumission du formulaire d'inscription (ce qui revient à faire tourner une machine pour rien);
* complexification de la base de code pour ajouter ces fonctionnalités ;

Notons que ces "surplus" concernent le _runtime_ des machines, et donc sont des problèmes d'optimisation avec les limites qu'on connaît quand on compare avec la production et le recyclages de ces machines. Quand même : si on pense à l'ensemble des machines mobilisées (et produites) pour faire tourner ces robots qui tentent en permanence de se connecter sur différents serveurs pour récupérer des adresses mail (ou autres failles PHP, Web...), la puissance utilisée pour se défendre de ces attaques, on doit atteindre un montant non négligeable d'énergie brûlée pour un résultat malveillant. Enfin, il y a aussi le volume de spam qui est estimé à la moitié du volume global.

> Qu'arrive-t-il aux adresses IP une fois que les spammeurs les abandonnent ?

Probablement rien. Elles sont recyclées pour d'autres utilisateurs, qui risquent se faire bloquer de temps en temps sans comprendre pourquoi, car leur adresse sera toujours présente dans des listes noires. Étant donné que ces registres sont privés, que peuvent-ils faire de ces informations ? Ce qui nous amène à la question suivante :

> Pourquoi devons-nous payer un service de protection privé ?

Ces services de mutualisation des attaques sont utiles. Alors pourquoi n'existe-t-il pas en Europe un service public qui protège les citoyens de ces attaques, et surtout qui leur donne une suite  (en utilisant les bases d'IP) ? La France, L'Europe ont-elles les pouvoirs technique, politique et diplomatique pour agir contre les acteurs de ces nuisances ?

> Comment en est-on arrivé là ?

Internet ferait penser à l'utilisation sans code de la route de l'automobile. Imaginez un trafic automobile n'ayant aucune signalisation, des conducteurs cachés derrière des vitres teintées qui font ce qu'ils veulent, provoquent des accidents, écrasent des piétons. Des entreprises privées publient des listes payantes de plaques d'immatriculation "à risque" basées sur des signalisations de citoyens. Nous avons chacun nos apps qui nous préviennent quand un véhicule potentiellement dangereux approche. Vous pouvez racheter un véhicule ayant fait un carnage sans le savoir, sans changer de plaque.

Pourquoi les législateurs n'investissent pas plus cet espace virtuel ? En quoi l'esprit libertaire du début d'Internet a-t-il pu avoir un rôle ? Comment les politiques publiques pourraient s'adapter suffisamment rapidement aux évolutions des services numériques ? Comment articuler le caractère global d'Internet et les limites géographiques des États ?

# Deuxième épisode (06/07/2024)

Nos modifications n'empêchent pas les inscriptions au service car ils utilisent de multiples prestataires fournisseurs de machines virtuelles dans plusieurs pays. Du coup les adresses ne sont pas encore connues des registres d'IP malveillantes. Ils profitent de la période d'essai gratuite pour créer plusieurs adresses mails qu'ils peuvent utiliser plus tard pour des campagnes de spam ou phishing.

Or dans l'observation des inscriptions, cette période d'essai ne sert pas à des futures utilisateurs pour tester le service : le mail est un service standard, nos utilisateurs prennent directement l'abonnement. Nous décidons de supprimer cette fonctionnalité, qui sert essentiellement des mauvais usages du service.

Nous remettons alors l'abonnement mensuel et redéployons une nouvelle version de l'app. Pendant un mois et demi nous n'avons plus de problèmes.

Et puis, début juillet nous voyons 3 comptes créés avec des adresses suspectes. Les comptes bancaires associés sont en Finlande. Les IP d'un opérateur marocain ressemblent aussi à celles que nous avons déjà observées lors d'attaques précédentes. Bingo. Quelque temps plus tard, 10 adresses sont créées avec des noms générés aléatoirement, avec de faux comptes bancaires. Nous avons alors des pénalités de notre prestataire de paiement.

Le premier compte était un compte bancaire qui semble réel. Ils ont probablement réalisé que le paiement intervenant en fin de mois, ils pouvaient annuler le mandat en cours de mois. Et puis ils ont testé l'inscription avec un faux compte bancaire et constaté que ça marchait également.

Pour éviter de passer trop de temps à surveiller le service, nous fermons les inscriptions.

Que faire maintenant ?

# Troisième épisode

Nous discutons avec GoCardless (notre prestataire de paiement), pour voir comment bloquer ces inscriptions. Ils nous proposent une offre légèrement plus onéreuse mais qui ajoute des vérifications bancaires et techniques pour éviter les comptes frauduleux.

Nous décidons également de faire un paiement immédiat lors de l'inscription pour tester la validité du compte bancaire. Nous étudions le fonctionnement de l'interface GoCardless pour effectuer ce paiement, et nous nous rendons compte que les modalités d’interaction ont changé. GoCardless propose un mode asynchrone en envoyant les événements bancaires en temps réel chez nous sur une URL de service.

Nous changeons complètement l'app Iroco pour le paiement en passant du mode synchrone (quand l'utilisateur revient chez nous après le tunnel de paiement, nous avions les statuts des opérations) à un mode asynchrone : lors du retour nous ne savons pas si les opérations se sont bien déroulées. Nous devons attendre les événements du paiement initial, et de l'abonnement pour déterminer si le compte utilisateur est valide ou pas. Nous implémentons une machine à état pour éviter de faire des erreurs de gestion de compte. Cela nous permettra également de désactiver un compte si l'abonnement est interrompu ou si un autre incident bancaire intervient.

Cela nous aura occupé pendant l'été, et nous avons pu enfin ouvrir à nouveau les inscriptions avec une nouvelle version de l'application \o/.
