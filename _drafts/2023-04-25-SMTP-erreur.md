---
layout: post
title: Les secrets pour vaincre les codes d'erreur SMTP
description: Apprenez à résoudre les codes d'erreur SMTP courants en comprenant les raisons pour lesquelles ils se produisent.
authors:
  - iroco
categories:
- Décryptage
- Grand public
tags:
- Numérique
- E-mail
- SMTP
---
![Illustration de l'article](/images/SMTP/SMTP.png)

*Vous êtes-vous déjà demandé pourquoi certains de vos e-mails n'atteignent pas leurs destinataires ? Les codes d'erreur SMTP sont un problème qui peut entraver l'envoi de vos courriels. Que vous soyez novice ou expérimenté, ce guide vous aidera à envoyer des e-mails avec succès et sans tracas.*

Lorsque vous acheminez un e-mail, le processus semble limpide : vous rédigez votre texte, cliquez sur "envoyer", et votre message est transmis à son destinataire.

Pour en savoir davantage sur le fonctionnement de l'e-mail et comprendre les étapes qui se cachent derrière ce processus apparemment simple, nous vous invitons à lire notre article détaillé sur le sujet "[Comment fonctionne le courrier électronique ?](https://blog.iroco.co/comment-fonctionne-le-courrier-électronique/)".

Cependant, parfois, les choses ne se passent pas comme prévu et vous recevez un message d'erreur de la part de votre serveur SMTP. Ces erreurs sont sous forme de codes numériques, tels que 550, 554, ou 450, et peuvent sembler énigmatiques pour les utilisateurs. Dans cet article, nous découvrirons ces codes d'erreur SMTP et comment les résoudre.

## Qu'est-ce qu'un serveur SMTP ?

SMTP qui signifie "**Simple Mail Transfer Protocol**", est un protocole standard employé pour l'envoi d'e-mails sur Internet. Les serveurs SMTP sont des ordinateurs qui traitent et transfèrent les e-mails d'un utilisateur à un autre. **Les erreurs SMTP sont des nombres à trois chiffres** générés par ces serveurs SMTP lorsqu'ils ne peuvent pas traiter un e-mail pour diverses raisons.
 
Les codes d'erreur SMTP sont divisés en **5 catégories** pour indiquer l'état du processus de transmission de l'e-mail :

### 1xx – Messages d'information

La communication entre les serveurs de messagerie est active. Les erreurs dans cette plage ne sont généralement pas critiques et peuvent être traitées en attendant que le processus se termine ou que le serveur de messagerie réponde.

| Code d'erreur | Signification | Comment le résoudre |
| --------------- |--------------- |--------------- |
| 111 | L'e-mail a été transféré au serveur de messagerie du destinataire, mais le statut est toujours en attente | Il est possible que le serveur de messagerie du destinataire soit temporairement inaccessible, l'expéditeur doit essayer de renvoyer le message ultérieurement |
| 120 |  Le message a été transmis avec succès, mais le serveur n'a pas obtenu de réponse du serveur de messagerie du destinataire et l'adresse e-mail du destinataire n'est pas valide ou n'existe pas | L'expéditeur doit vérifier que l'adresse est correcte et renvoyer le message |
| 130 | L'e-mail a été transmis avec succès, mais le serveur n'a pas reçu de confirmation du serveur de messagerie du destinataire | Cela peut être dû à une mauvaise configuration ou à la politique de sécurité du destinataire. L'expéditeur doit contacter le destinataire pour résoudre le problème |

### 2xx – Messages de réussite
Ces codes indiquent que la commande a été acceptée avec succès.

| Code d'erreur | Signification | Comment le résoudre |
| --------------- |--------------- |--------------- |
| 211 |  Message d’état du système ou réponse d’aide | Les utilisateurs peuvent ignorer ce code d'état |
| 214 |  Réponse à la commande HELP | Ce code d'état fournit des informations sur le serveur et pointe généralement vers une page FAQ |
| 220 | Le serveur est prêt | Le serveur est prêt à recevoir des messages |
| 221 | Le serveur ferme son canal de transmission | Tous les messages ont été livrés |
| 250 | Commande exécutée  | Le serveur a transmis le message avec succès |

### 3xx – Erreurs temporaires

| Code d'erreur | Signification | Comment le résoudre |
| --------------- |--------------- |--------------- |
| 354 |  Le serveur attend les données du message | Le serveur a reçu les détails « De » et « A » de l’email, et est prêt à livrer le corps du message |

### 4xx – Erreurs permanentes
Ces erreurs sont permanentes et le processus de transfert d'e-mails ne se poursuivra pas tant que le problème ne sera pas élucidé.

| Code d'erreur | Signification | Comment le résoudre |
| --------------- |--------------- |--------------- |
| 421 |  Problèmes de connexion | Réessayez plus tard ou contactez l'administrateur système |
| 422 |  La boîte du destinataire a dépassé sa limite de stockage | Contactez l'utilisateur via un autre canal pour l'alerter et demander de créer de l'espace de libre |
| 442 | Connexion perdue pendant le transfert | Vérifiez votre routeur |
| 450 |  Boîte mail de l'utilisateur indisponible | Le serveur réessayera d'envoyer le message après un certain temps, vérifiez l'adresse e-mail |
| 451 |  Erreur de traitement | Contactez votre fournisseur SMTP pour vérifier la situation ou réessayez plus tard |
| 452 |  Trop de courriels envoyés -  limite de stockage du serveur dépassée | La prochaine tentative va probablement réussir |
| 471 |  Erreur de votre serveur de messagerie - généralement due à un problème de filtre anti-spam local | Contactez votre fournisseur de service SMTP pour corriger cette situation |

### 5xx – Erreurs fatales

| Code d'erreur | Signification | Comment le résoudre |
| --------------- |--------------- |--------------- |
| 500 |  Erreur de syntaxe | Vérifier les instructions pour résoudre le problème |
| 501 |  Syntaxe de l'adresse e-mail invalide | Vérifiez l'adresse e-mail et réessayez |
| 502 |  Commande non exécutée | Utilisez une autre commande |
| 503 |  Commande non autorisée | Utilisez une commande différente ou contactez l'administrateur système |
| 504 |  Délai d'attente expiré | Réessayez plus tard |
| 510/511 |  Adresse incorrecte sur la ligne A, CC ou CCI est erronée |Vérifier les adresses de vos destinataires et rectifier les éventuelles erreurs |
| 512 |  Erreur DNS |Vérifier les adresses de vos destinataires et corriger les éventuelles erreurs |
| 541 | L'adresse du destinataire a rejeté votre message, généralement causé par un filtre anti-spam |Demandez au destinataire de vous mettre en whitelist |
| 550 |  L'adresse e-mail du destinataire n'existe pas ou a été désactivée | Vérifiez l'adresse e-mail et réessayez |
| 551 |  L'utilisateur est invalide ou n'existe pas | Vérifiez l'adresse e-mail et réessayez |
| 552 |  La boîte de réception est pleine | Videz-la |
| 554 |  Échec de transmission, le message a été considéré comme du spam ou contient un virus | Vérifiez les paramètres de votre serveur de messagerie ou contactez l'administrateur système |

## Comment résoudre les erreurs SMTP ?

Maintenant que nous avons vu certains des codes d'erreur SMTP les plus courants, comment pouvons-nous les solutionner ? Voici quelques suggestions :

* **Vérifiez l'adresse e-mail du destinataire** : assurez-vous que l'adresse e-mail du destinataire est correcte et que vous n'avez pas fait de fautes de frappe. Il est également possible que le destinataire ait désactivé sa boîte de réception ou que le filtre anti-spam ait rejeté votre message ;

* **Vérifiez si votre adresse IP est sur liste noire** : les serveurs SMTP utilisent des listes noires publiques pour bloquer les adresses IP connues pour envoyer du spam ou des virus. Si votre adresse IP figure sur l'une de ces listes, vous devrez contacter votre fournisseur de service Internet ou votre fournisseur de services de liste blanche pour résoudre le problème ;

* **Vérifiez le contenu de votre message** : si le serveur SMTP détecte un contenu suspect dans votre message, il peut le rejeter. Assurez-vous que votre message ne comporte pas de virus ou de spam et ne viole pas les politiques de sécurité du serveur ;

* **Vérifiez la configuration de votre serveur SMTP** : si vous utilisez votre propre serveur, assurez-vous qu'il est correctement configuré. Vous pouvez vérifier les paramètres de votre serveur SMTP auprès de votre fournisseur de service Internet ou de votre administrateur système ;

* Si vous recevez une **erreur temporaire**, essayez simplement de **renvoyer le message plus tard**. Après la restauration du serveur SMTP, le problème peut être résolu.

Les **codes d'erreur SMTP peuvent sembler intimidants, mais ils ne sont pas insurmontables**. En comprenant les causes potentielles de ces erreurs et en prenant des mesures pour les résoudre, vous pouvez envoyer des e-mails avec succès. Si vous continuez à rencontrer des erreurs SMTP malgré tous vos efforts, veuillez contacter votre fournisseur de services Internet ou votre administrateur système pour obtenir de l'aide.

Source : [Serversmtp.com](https://serversmtp.com/fr/erreur-smtp/)
