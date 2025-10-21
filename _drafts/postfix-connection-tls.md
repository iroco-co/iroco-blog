---
layout: post
title: Postfix et STARTTLS
authors:
  - bruno
categories:
- Avancé
tags:
- E-mail
- postfix
---

_Il y a une semaine nous avons reçu une demande de support d'un utilisateur qui s'était abonné à un service en ligne ne parvenant pas à nous envoyer un mail. Nous nous sommes entretenus avec le service pour résoudre le problème. Cela nous a amené à activer le chiffrement à l'envoi/réception de message avec [STARTTLS](https://www.postfix.org/TLS_README.html)._

![Cadenas sur un clavier](/images/postfix-tls/flyd-unsplash.jpg)

> NOTE: By turning on TLS support in Postfix, you not only get the ability to encrypt mail and to authenticate remote SMTP clients or servers. You also turn on hundreds of thousands of lines of OpenSSL library code. Assuming that OpenSSL is written as carefully as Wietse's own code, every 1000 lines introduces one additional bug into Postfix. 

Voici la deuxième ligne du [HOWTO du serveur de mail postfix](https://www.postfix.org/TLS_README.html) pour le chiffrement TLS. Sachant que les emails sont stockés chez la plupart des opérateurs (dont Iroco, mais c'est aussi le cas pour google et beaucoup d'autres à part proton mail), nous avions suivi les conseils de cette note. 

Pour expliquer de quoi il s'agit, voici un petit schéma :

![Schéma d'un envoi de message mail](/images/postfix-tls/envoi-mail.drawio2.png)