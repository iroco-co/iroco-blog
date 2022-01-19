---
layout: post
title: Migration de dovecot vers cyrus
author:
  display_name: Bruno Thomas
tags:
- mail
- backend
comments: true
---

Après avoir fait tourner un serveur de mail IMAP dovecot et SMTP postfix, nous voulions ajouter des serveurs de calendrier et de contacts pour iroco. Suite à l'[étude comparative des langages de programmation](https://blog.iroco.co/backend-benchmark/), nous cherchons alors des serveurs qui soient si possible écrits en C/C++/Rust. [Cette page de wikipedia](https://en.wikipedia.org/wiki/Comparison_of_CalDAV_and_CardDAV_implementations) donne un bon aperçu des différentes possibilités... et en même temps côté serveur on voit qu'il y a des serveurs en Java, en Objective-C, mais aucun en Rust et un en C : [cyrus](https://www.cyrusimap.org/).

Le soucis c'est qu'il faut tout reprendre pour le serveur IMAP et migrer aussi les mails existants. Par ailleurs, nous connaissons [baikal](https://sabre.io/baikal/) mais le PHP est selon l'étude 30 fois moins efficace que du C (CPU/bound mais c'est quand même [à prendre en compte](https://blog.iroco.co/tir-laptop/)).

Cyrus a pas mal d'avantages :
1. il permet d'avoir des services CalDAV/CardDAV (calendrier/carnet d'adresse) efficaces
2. il intègre les différents services, ce qui permet par exemple de pouvoir filtrer les mails en fonction du carnet d'adresse
3. il apporte une interface [JMAP](https://jmap.io) dont on pourra se servir pour le webmail
4. il est maintenu par [FastMail](https://www.fastmail.com/) qui est aussi le créateur de la spec jmap

C'est parti, nous commençons par essayer de faire tourner le serveur et faire des tests. Le plan c'est d'allouer le port 994 IMAPS pour faire des connexions depuis l'extérieur, et de passer par notre proxy nginx pour la partie HTTPS. Il faut donc :
* compiler le serveur pour avoir toutes les options (notamment JMAP)
* le lancer avec les différents services (IMAP/IMAPS/CalDAV/CardDAV/JMAP)
* utiliser l'authentification SASL/PAM/Postgresql de Cyrus à la place de celle de Dovecot si possible avec les mêmes hash SHA512 des mots de passe
* faire fonctionner OpenSSL avec le [Server Name Indication](https://fr.wikipedia.org/wiki/Server_Name_Indication) pour pouvoir gérer nos différents noms de domaines
* migrer les mails
* passer Dovecot sur 994 et Cyrus sur le port IMAPS 993
* basculer Postfix/LMTP sur cyrus

Et si tout se passe bien, le service devrait fonctionner à nouveau normalement.
