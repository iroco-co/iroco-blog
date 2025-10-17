---
layout: post
title: Migration de dovecot vers cyrus
description: Essais, erreurs et leçons apprises de la migration de notre serveur 
author:
  name: bruno
categories:
- Sous le capot
- Avancé
tags:
- mail
- backend
comments: true
---

Après avoir fait tourner un serveur de mail IMAP dovecot et SMTP postfix, nous voulions ajouter des serveurs de calendrier et de contacts pour Iroco. Suite à l'[étude comparative des langages de programmation](https://blog.iroco.co/backend-benchmark/), nous cherchons alors des serveurs qui soient si possible écrits en C/C++/Rust. [Cette page de wikipedia](https://en.wikipedia.org/wiki/Comparison_of_CalDAV_and_CardDAV_implementations) donne un bon aperçu des différentes possibilités... et en même temps côté serveur on voit qu'il y a des serveurs en Java, en Objective-C, mais aucun en Rust et un seul en C : [Cyrus](https://www.cyrusimap.org/).

Le problème est qu'il faut reprendre une bonne partie de l'installation du serveur mail et migrer également les mails existants. Par ailleurs, nous connaissons [baikal](https://sabre.io/baikal/) mais le PHP est selon l'étude 30 fois moins efficace que du C (CPU/bound mais c'est quand même [à prendre en compte](https://blog.iroco.co/tir-laptop/)).

Cyrus a pas mal d'avantages :
1. il permet d'avoir des services CalDAV/CardDAV (calendrier/carnet d'adresse) efficaces
2. il intègre les différents services, ce qui permet par exemple de pouvoir filtrer les mails en fonction du carnet d'adresse
3. il apporte une interface [JMAP](https://jmap.io) dont nous pourrons nous servir pour le webmail
4. il est maintenu par [FastMail](https://www.fastmail.com/) qui est aussi le créateur de la spec jmap
5. il a été lancé en 1994 par l'université de Carnegie-Mellon : il est donc éprouvé

Ces avantages nous font finalement opter pour Cyrus. Nous commençons par faire tourner le serveur pour faire des tests. Notre plan est d'allouer le port 994 IMAPS pour faire des connexions depuis l'extérieur, et de passer par notre proxy nginx pour la partie HTTPS :
* compiler le serveur pour avoir toutes les options (notamment JMAP)
* le lancer avec les différents services (IMAP/IMAPS/CalDAV/CardDAV/JMAP)
* utiliser l'authentification [SASL/PAM/Postgresql de Cyrus](http://www.cyrusimap.org/sasl/) à la place de celle de Dovecot si possible avec les mêmes hash SHA512 des mots de passe
* faire fonctionner OpenSSL avec le [Server Name Indication](https://fr.wikipedia.org/wiki/Server_Name_Indication) pour pouvoir gérer nos différents noms de domaines
* configurer les virtual hosts nginx
* migrer les mails
* passer Dovecot sur 994 et Cyrus sur le port IMAPS 993
* basculer Postfix/LMTP sur cyrus

Le tout avec ansible pour pouvoir refaire l'installation _from scratch_ sur un nouveau serveur.
Et si tout se passe bien, le service devrait fonctionner à nouveau normalement.

# Compiler le serveur

La documentation de cyrus [précise](https://www.cyrusimap.org/imap/download/installation/http/jmap.html) qu'il faut compiler le serveur pour activer le support JMAP.

Nous activons les options suivantes :

```
$ ./configure --enable-calalarmd --enable-autocreate --enable-nntp --enable-http --enable-jmap --with-pgsql --with-openssl=yes --enable-idled --with-pgsql-incdir=/usr/include/postgresql --enable-xapian --with-sphinx-build=n
```

* calalarmd pour pouvoir bénéficier des alertes calendrier
* autocreate pour pouvoir créer automatiquemnent les mailbox quand un nouvel utilisateur se connecte
* nntp pour le protocol [Network News](https://en.wikipedia.org/wiki/Network_News_Transfer_Protocol)
* http pour CalDAV/CardDAV
* pgsql pour la connexion avec Postgresql
* avec l'instruction [IDLE](https://datatracker.ietf.org/doc/html/rfc2177) IMAP
* avec Xapian qui est un moteur de recherche
* sans sphinx build (sinon ça ne compilait pas)

De la même manière, nous avons essayé de compiler Cyrus-SASL... mais après avoir lutté pendant une demi-journée, nous nous sommes rendus compte qu'il était possible de l'installer via apt avec le support postgresql sans compilation. C'est l'option que nous avons prise.

Le serveur est compilé et le service `saslauthd` installé via apt : il reste [la configuration](https://www.cyrusimap.org/quickstart.html#quick-install).

# Configurer le serveur

La configuration serveur dépend des choix de déploiement. Nous n'allons pas passer en revue toute la configuration mais juste les sujets sur lesquels nous avons buté, et ce qui nous a aidé.

Premier obstacle, l'authentification.

![sasl/PAM/pgsql]({{ site.url }}/images/cyrus/saslauthd.png)

Nous configurons saslauthd avec PAM et nous utilisons le module [pam-pgsql](https://github.com/pam-pgsql/pam-pgsql) pour se connecter à la base de données. Nous nous concentrons sur saslauthd. Pour tester on utilise :

```
$ sudo testsaslauthd -f /var/run/saslauthd/mux -u user@mail.com -p password -s imap
```

Nous avons travaillé sur cette partie avec également des logs de la base de données en mode debug (avec les requêtes SQL). Comme les SHA512 de dovecot commmencent par `${SHA512-CRYPT}$6$...` nous avons recompilé `pam-pgsql` pour ajouter le préfix afin d'être compatible avec dovecot.

Une fois `testsaslauthd` en fonctionnement, nous n'avons toujours pas d'authentification avec IMAP. Il nous manque l'option `-r` dans la configuration de saslauthd (`/etc/default/saslauthd`) qui indique que les noms d'utilisateurs comprennent la partie nom de domaine.

Deuxième obstacle, cyrus ne fait pas de [SNI](https://fr.wikipedia.org/wiki/Server_Name_Indication), donc on ne peut pas configurer plusieurs noms de domaines en TLS. Notre première idée était d'utiliser un proxy [nginx en mode email](https://docs.nginx.com/nginx/admin-guide/mail-proxy/mail-proxy/) qui fasse la partie SSL/TLS. Mais après avoir recherché, pas possible non plus [de faire du SNI en mode mail avec nginx](https://forum.nginx.org/read.php?2,237967,250127#msg-250127).

Autre piste : utiliser alors [HAproxy](https://www.haproxy.com) en [mode SSL/TLS termination](https://www.haproxy.com/blog/haproxy-ssl-termination/) pour l'IMAP. Etant donné qu'il sait faire des protocoles binaires, il doit pouvoir faire de l'IMAP, non ? Victoire ! Ca fonctionne. On peut effectivement donner un wildcard au proxy :

```
frontend ft_imaps
    bind *:993 ssl crt /etc/letsencrypt/pems/
    mode tcp
    default_backend bk_imap
```

et HAproxy va aller chercher les certificats correspondants au nom de domaine envoyé par le `Client Hello`.

A présent notre serveur IMAP tourne, en mode TLS, avec tous nos domaines sur le port 994. Nous avons alors utilisé [imapsync](https://imapsync.lamiral.info/) pour migrer les mails.

# Postface

Après migration des comptes, nous basculons Cyrus sur le port 993 et laissons dovecot sur 994 (_au cas où_) et nous basculons postfix sur cyrus en lmtp.

L'envoi de mail est cassé. Après avoir cherché, nous comprenons que postfix tourne avec un `chroot` pour des raisons de sécurité et qu'il faut donc désactiver ce mode pour le processus lmtp sinon Cyrus et postfix ne peuvent pas discuter :

dans `master.cf` (diff sur le changement)
```
-lmtp      unix  -       -       -       -       -       lmtp
+lmtp      unix  -       -       n       -       -       lmtp
```

Cette fois les utilisateurs passent bien par cyrus. Quelques jours plus tard, nous décidons alors d'éteindre dovecot.

![BOOM!!]({{ site.url }}/images/cyrus/fire.png)

L'envoi de mail ne fonctionne plus à nouveau. En effet, postfix envoie bien les mails entrants à cyrus, mais nous nous rendons compte que l'authentification de postfix utilise _toujours_ le SASL de dovecot. Quand on éteint dovecot, postfix ne sait plus authentifier l'envoi de mail.

Première chose, changer l'authentification dans `master.cf` (en diff)

```
-  -o smtpd_sasl_type=dovecot
-  -o smtpd_sasl_path=private/auth
+  -o smtpd_sasl_type=cyrus
+  -o smtpd_sasl_path=smtpd
```

Mais ça ne fonctionne toujours pas ! Après avoir pas mal fouillé dans les docs de postfix nous comprenons qu'il va lire par défaut la socket unix `/var/run/saslauthd` donc :
1. il faut qu'il ait les droits de le faire
2. il faut qu'il ait accès à cette socket

Pour la même raison de l'environnement sous chroot, postfix ne peut pas accéder à la socket. Comme postfix ne pourra pas lire une socket extérieure au chroot, il faut inverser le mécanisme : dire à saslauthd (toujours dans `/etc/default/saslauthd`) de créer sa socket dans `/var/spool/postfix/var/run/saslauthd` (`/var/run/saslauthd` à l'intérieur de la chroot), et créer un lien symbolique pour les autres services :

```
$ ll /var/run/saslauthd
lrwxrwxrwx 1 root root 36 Jan  6 12:54 /var/run/saslauthd -> /var/spool/postfix/var/run/saslauthd
```

Après avoir aussi ajouté les droits pour cette socket dans notre playbook ansible, le service est rétabli, sans dovecot cette fois-ci.

# Ce qui ne fonctionne toujours pas

[Sieve](http://sieve.info/) ne fait pas de SNI, et le problème c'est qu'il utilise STARTTLS. Ce qui veut dire que la connnexion est établie en clair par le client vers le serveur et quand la connexion TCP est établie, le client envoie un STARTTLS. Le serveur va chercher le certificat et la connexion passe en chiffré. Dans ce cas c'est Cyrus qui gère, et il ne peut avoir qu'un seul certificat.

Si vous avez une solution ou des suggestions, nous serions heureux d'en discuter.

# Ce que nous avons appris

1. que postfix tourne dans une chroot. C'est important de conserver ça dans un coin de son cerveau pour mieux comprendre ce qui se passe.
2. que dovecot fournit un serveur d'authentification SASL qui est utilisé par postfix dans une install classique dovecot/postfix (dans la plupart des docs).
3. que dans postfix ce service d'authentification était avant par défaut celui de cyrus-sasl.

Et plus généralement nous avons beaucoup appris sur les différents composants d'une chaîne de mail (Mail Transfert Agent, Mail Delivery Agent, SASL, PAM,...).
