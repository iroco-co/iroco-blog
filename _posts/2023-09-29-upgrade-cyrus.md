---
layout: post
title: Mise à jour de Cyrus en version 3.6 - Une migration pour notre serveur IMAP
description: Un (nouveau) tour sous le capot pour découvrir la dernière mise à jour de Cyrus en version 3.6
author:
  display_name: Bruno Thomas
categories:
- Sous le capot
- Avancé
tags:
- cyrus
---

*La technologie évolue sans cesse, et il est indispensable de maintenir notre infrastructure de messagerie à jour pour répondre aux besoins de nos utilisateurs. Nous avons récemment effectué la migration de notre serveur IMAP Cyrus, passant de la version 3.4.2 à la version 3.6.0 puis 3.6.1. Cette mise à jour a apporté de nouvelles fonctionnalités et améliorations essentielles, mais elle a également présenté des défis intéressants à surmonter.*

## Pourquoi migrer vers Cyrus 3.6 ?

La décision de mettre à jour notre serveur IMAP Cyrus vers la version 3.6 a été motivée par plusieurs raisons :
- Tout d'abord, pour des raisons évidentes de **sécurité de notre infrastructure** qui recommandent d'utiliser la dernière version en date ;
- Cette nouvelle version apporte également un **changement de structure profond** du stockage sur disque (fichiers et répertoires) des informations liées aux boîtes mail (contenu des mails, mais également fils de messages, dossiers, ainsi que contacts et calendriers) ;
- Enfin, elle introduit une fonctionnalité de **décodage des JSON Web Tokens** directement par Cyrus pour la partie HTTP. Les JSON Web Tokens (JWT) constituent un standard ouvert d'authentification sécurisée défini dans la RFC 7519, permettant un échange de données sécurisées entre deux parties, le plus souvent entre les applications serveur et client, et disposent d'un certain nombres d'avantages comparés aux cookies.

Cette dernière amélioration offre une sécurité accrue et simplifie la gestion des autorisations d'accès : les JSON Web Tokens sont maintenant décodés automatiquement par Cyrus, ce qui facilite grandement l'interaction avec les applications tierces.

## Le défi du décodage des Json Web Tokens

Malgré les avantages indéniables du décodage des JSON Web Tokens par Cyrus, cette fonctionnalité était initialement limitée à deux champs dans la charge utile (*payload*) du token : la date à laquelle le token a été émis (ce qui permet de rejeter des jetons au-delà d'un certain temps configurable dans cyrus), et le sujet (qui contient le mail de l'utilisateur). Cette restriction posait problème, car nous avions besoin d'inclure des informations supplémentaires telles que le rôle de l'utilisateur et la date d'expiration dans ces tokens.

Pour résoudre cette limitation, nous avons décidé de proposer une modification du code de Cyrus. Nous avons rédigé une _Pull Request_ détaillée, expliquant en quoi l'ajout de ces champs supplémentaires était essentiel pour répondre à nos besoins spécifiques.
*[![pull request](images/migration_cyrus/pull_request.png)](https://github.com/cyrusimap/cyrus-imapd/pull/4515)*  

Cette proposition a été soumise à l'équipe de développement de Cyrus dans l'espoir d'une intégration future.

## L’intégration de la Pull Request et la résolution du problème

Quelques jours plus tard, nous avons reçu une excellente nouvelle : notre *pull request* [a été acceptée et intégrée au code principal de Cyrus](https://github.com/cyrusimap/cyrus-imapd/pull/4526). Cette intégration a permis d'étendre la fonctionnalité de décodage des JSON Web Tokens, maintenant capables de prendre en compte le rôle de l'utilisateur et la date d'expiration. Je suis ravi d'avoir participé à l'évolution de ce commun numérique dont la conception date de 1994. Vive le logiciel libre !

## Procédure de migration et mise à jour du serveur

La migration vers la version 3.6.1 de Cyrus s'est déroulée sans accroc. Nous avons suivi attentivement la [procédure recommandée](https://www.cyrusimap.org/imap/download/upgrade.html?highlight=migration), que nous avons répétée une première fois sur notre plateforme de pré-production avant de l'exécuter sur la production - étape déterminante pour que la migration puisse se dérouler correctement.

Il y a quelques semaines, la version 3.8.0 de Cyrus a été publiée à son tour. La mise à jour est plus simple à faire dans une version plus récente du système d'exploitation (problème de version de dépendances). Nous sommes passés de la Debian 11 à la [Debian 12](https://www.debian.org/News/2023/20230610). Merci aux développeurs ayant travaillé sur cette montée de version qui a été très bien préparée : nous n'avons eu aucun obstacle dans cette opération toujours délicate.

Nous venons d'installer la 3.8.0 puis 3.8.1 de Cyrus pour bénéficier des dernières fonctionnalités et corrections de bugs.

**Deux versions majeures en 3 mois : qui a dit que le mail n'évoluait plus ?**
