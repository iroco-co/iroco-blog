---
layout: post
title: Utilisation d'un injecteur de charge pour simuler des emails
author:
  display_name: Bruno Thomas
categories:
- Sous le capot
- Avancé
tags:
- benchmark
- backend
---

Grâce à notre petit outil de charge [mailtempest](https://github.com/iroco-co/mailtempest) nous allons injecter de la charge sur notre serveur pour simuler un trafic de mail correspondant à un certain nombre d'utilisateurs.

# Préparation des données

On provisionne les utilisateurs dans la base de données de notre serveur de préprod. On en fait 100 pour le moment. On utilise les [seeds knex](https://github.com/iroco-co/jmap-admin/blob/main/src/db/seeds/bench/03_bench_provision.mjs) de notre app pour générer des comptes avec des mots de passes au hasard.

On part des données du [dataset Enron](https://www.cs.cmu.edu/~enron/). Comme les adresses sont externes à notre domaine il faut les remplacer par des adresses mail internes qui se trouvent dans celles provisionnées sur notre plateforme de préprod. Après avoir créé une liste d'expressions `sed` avec la liste de tous les mails trouvés (cf [cet autre outil](https://github.com/iroco-co/mail-inspector)):

```
for f in mails/* ; do mail-inspector display-recipients $f | grep -v "no header"; done | sed 's/.*address: Some("\(.*\)").*/\1/' | sort | uniq > emails.csv
```

on remplace dans tous les emails:
```
cat ../sed_exp.txt| while read line; do {
  for f in * ; do {
    sed -i $line $f
  }
  done
}
done
```

Et là c'est trèèèèèès long: un ou deux changements toutes les 5 secondes sur 150K changements à faire (~ un peu plus de 4 jours à attendre). En effet, pour chacun des 8965 mails trouvés, on fait le `sed -i` "rechercher/remplacer" dans 15000 fichiers mail. Alors on a fait un autre utilitaire qu'on a intégré dans mailtempest car il utilisait des fonctions proches de celles qu'on avait déjà implémentées. Il s'exécute en 5-6 secondes sur les 15000 mails.

# Mesures

nous utilsons la commande `top` qui permet d'avoir la consommation de CPU/mémoire en temps réel.
Complication, il y a plein de process différents à observer:

- master (cyrus)
- master (postfix)
- spamd
- amavis
- smtpd
- imapd
- lmtpd
