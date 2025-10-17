---
layout: post
title: Comment fonctionne le courrier électronique ?
description: Mais au fait, savez-vous vraiment comment fonctionne le courrier électronique (e-mail) ? Dans cet article, plongez sous le capot !
author:
  name: iroco
categories:
- Sous le capot
- Grand public
tags:
- E-mail
- SMTP
- Imap
---
![e-mails connectés](/images/fonctionnement-email/iroco-fonctionnement-email.jpg)

*60 % de la population française utilise l’e-mail, ce qui représente près de 1.4 milliard d’envois par jour. Mais vous êtes-vous déjà demandé comment tout cela fonctionne lorsque vous appuyez sur "envoyer" ? Tour d’horizon.*

## L’e-mail, une histoire qui dure depuis 60 ans

L'histoire de l'e-mail commence en 1971 avec un ingénieur américain, Ray Tomlinson, qui développe le **système de messagerie** en réseau ARPANET (ancêtre de l’Internet d'aujourd’hui) pour le ministère de la Défense des États-Unis et adopte le symbole @ pour les adresses. Les machines utilisées sont multi-utilisateurs. Les machines sont identifiées par leur adresse IP sur le réseau, et le symbole @ permet alors de préciser l'utilisateur de la  machine à qui le message est destiné. Pour la petite anecdote, le **courrier électronique** ne s’appelait pas encore e-mail, mais Netmail pour Network Mail. 

Après le développement du DNS, le système de noms de domaine que nous utilisons couramment aujourd'hui, les adresses e-mail prennent le format loginname[at]host.domain.

7 ans plus tard, en mai 1978, Gary Thuerk envoie ce qui est considéré comme le premier **spam** de l'histoire à près de 600 personnes. Vous pouvez retrouver la reproduction de celui-ci sur [le blog de Brad Templetons](https://www.templetons.com/brad/spamreact.html), l’un des pionniers du web.  

Quelques autres dates clés de l'histoire de l’e-mail :

- 1982 : première utilisation connue du mot « e-mail » et création du **Simple Mail Transfer Protocol** (SMTP), protocole de communication utilisé pour transférer des messages électroniques vers des serveurs de messagerie électronique.

- 1988 : Steve Dorner invente Eudora, une application qui donne un visage populaire à l’e-mail avec une interface utilisateur.

- 1996 : Création de Hotmail, l’un des pionniers dans la messagerie “gratuite” en ligne. Le courrier électronique devance le courrier postal.

- 2004 : Lancement de Gmail.

- 2011 : 3,1 milliards d’adresses mail dans le monde sont recensées.

[Selon Statista](https://fr.statista.com/statistiques/583905/nombre-d-e-mails-par-jour-dans-le-monde--2019/), environ 319,6 milliards d’e-mails étaient envoyés et reçus chaque jour en 2021 et ce nombre devrait dépasser **376,4 milliards en 2025**.

## Une adresse mail, c'est fait comment ?

![aperçu d'un e-mail](/images/fonctionnement-email/Aperçu-email.png)

- La partie avant le “@“ correspond à l’alias, l’utilisateur, le groupe ou le service d’une entreprise. Dans notre exemple, “hello” est la boîte mail d'accueil d’Iroco (vous pouvez nous y envoyer des mots doux !).
- “@“ (arobase) est un séparateur dans l’adresse e-mail ; il est requis pour toutes les adresses e-mail SMTP.
- “iroco.fr” est le nom de domaine auquel appartient l’utilisateur ; il est utilisé pour acheminer l’e-mail vers le bon serveur de destination. Le “.fr” est le TLD ou *top-level domain* (domaine de premier niveau).

## L'e-mail, un outil ouvert et interopérable

Habitués que nous sommes des messageries instantanées qui nécessitent que nos interlocuteurs utilisent la même application que nous, nous en oublions parfois que l'e-mail a un atout essentiel : il est interopérable. Dit autrement, peu importe le système d'exploitation, le client mail ou le fournisseur d'accès de votre interlocuteur, il recevra votre mail dès lors qu'il dispose d'un accès à internet, d'une adresse mail et d'une messagerie. C'est notamment dû au fait que les protocoles et spécifications utilisés sont publics : par exemple [RFC-821](https://www.ietf.org/rfc/rfc821.html) pour le SMTP, [RFC-822](https://www.ietf.org/rfc/rfc822.html) pour le format de mail, mais il y en a [beaucoup d'autres](https://www.fastmail.help/hc/en-us/articles/1500000278382-Email-standards). Ils sont maintenus par l'[IETF](https://fr.wikipedia.org/wiki/Internet_Engineering_Task_Force).

Comme l'e-mail est un ensemble de protocoles ouverts, il existe beaucoup de serveurs de mail disponibles en open source et il est possible pour celui qui le souhaite d'héberger son propre serveur de mail. Mais attention : à la différence d'un serveur web, un serveur de mail est un peu plus compliqué à mettre en place et à maintenir. C'est la raison pour laquelle de nombreux services de messagerie ont vu le jour, certains "gratuits" (Gmail, Yahoo Mail, Microsoft Mail) et d'autres payants. 

## Quelle est la différence entre un client de messagerie et un webmail ?

**Le webmail** et le client de messagerie remplissent la même fonction : ils permettent aux utilisateurs d'envoyer et de recevoir des e-mails. Cependant, un **client de messagerie** exige l'installation d'une application spécifique au mail sur son ordinateur ou son mobile. Un webmail sera lui accessible directement sur un navigateur web comme Firefox ou Chrome.

Le **client de messagerie** est donc un logiciel qui doit être installé : vos e-mails sont téléchargés à partir du serveur de mail et stockés localement ou en ligne via le protocole IMAP ou **POP3**. Après les avoir téléchargés, vous pouvez lire et rédiger des réponses à vos mails hors-ligne sur l’appareil où vous avez installé votre programme de messagerie.

Tour d'horizon des principales différences entre webmail et client de messagerie :

| Webmail | Client de messagerie |
| -----   | -----------------    |
| Accessible depuis n’importe quel appareil avec un navigateur internet | Installation et configuration d'une application (Thunderbird, Outlook, Mail pour MacOS...) |
| Configuration souvent plus facile (utilisateur/mot de passe) | Plus efficace : protocole optimisé pour le transfert de texte |
| Pas de mises à jour à effectuer | Maintenance nécessaire de l'application de mail (souvent automatique) |
| Basé sur le protocole **[JMAP](https://jmap.io)** et **HTTP** |Basé sur les protocoles **IMAP**/**SMTP** |
| Utilisation en ligne (sauf fonctionnalité fournie par l'application) | Utilisation hors ligne possible |

## De quoi se compose un message électronique ?

Les e-mails se composent de deux sections principales  : l’en-tête et le corps.

### L'en-tête

**L’en-tête** peut être considéré comme l'équivalent électronique d'une enveloppe et se compose de champs, c'est-à-dire des lignes, contenant des informations sur l'expéditeur : le destinataire, le sujet, la date du message...

Il comprend également des entrées pour chaque serveur par lequel transite le courrier de l'expéditeur au destinataire, ce qui est très utile pour suivre son origine, en particulier si le message semble suspect (par exemple lors de **tentatives de phishing**).

### Le corps

**Le corps** constitue le contenu du message et peut inclure plusieurs parties et pièces jointes dans de nombreux formats différents. Au début, les e-mails se composaient uniquement de texte brut au **format ASCII**, mais à mesure que l'utilisation du courrier électronique a évolué, il est devenu nécessaire de prendre en charge à la fois le **HTML** et d'autres types de contenu.

Aujourd'hui, les e-mails sont généralement encodés à l'aide de la **norme MIME** (Multipurpose Internet Mail Extensions) qui permet aux e-mails de prendre en charge du texte dans divers  caractères, des fichiers joints, du contenu multimédia, etc.

Les destinataires doivent être prudents lorsqu'ils ouvrent des messages HTML ou des pièces jointes, car ces messages peuvent contenir des informations et des petits **logiciels malveillants** que l'utilisateur ne peut pas voir.

## Envoyer et recevoir un message électronique : ce qui se passe en vrai

Si vous vivez au 21e siècle, vous envoyez et recevez très probablement des e-mails chaque jour. Mais savez-vous ce qui se passe réellement sous le capot de votre messagerie ? L'**envoi d'un courrier électronique** semble si simple : vous définissez l'adresse e-mail de la personne à qui vous souhaitez envoyer un e-mail, rédigez votre message et cliquez sur 'Envoyer’.

![fonctionnement simple e-mail](/images/fonctionnement-email/fonctionnement-simple-email.png)

C'est vrai dans une certaine mesure, mais c’est aussi un peu plus complexe que cela ! Si plonger dans les entrailles du réseau ne vous fait pas peur, restez avec nous, on vous emmène...

On commence par quelques définitions :

* **MUA** (Mail User Agent) : client de messagerie comme [Thunderbird](https://www.thunderbird.net/fr/), [Gmail](https://gmail.com) ou [Outlook](https://outlook.live.com/owa/)
* **MTA** (Mail Transfer Agent) : logiciel qui reçoit les mails d’un MUA sur un serveur de transmission comme [postfix](http://www.postfix.org/), [exchange edge](https://learn.microsoft.com/fr-fr/exchange/architecture/edge-transport-servers/edge-transport-servers?source=recommendations&view=exchserver-2019) ou [exim](https://www.exim.org/).
* **MDA** (Mail Delivery Agent) : logiciel qui stocke les messages sur la boîte de réception des destinataires [cyrus](https://www.cyrusimap.org/), [dovecot](https://www.dovecot.org/) ou [exchange](https://www.microsoft.com/fr-fr/microsoft-365/exchange/email).

On vous a fait un petit dessin pour expliquer ce qui se passe quand Gabriel, qui a une adresse mail chez Iroco, envoie un message à Emma, qui a une adresse mail chez Gmail :

![fonctionnement complexe e-mail.png](/images/fonctionnement-email/fonctionnement-complexe-email.jpg)

1. Gabriel ouvre son application de messagerie (MUA) Thunderbird pour inviter Emma à sa pendaison de crémaillère, samedi soir.
Il rédige son mail et appuie sur le bouton envoyer.
Le MUA contacte le MTA chez Iroco qui met en file d'attente le mail de Gabriel.
Le MTA d'Iroco contacte le MTA d'Emma (Gmail).
2. En découle une conversation riche entre les 2 MTA :

![Intéractions SMTP](/images/fonctionnement-email/Interactions-SMTP.jpg)

3. Quand le MTA de Gmail a fermé la connexion, il envoie le message au MDA de Emma qui la notifie par le biais de son MUA.
Emma voit une notification sur son mobile : “Nouveau message de Gabriel”.
Elle clique dessus et son MUA cherche le contenu du mail sur le MDA et l’affiche sur son écran.
Après avoir lu le mail de Gabriel, Emma décide d'accepter son invitation.

On espère que ces explications vous aideront à y voir un peu plus clair sur le fonctionnement des e-mails !

Sources : [Namecheap](https://www.namecheap.com/guru-guides/how-does-email-work/) | [Université de Rennes](https://urfist.univ-rennes2.fr/messagerie_electronique_fonctionnement)
