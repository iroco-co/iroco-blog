---
layout: post
title: Mise à jour de cyrus en version 3.6
author:
  display_name: Bruno Thomas
categories:
- Sous le capot
- Avancé
tags:
- cyrus
---

Récemment nous sommes passés de la version 3.4.2 de notre serveur IMAP cyrus en version 3.6.0 puis 3.6.1.

C'est une migration majeure qui avait l'avantage d'apporter le décodage des Json Web Tokens directement par cyrus pour la partie HTTP.

Nous avons suivi scrupuleusement la procédure de migration [décrite par la doc de cyus](https://www.cyrusimap.org/imap/download/upgrade.html?highlight=migration). Cette migration s'est déroulée sans problème directement sur le serveur.
