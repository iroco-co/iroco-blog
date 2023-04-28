---
layout: post
title: Tout ce que vous devez savoir sur les en-têtes d'e-mails
description: Découvrez tout ce qu'il faut savoir sur les en-têtes d'e-mails, leur utilité, leur structure, comment les lire et les analyser.
author:
  display_name: Iroco
categories:
- Décryptage
- Grand public
tags:
- Numérique
- E-mail
- Communication
---

![Illustration de l'article](/images/en-têtes-email/en-têtes-email.png)

*Les en-têtes d'e-mails peuvent sembler énigmatiques, mais contiennent en réalité de précieuses informations pour les utilisateurs. Savoir les lire et les comprendre peut aider à  identifier les spams et à mieux comprendre le processus de communication par courriel. Dans cet article, nous explorerons tout ce que vous devez savoir sur les en-têtes d'e-mails, de leur structure à leur analyse.*

## Qu'est-ce qu'un en-tête d'e-mail ?
Les e-mails sont constitués de trois éléments principaux : 

1. **L'en-tête** : contient des informations clés pour assurer la livrabilité du message. Elle comprend des métadonnées telles que l'adresse IP de l'expéditeur, l'adresse IP du serveur de messagerie et le protocole de transfert employé pour acheminer le message. 

2. **Le corps de l'e-mail** : contient le contenu et les pièces jointes du message. Il peut s'agir de texte, d'images, de liens ou de tout autre type de contenu que l'expéditeur souhaite inclure. 

3. **L'enveloppe** : invisible pour l'expéditeur et le destinataire, l'enveloppe est utilisée par le fournisseur de messagerie et le serveur sortant pour acheminer le message vers le compte e-mail prévu.

Certaines caractéristiques de l'en-tête de l'e-mail, telles que l'objet, l'expéditeur et le destinataire, sont disponibles directement depuis le haut de l'e-mail. Cependant, d**'autres renseignements** comme les adresses IP et les protocoles de transfert peuvent **nécessiter un accès indépendant à l'en-tête** personnalisé.

### Définition et rôle des en-têtes d'e-mails

Les en-têtes d'e-mail offrent la possibilité de **retracer le parcours d'un message électronique** en indiquant les différents serveurs, FAI et services de messagerie qu'il a traversés. Cette fonctionnalité permet aux utilisateurs de vérifier facilement la protection de la transmission de l'e-mail et de s'assurer que le message est parvenu à sa destination sans altérations ni erreurs. 

Les en-têtes d'e-mails jouent également un rôle important dans la détection des spams et des [tentatives de phishing](https://blog.iroco.co/phishing/), car ils aident à déterminer la source d'un e-mail. 

En résumé, les en-têtes d'e-mail constituent une source précieuse d'information pour les utilisateurs qui souhaitent **améliorer leur expérience de messagerie et renforcer leur sécurité en ligne.**

## Aspects d'un en-tête d'e-mails

Lorsque vous ouvrez un e-mail, vous ne voyez généralement que le contenu principal, mais en réalité, il y a beaucoup plus d'informations stockées dans l'en-tête de l'e-mail. Dans cette partie de l'article, nous examinerons de plus près chaque élément de l'en-tête de l'e-mail et de son importance.

Voici un exemple concret dans Thundebird :

1. Sélectionnez l’e-mail qui comporte l’en-tête de message que vous souhaitez afficher ;


![Illustration de l'article](/images/en-têtes-email/en-têtes-1.png)


2. Cliquez sur "Autres" puis "Afficher la source" ;  

 
 ![Illustration de l'article](/images/en-têtes-email/en-têtes-2.png)
 

3. Une nouvelle fenêtre s’ouvre affichant l’en-tête le plus long dans son format HTML d'origine. Vous pourrez voir les détails de l’en-tête tels que les statuts d’authentification, les adresses IP, la version MIME et la signature DKIM.

 
![Illustration de l'article](/images/en-têtes-email/en-têtes-3.png)


    De : nom de l'expéditeur <adresse e-mail de l'expéditeur>
    À : nom du destinataire <adresse e-mail du destinataire>
    Objet : sujet de l'e-mail
    Date : date et heure d'envoi de l'e-mail
    Message-ID : identifiant unique de l'e-mail
    MIME-Version : version de MIME utilisée pour l'e-mail
    Content-Type : type de contenu de l'e-mail (texte, HTML, image, etc.)
    X-Spam-Status : indication de la détection de spam
    X-Mailer : logiciel de messagerie utilisé pour l'envoi de l'e-mail
    
En comprenant les informations contenues dans les en-têtes d'e-mails, vous pouvez mieux saisir l'e-mail que vous avez reçu et savoir comment il a été acheminé jusqu'à vous.

## Comment lire et interpréter un en-tête d'e-mail ?

Il existe plusieurs **outils en ligne gratuits** que vous pouvez utiliser pour déchiffrer les en-têtes des e-mails. Parmi les plus populaires, on trouve [MX Toolbox](https://mxtoolbox.com/), [Email Header Analyzer](https://mxtoolbox.com/EmailHeaders.aspx), et [WhatIsMyIPAddress](https://whatismyipaddress.com/). Ces outils vous permettent d'entrer l'en-tête d'un e-mail et d'obtenir une analyse détaillée.

## Pourquoi les en-têtes d'e-mails sont importants ?

Les en-têtes d'e-mails sont une partie essentielle de toute communication par [courrier électronique](https://blog.iroco.co/comment-fonctionne-le-courrier-électronique/). En fait, ce dernier fournit des informations de base comme le destinataire, le sujet, la date et l'heure de l'envoi. Ces données peuvent être exploitées pour **vérifier l'authenticité d'un e-mail, détecter les fraudes et les tentatives de phishing, et identifier les sources de spam et de virus.** Les filtres anti-spam et anti-virus utilisent souvent les indications endiguées dans les en-têtes d'e-mails pour trier et classer les messages en fonction de leur dangerosité.

Par exemple, **certains filtres anti-spam peuvent prouver la correspondance entre l'adresse IP de l'expéditeur et le domaine de l'adresse de l'expéditeur**, pour déterminer si le message est susceptible d'être un spam. De même, certains filtres anti-virus peuvent vérifier les en-têtes d'e-mails pour détecter les messages contenant des virus ou des logiciels malveillants.

Les en-têtes d'e-mails sont particulièrement importants dans un environnement professionnel, où la communication rapide et efficace est primordiale. Ils permettent aux destinataires de trier et de catégoriser les messages en fonction de leur pertinence et de leur urgence. De plus, ils permettent de garantir que les messages parviennent aux bonnes personnes au bon moment.

Par conséquent, il est essentiel de veiller à ce que les **en-têtes des e-mails** soient clairs, précis et cohérents. Cela peut inclure l'utilisation de conventions de dénomination pour les sujets de courriel, comme l'emploi d'un préfixe pour indiquer l'urgence ou le type de message.

Enfin, il est important de se rappeler que les en-têtes d'e-mails peuvent également fournir des informations importantes sur la sécurité et la **confidentialité des messages**. Les en-têtes peuvent contenir des informations sur le chiffrement du message, ou sur la façon dont le message a été signé numériquement pour garantir son authenticité. Il est donc **recommandé de ne jamais inclure des données sensibles** (mot de passe, ...).

## Comment utiliser les en-têtes d'e-mails pour résoudre des problèmes ?

Les **en-têtes d'e-mails** peuvent être utilisés pour résoudre de nombreux problèmes de livraison ou de réception d'e-mails. En effet, les en-têtes fournissent des informations détaillées sur le trajet parcouru par un message électronique, ce qui peut aider à identifier les causes de difficultés comme des retards, des rejets ou des erreurs de transmission.

Par exemple, si un utilisateur ne parvient pas à recevoir un e-mail, il peut vérifier les en-têtes du message pour identifier où l’incident s'est produit. Si le message a été refusé par le serveur de messagerie du destinataire, c'est peut-être dû à un  problème de filtrage anti-spam ou de sécurité.

De même, si un utilisateur a envoyé un e-mail qui n'a pas été accepté, les en-têtes peuvent aider à définir où le message a été bloqué ou égaré dans le processus d'envoi.

Si un utilisateur reçoit un **message suspect**, il peut vérifier les en-têtes pour déterminer si le message provient d'un domaine ou d'une adresse IP louche, ou si le message a été transmis via un serveur de messagerie douteux. Ces informations peuvent aider à **identifier les messages frauduleux** et à prendre les mesures nécessaires pour les signaler ou les bloquer.
