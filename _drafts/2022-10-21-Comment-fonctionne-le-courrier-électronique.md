---
layout: post
title: Comment fonctionne le courrier électronique ?
description: Savez-vous exactement comment fonctionne le courrier électronique (e-mail) ? Dans cet article, découvrez chaque étape, SMTP, Imap, Pop3.
author:
  display_name: Iroco
categories:
- Décryptage
- Grand public
tags:
- E-mail
- SMTP
- Imap
---
*60 % de la population française utilise l’e-mail avec près d’1.4 milliards d’envois par jour. Mais vous êtes-vous déjà demandé comment cela fonctionne-t-il lorsque vous appuyez sur "envoyer" ? Tour d’horizon.*

## L’e-mail, une histoire qui durs depuis 60 ans

Tout commence en 1971 avec un ingénieur américain, Ray Tomlinson, qui a développé le **système de messagerie** en réseau ARPANET (ancêtre de l’Internet d'aujourd’hui) pour le ministère de la Défense des États-Unis et adopte le symbole @ pour les adresses.

Les systèmes utlisés sont multi-utilisateurs. Les machines sont identifiées par leur adresse IP sur le réseau. Le symbole @ permet alors de préciser l'utilisateur sur une machine à qui le message est destiné (le nom ou l'adresse IP joue le rôle de serveur virtuel).

Après le développement du DNS (système de noms de domaine), les adresses e-mail étaient au format loginname@host.domain.

Pour la petite histoire, le **courrier électronique** ne s’appelait pas encore e-mail mais Netmail pour Network Mail. 7 ans plus tard, en mai 1978, Gary Thuerk a envoyé  ce qui est considéré comme étant le premier **spam** de l'histoire à près de 600 personnes. Vous pouvez retrouver la reproduction de celui-ci sur [le blog de Brad Templetons](https://www.templetons.com/brad/spamreact.html), l’un des pionniers du web.  

Quelques dates clés sur l’histoire de l’e-mail :

- 1982 : 1ère utilisation connue du mot « e-mail » et création du **Simple Mail Transfer Protocol** (SMTP), protocole de communication utilisé pour transférer des messages électroniques vers des serveurs de messagerie électronique.

- 1988 : Steve Dorner invente Eudora, une application qui donne un visage populaire à l’e-mail (interface utilisateur).

- 1993 : L’e-mail devient standard

- 1996 : Création de Hotmail, l’un des pionniers dans la messagerie “gratuite” en ligne. Le courrier électronique dépasse le courrier postal.

- 2004 : Lancement de Gmail

- 2011 : 3,1 milliards d’adresses mails dans le monde sont recensées.

[Selon Statista](https://fr.statista.com/statistiques/583905/nombre-d-e-mails-par-jour-dans-le-monde--2019/), environ 319,6 milliards d’e-mails étaient envoyés et reçus chaque jour en 2021 et devraient dépasser **376,4 milliards en 2025**.

Aperçu d'une adresse e-mail :
![aperçu d'un e-mail](/images/fonctionnement-email/Aperçu-email.png)


- La partie avant le “@“ contient l’alias, l’utilisateur, le groupe ou le service d’une entreprise. Dans notre exemple “hello” est la boite mail d'accueil d’Iroco.
- “@“ (arobase) est un séparateur dans l’adresse e-mail, il est requis pour toutes les adresses e-mail SMTP.
- “iroco.fr” est le nom de domaine auquel appartient l’utilisateur, il est utilisé pour acheminer l’e-mail vers le bon serveur de destination. Le “.fr” est le TLD (domaine de premier niveau).

## Quels sont les avantages du courrier électronique ?
Dans la société moderne, l’e-mail a été adopté très tôt comme un moyen efficace de **communication asynchrone**. Les gens l'utilisent de plus en plus pour établir et maintenir des liens sociaux, aussi bien sur le plan personnel que professionnel.

Voici les **principaux avantages** de l’utilisation du courrier électronique :

- **Gratuit** : Hors frais de service des fournisseurs d'accès à internet.

- **Mondial** : Les e-mails peuvent être envoyés dans presque tous les pays depuis n'importe où dans le monde.

-  **Interopérable** : un e-mail peut être instantanément envoyé et reçu par le destinataire en temps réel via Internet tout en étant compatible avec différents systèmes d'information. Les protocoles et spécifications utilisés sont publiques (par ex. [RFC-821](https://www.ietf.org/rfc/rfc821.html) pour le SMTP, [RFC-822](https://www.ietf.org/rfc/rfc822.html) pour le format de mail, mais il y en a [beaucoup d'autres](https://www.fastmail.help/hc/en-us/articles/1500000278382-Email-standards)), et maintenus par l'[IETF](https://fr.wikipedia.org/wiki/Internet_Engineering_Task_Force).

- **Les pièces jointes** : un e-mail peut contenir une ou plusieurs pièces jointes, permettant à une personne d'envoyer  des documents, des images ou d'autres fichiers.

- **Stockage** : les e-mails sont stockés électroniquement, ce qui permet un stockage et un archivage à long terme.

- **Respectueux de l'environnement** : l'envoi d'e-mails ne nécessite très peu de ressources. Toutefois, même s’il est plus écologique que l’envoie postal, il n’en reste pas moins énergivore (empreinte carbone numérique).

## Le fournisseur de mail

Comme les autres standards d'Internet, le mail étant un ensemble de protocoles ouverts, il existe beaucoup de serveurs gratuits, il est possible pour chacun d'héberger son propre serveur de mail. Mais à la différence d'un serveur web, le fonctionnement du mail reste difficile à mettre en oeuvre.

C'est la raison pour laquelle de nombreux services de messagerie ont vu le jour. Certains sont gratuits (gmail, yahoo mail, Microsoft mail) et d'autres sont payants. D'autre part, le Webmail  est un service gratuit, hébergé dans le **cloud** qui synchronise automatiquement votre e-mail sur tous vos appareils (ordinateur, smartphone, tablette).

## Quelle est la différence entre un client de messagerie et un webmail ?

**Le webmail** et le client de messagerie remplissent la même fonction : ils permettent aux utilisateurs d'envoyer et de recevoir des e-mails. Cependant, un **client de messagerie** exige l'installation d'une application spécifique au mail sur leur ordinateur ou leur mobile. Un webmail sera accessible sur n’importe quel navigateur web comme Firefox ou Chrome.

Le **client de messagerie** est un logiciel qui doit être installé, vos e-mails sont téléchargés à partir du serveur de mail et stockés localement ou en ligne via le protocole IMAP ou **POP3**. Après les avoir téléchargé, vous pouvez lire et rédiger des réponses à vos mails hors-ligne sur l’appareil où vous avez installé votre programme de messagerie.

| Webmail | Client de messagerie |
| -----   | -----------------    |
| **Accessible** depuis n’importe quel appareil avec un navigateur internet | Installation et configuration d'une application (outlook, Thundebird, Mail pour MacOS) |
| Configuration plus ergonomique (utilisateur/mot de passe) | **Plus efficace** : protocole optimisé pour le transfert de texte |
| **Aucune mise à jour**  à effectuer | Maintenance de l'app de mail |
| Basé sur le protocole **[JMAP](https://jmap.io)** et **HTTP** |Basé sur les protocoles **IMAP**/**SMTP** |
| Utilisation en ligne (sauf fonctionnalité fournie par l'app) | Utilisation hors ligne possible |

## Comment envoyer et recevoir un message électronique ?

Si vous vivez au 21ème siècle, il est très probable vous envoyez et recevez des e-mails chaque jour. La plupart des internautes ne savent pas comment cela fonctionne.

L'**envoi d'un courrier électronique** semble si simple : vous définissez l'adresse e-mail de la personne à qui vous souhaitez envoyer un e-mail, rédigez votre message et cliquez sur 'Envoyer’.

![fonctionnement simple e-mail](/images/fonctionnement-email/fonctionnement-simple-email.png)

C'est vrai dans une certaine mesure, mais c’est beaucoup plus complexe que cela. Pour la plupart des utilisateurs, il est inutile de comprendre son fonctionnement pour l’utiliser, cependant, si vous êtes intéressé par la façon dont ces messages entrent et sortent de votre boîte de réception, restez avec nous.

Quelques définitions au préalable :

* **MUA** (Mail User Agent) : client de messagerie comme [Thundebird](https://www.thunderbird.net/fr/), [Gmail](https://gmail.com) ou [Outlook](https://outlook.live.com/owa/)
* **MTA** (Mail Transfer Agent) : logiciel qui reçoit les mails d’un MUA sur un serveur de transmission comme [postfix](http://www.postfix.org/), [exchange edge](https://learn.microsoft.com/fr-fr/exchange/architecture/edge-transport-servers/edge-transport-servers?source=recommendations&view=exchserver-2019) ou [exim](https://www.exim.org/)
* **MDA** (Mail Delivery Agent) : logiciel qui stocke les messages sur la boîte de réception des destinataires [cyrus](https://www.cyrusimap.org/), [dovecot](https://www.dovecot.org/) ou [exchange](https://www.microsoft.com/fr-fr/microsoft-365/exchange/email)

À savoir : pour empêcher tout le monde de consulter les courriers électroniques des autres utilisateurs, l'accès au MDA est protégé par un identifiant et un mot de passe.

## Comment fonctionne le courrier électronique ?

![fonctionnement complexe e-mail.png](/images/fonctionnement-email/fonctionnement-complexe-email.jpg)

1. Gabriel ouvre son app de messagerie (MUA) Thundebird pour inviter Emma à sa pendaison de crémaillère, samedi soir.
2. Il rédige son mail et appuie sur le bouton envoyer
3. Le MUA contact le MTA chez Iroco qui met en file d'attente le mail de Gabriel.
4. Le MTA d'Iroco contacte le MTA d'Emma (Google)
5. En découle une conversation entre les 2 MTA

![Intéractions SMTP](/images/fonctionnement-email/Interactions-SMTP.jpg)

6. Quand le MTA de chez Google a fermé la connexion, il envoie le message au MDA de Emma qu’il notifie par le biais de son MUA
7. Emma voit une notification sur son mobile “nouveau message de Gabriel”
8. Elle clique sur ses messages et son MUA cherche le contenu du mail sur le MDA et l’affiche sur son écran.
9. Après avoir lu le mail de Gabriel, Emma décide d'accepter son invitation.

## Comment se compose un message électronique ?
Les e-mails se composent de deux sections principales  : l’en-tête et le corps.

### L'en-tête

**L’en-tête** peut être considéré comme l'équivalent électronique d'une enveloppe et se compose de champs (lignes) contenant des informations sur l'expéditeur : le destinataire le sujet, la date, etc. du message.

Il comprend également des entrées pour chaque serveur qui gère le courrier de l'expéditeur au destinataire, ce qui est très utile pour suivre son origine, en particulier si le message semble suspect (par exemple lors de **tentatives de phishing**).

### Le corps

**Le corps** constitue le contenu du message et peut inclure plusieurs parties et pièces jointes dans de nombreux formats différents.Au début, les e-mails se composaient uniquement de texte brut au **format ASCII**, mais à mesure que l'utilisation du courrier électronique a évolué, il est devenu nécessaire de prendre en charge à la fois le **HTML** et d'autres types de contenu.

Aujourd'hui, les e-mails sont généralement encodés à l'aide de la **norme MIME** (Multipurpose Internet Mail Extensions) qui permet aux e-mails de prendre en charge du texte dans divers  caractères, des fichiers joints, du contenu multimédia, etc.

Les destinataires doivent être prudents lorsqu'ils ouvrent des messages HTML ou des pièces jointes, car ces messages peuvent contenir des informations et des petits **logiciels malveillants** que l'utilisateur ne peut pas voir.

Pour afficher l'intégralité de la source d'un message électronique, vous pouvez cliquer sur l'icône "Afficher la source" en haut à droite dans le mode d'affichage du message.

Sources : [Namecheap](https://www.namecheap.com/guru-guides/how-does-email-work/) | [Université de Rennes](https://urfist.univ-rennes2.fr/messagerie_electronique_fonctionnement)
