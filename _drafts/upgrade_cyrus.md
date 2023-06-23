---
layout: post
title: Mise à jour de cyrus en version 3.6 - Une migration majeure pour notre serveur IMAP
description: Un petit tour sous le capot pour découvrir la dernière mise à jour de Cyrus en version 3.6 
author:
  display_name: Bruno Thomas
categories:
- Sous le capot
- Avancé
tags:
- cyrus
---

*La technologie évolue sans cesse, et il est indispensable de maintenir notre infrastructure de messagerie à jour pour répondre aux besoins croissants de nos utilisateurs. Depuis peu, nous avons franchi une étape majeure en effectuant une migration de notre serveur IMAP Cyrus, passant de la version 3.4.2 en version 3.6.0 puis 3.6.1. Cette mise à jour a apporté de nouvelles fonctionnalités et améliorations essentielles, mais elle a également présenté des défis intéressants à surmonter.*

## Les avantages de la mise à jour vers Cyrus 3.6

La décision de mettre à jour notre serveur IMAP Cyrus vers la version 3.6 a été motivée par plusieurs raisons convaincantes. 

Tout d'abord, cette version introduit une fonctionnalité de décodage des Json Web Tokens directement par Cyrus pour la partie HTTP. Cette amélioration majeure offre une sécurité accrue et simplifie la gestion des autorisations d'accès. Les Json Web Tokens sont maintenant décodés automatiquement par Cyrus, ce qui facilite grandement l'interaction avec les applications tierces.

## Le défi du décodage des Json Web Tokens

Cependant, malgré les avantages indéniables du décodage des Json Web Tokens, cette fonctionnalité initiale était limitée à deux champs dans la *payload* du token : la date à laquelle le token a été émis (ce qui permet de rejeter des jetons au-delà d'un certain temps configurable dans cyrus), et le sujet (qui contient le mail de l'utilisateur). Cette restriction posait problème, car nous avions besoin d'inclure des informations supplémentaires telles que le rôle de l'utilisateur et la date d'expiration dans ces tokens. 

## La proposition de modification : une Pull Request à Cyrus

Pour résoudre cette limitation, nous avons décidé de proposer une modification du code de Cyrus. Nous avons rédigé une *Pull Request* détaillée, expliquant en quoi l'ajout de ces champs supplémentaires était essentiel pour répondre à nos besoins spécifiques. Cette proposition a été soumise à l'équipe de développement de Cyrus dans l'espoir d'une intégration future.

[![pull request](images/migration_cyrus/pull_request.png)](https://github.com/cyrusimap/cyrus-imapd/pull/4515)

## L’intégration de la Pull Request et la résolution du problème

Quelques jours plus tard, nous avons reçu une excellente nouvelle : notre *Pull Request* [a été acceptée et intégrée au code principal de Cyrus](https://github.com/cyrusimap/cyrus-imapd/pull/4526). Cette intégration a permis d'étendre la fonctionnalité de décodage des Json Web Tokens, maintenant capables de prendre en compte le rôle de l'utilisateur et la date d'expiration. Je suis ravi d'avoir participé à ce commun qui date de 1994. <3 le logiciel libre.

## Procédure de migration et mise à jour du serveur

La migration vers la version 3.6.1 de Cyrus s'est déroulée sans accroc. Nous avons suivi attentivement la [procédure recommandée](https://www.cyrusimap.org/imap/download/upgrade.html?highlight=migration), en veillant à sauvegarder nos données importantes et à prendre les précautions nécessaires pour assurer une transition en douceur. 

Il y a quelques jours, la version 3.8.0 a été publiée à son tour. L'upgrade est plus simple à faire dans une version plus récente du système d'exploitation (problème de version de dépendances). Nous sommes passés de la Debian 11 à la [Debian 12](https://www.debian.org/News/2023/20230610). Merci aux développeurs ayant travaillé sur cette montée de version qui a été très bien préparée : nous n'avons eu aucun obstacle dans cette opération toujours délicate. À présent nous allons pouvoir installer la 3.8.0 de Cyrus pour bénéficier des dernières fonctionnalités et corrections de bugs.

## Une évolution constante pour notre infrastructure de messagerie

La mise à jour de notre serveur IMAP Cyrus en version 3.6.1 marque une étape cruciale dans l'amélioration de notre infrastructure de messagerie. Cette migration réussie souligne l'importance de l'innovation continue dans le domaine de la messagerie électronique. Deux versions majeures en 3 mois qui a dit que le mail n'évoluait pas ?

***



C'est une migration majeure qui avait l'avantage d'apporter le décodage des Json Web Tokens directement par cyrus pour la partie HTTP. Le souci avec cette fonctionnalité c'est qu'elle n'acceptait que 2 champs dans la *payload* du token : la date à laquelle le token a été émis (ce qui permet de rejeter des jetons au-delà d'un certain temps configurable dans cyrus), et le sujet (qui contient le mail de l'utilisateur). Or nous avions aussi le rôle de l’utilisateur et la date d'expiration dans ce token.

Nous avons alors pris notre plus belle plume pour rédiger une *Pull Request* à l'équipe de cyrus, c’est-à-dire proposer une modification du code :

[![pull request](images/migration_cyrus/pull_request.png)](https://github.com/cyrusimap/cyrus-imapd/pull/4515)

Cette *Pull Request* [a été intégrée au code de cyrus](https://github.com/cyrusimap/cyrus-imapd/pull/4526) quelques jours plus tard. Pas peu fiers d'avoir participé à ce commun qui date de 1994. <3 le logiciel libre.

Nous avons suivi scrupuleusement la procédure de migration [décrite par la doc de cyus](https://www.cyrusimap.org/imap/download/upgrade.html?highlight=migration). Cette migration s'est déroulée sans problème directement sur le serveur.

Il y a quelques jours, la version 3.8.0 a été publiée à son tour. L'upgrade est plus simple à faire dans une version plus récente du système d'exploitation (problème de version de dépendances). Nous sommes passés de la Debian 11 à la [Debian 12](https://www.debian.org/News/2023/20230610). Merci aux développeurs ayant travaillé sur cette montée de version qui a été très bien préparée : nous n'avons eu aucun problème dans cette opération toujours délicate. À présent nous allons pouvoir installer la 3.8.0 de Cyrus pour bénéficier des dernières fonctionnalités et corrections de bugs.

Deux versions majeures en 3 mois qui a dit que le mail n'évoluait pas ?
