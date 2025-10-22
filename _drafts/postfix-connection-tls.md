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

Pour comprendre de quoi il s'agit, voici un petit schéma d'un envoi de mail :

![Schéma d'un envoi de message mail](/images/postfix-tls/envoi-mail.drawio2.png)

Alice envoie un mail à Bob, sa connexion jusqu'à son serveur SMTP est chiffrée (SMTPS) dès son établissement. Le serveur d'Infomaniak reçoit le mail et va le transférer au serveur Iroco. A ce titre il a le rôle de client (smtp) et Iroco joue le rôle de serveur (smtpd). Si Bob répond à Alice, les rôles seront inversés. 

Le serveur SMTP de Alice discute alors avec le serveur Iroco de Bob (pour une communication sans chiffrement vous pouvez vous reporter à [notre article sur le fonctionnement du mail](/comment-fonctionne-le-courrier-%C3%A9lectronique/)). 

![Schéma d'une communication SMTP](/images/postfix-tls/StartTLS.png)

Après le EHLO du serveur d'Alice, si Iroco est configuré avec TLS, il va proposer de passer en mode chiffré (`STARTTLS`). Si le serveur d'Alice supporte cette fonctionnalité, il va renvoyer `StartTLS`. Ensuite les deux serveurs établissent une connexion chiffrée en s'échangeant les certificats, et l'envoi des données du mail est fait en chiffré.

Si Iroco refuse `startTLS` le serveur Infomaniak peut avoir deux comportements : 

1. il envoie le mail en clair
2. il refuse d'envoyer le mail

Par exemple pour postfix, entre autres valeurs, le `smtpd_tls_security_level` peut prendre `may` (cas 1) ou  `encrypt` (cas 2). Donc le chiffrement concerne _uniquement_ le transport du message. Le type de menace que cela couvre c'est l'écoute sur la ligne internet (par exemple par un état autoritaire).

Pour l'échange des certificats, il faut configurer dans le serveur mail SMTP un chemin vers le fichier du certificat et de la clé secrète (`smtpd_tls_cert_file` et `smtpd_tls_key_file`). La difficulté pour Iroco, c'est que nous n'avons pas qu'un seul nom de domaine mais plusieurs par serveur. Dans ce cas, postfix peut gérer une table de correspondance (_map_ nom de domaine ➡️ chemin vers le fichier clé/certificat)  avec l'option `tls_server_sni_maps` (attention cette _map_ n'accepte pas de valeur de type base de données). 

Comme cela n'affectait pas que la partie sécurité mais aussi la délivrabilité des messages, nous avons activé la transmission TLS pour l'envoi et la réception de mail.

