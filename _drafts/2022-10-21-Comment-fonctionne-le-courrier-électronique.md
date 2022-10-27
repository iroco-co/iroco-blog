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

- 2012 : l’e-mail devient le mode de communication principal sur smartphone grâce à l’arrivée du Responsive Design ***### A préciser ? ###***

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
| **Aucune mise à jour**  à effectuer | maintenance de l'app de mail |
| Basé sur le protocole **[JMAP](https://jmap.io)** et **HTTP** | Basé sur les protocoles **IMAP**/**SMTP** |
| Utilisation en ligne (sauf fonctionnalité fournie par l'app) | utilisation hors ligne possible |

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

![fonctionnement complexe e-mail.png](/images/fonctionnement-email/fonctionnement-complexe-email.png)

### 1 - Envoi du mail et vérifications

Pour envoyer et recevoir des messages électroniques, vous pouvez utiliser un “**client de messagerie**" (MUA). Un serveur stocke et délivre vos messages, qui sont dans la plupart des cas hébergés par un ISP (Internet service provider), ou en français un fournisseur de services internet (FAI) comme Orange, SFR, Bouygues Telecom par exemple.

Lors de l'envoi d'un e-mail, le message  est acheminé d'un serveur à l'autre via le **SMTP** (Simple Mail Transfer Protocol) jusqu'à ce qu'il passe  au serveur SMTP sortant, transférant l’**e-mail au format MIME** (norme industrielle de messagerie électronique).

**Cloud réseau** : un e-mail peut rencontrer un nuage de réseau au sein d'une grande entreprise, d’un FAI, ou Internet. Le cloud réseau peut englober une multitude de serveurs de messagerie, de serveurs DNS, de routeurs, etc. Ces appareils peuvent être **protégés par des pare-feu, des filtres anti-spam,etc**.

File d’attente des e-mails : si un e-mail est adressé à quelqu’un d’une autre entreprise, il entre dans une file d’attente d’e-mails, s’il y a un volume élevé de courrier dans la file d'attente (soit parce qu'il y a beaucoup de messages, soit parce que les messages sont anormalement volumineux, soit les deux), le message sera retardé dans la file d’attente jusqu’à ce que le **MTA** traite les messages qui le précèdent.

### 2 — Transfert du mail
Lors du transfert d'un e-mail, le **MTA expéditeur** gère tous les aspects de la distribution du courrier jusqu'à ce que le message soit accepté ou rejeté par le **MTA destinataire**.

Au fur et à mesure que l'e-mail efface la file d'attente, il entre dans le **cloud du réseau Internet**  et est acheminé le long de la chaîne de serveurs d'hôte à hôte. La plupart des e-mails empruntent un chemin qui dépend de la disponibilité du serveur (un message peut emprunter des chemins différents).

Afin de trouver l’**adresse IP** et la boîte aux lettres du destinataire, le MTA doit parcourir le DNS (système de noms de domaine), une sorte d’annuaire d’Internet, qui se compose d'un ensemble de serveurs répartis sur Internet.

Une fois parcouru, il traduit l’adresse e-mail du destinataire par exemple hello@iroco.fr en une adresse IP comme “50.669.36.80”. Une fois que l'IP associée a été trouvée, il vérifie s'il existe un serveur d'échange de courrier (MX) pour le domaine qui détaille où le message doit aller.

L'**enregistrement MX** est un enregistrement de ressource qui spécifie le serveur de messagerie d'un nom de domaine. Une fois localisé, le serveur SMTP enverra le message à ce serveur.

Pare-feu, filtres anti-spam et anti-virus : un e-mail peut être transféré vers plusieurs MTA au sein d'un réseau cloud et est susceptible d'être transmis à au moins un pare-feu avant d'atteindre sa destination.Un e-mail rencontrant un pare-feu peut être testé par des **filtres anti-spam et anti-virus** avant d'être autorisé à passer à l'intérieur du pare-feu. Ces filtres testent pour voir si le message est qualifié de spam ou de **logiciel malveillant** .

Si le message contient des logiciels malveillants, le fichier est généralement mis en quarantaine et l'expéditeur en est averti. Si le message est identifié comme **spam**, il sera probablement supprimé sans en avertir l'expéditeur.Le spam est difficile à détecter car il peut prendre de nombreuses formes différentes.

Les **filtres anti-spam** sont donc testés sur un large éventail de critères et ont tendance à classer à tort un nombre important de messages comme spam, en particulier les messages provenant de newsletter.

### 3 — Réception & lecture du mail

Une fois que le **MTA du destinataire** accepte la livraison, le MTA appelle le MDA local pour le stocker (au bon emplacement) afin que l'utilisateur puisse le récupérer (via **POP3, IMAP4** ou autre).

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
