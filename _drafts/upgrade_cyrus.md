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

C'est une migration majeure qui avait l'avantage d'apporter le décodage des Json Web Tokens directement par cyrus pour la partie HTTP. Le soucis avec cette fonctionnalité c'est qu'elle n'acceptait que 2 champs dans la *payload* du token : la date à laquelle le token a été émis (ce qui permet de rejeter des tokens au delà d'un certain temps configurable dans cyrus), et le sujet (qui contient le mail de l'utilisateur). Or nous avions aussi le rôle de l’utilisateur dans ce token.

Nous avons alors pris notre plus belle plume pour rédiger une *Pull Request* à l'équipe de cyrus, c'est à dire proposer une modification du code :

[![pull request](images/migration_cyrus/pull_request.png)](https://github.com/cyrusimap/cyrus-imapd/pull/4515)

Cette *PR* [a été intégrée au code de cyrus](https://github.com/cyrusimap/cyrus-imapd/pull/4526) quelques jours plus tard. Pas peu fiers d'avoir participé à ce commun qui date de 1994. <3 le logiciel libre.

Nous avons suivi scrupuleusement la procédure de migration [décrite par la doc de cyus](https://www.cyrusimap.org/imap/download/upgrade.html?highlight=migration). Cette migration s'est déroulée sans problème directement sur le serveur.

Il y a quelques jours, une nouvelle version 3.8.0 a été publiée. Nous allons la mettre cette montée de version également pour bénéficier des dernières fonctionnalités et corrections de bugs. Deux versions stables en 3 mois, qui a dit que le mail n'évoluait pas ?
