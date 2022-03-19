---
layout: post
title: Benchmark proxy
author:
  display_name: Bruno Thomas
categories:
- dev
tags:
- rust
- python
- greenIT
- backend
- benchmark
---

Pour utiliser le serveur JMAP de cyrus dans notre application de webmail, nous devons nous authentifier. Nous voyons qu'il n'y a pas d'[autres mécanismes](https://github.com/cyrusimap/cyrus-imapd/issues/3103) que de faire du [basic auth HTTP](https://en.wikipedia.org/wiki/Basic_access_authentication). C'est un peu embêtant car cela oblige à envoyer les informations (utilisateur/mot de passe) de connexion pour chaque requête JMAP. Nous nous décidons alors à faire un petit proxy (comme ils l'indiquent [dans l'issue](https://github.com/cyrusimap/cyrus-imapd/issues/3103)) qui ajoutera les informations côté serveur.

C'est très simple de le faire en python puisque notre backend de connexion est en python. Le déchiffrement du JWT token, et la lecture des informations dans la base Redis et le chiffrement/déchiffrement en AES est fait en 10 lignes de code. Le soucis c'est que toutes les requêtes relatives aux mails (lister les mails, afficher un mail, etc.) passeront par ce proxy. C'est impactant.

Alors nous faisons [un proxy en Rust](https://crates.io/crates/hyper-auth-proxy). Il va juste aller chercher les _credentials_ dans la base Redis, les décoder et les ajouter encodées en base64 dans le header `Authorization`. Nous choisissons de le faire en asynchrone avec [hyper](https://hyper.rs/) pour qu'il soit [le plus efficace possible](https://www.techempower.com/benchmarks/#section=data-r18&hw=ph&test=plaintext).

![hyper auth proxy](/images/proxy_benchmark/auth_token.png)

A présent nous pouvons comparer les deux avec un petit bench pour vérifier notre hypothèse. Pour cela nous faisons tourner un serveur nginx sur une machine, et sur une autre, nous lançons notre proxy. L'injecteur [ab](https://httpd.apache.org/docs/2.4/programs/ab.html) tourne également sur la machine du proxy. 

Ce test de performance nous intéresse car c'est typiquement un problème _I/O bound_ (relatifs aux entrées sorties réseau) : le proxy reçoit des requêtes HTTP, va chercher (via le réseau encore) une valeur dans la base de données, et fait une requête vers le serveur nginx. 

Nous faisons 7 tirs de 10000 requêtes: 

* un tir de référence avec une concurrence de 1 (un utilisateur), directement sur nginx pour voir le temps de traitement des requêtes. Facile, il sert à 1ms
* un tir sur le proxy rust monothreadé (concurrence de 1) en mode debug
* un tir sur le proxy rust en compilation optimisée (nous avions oublié dans le tir précédent de faire un build optimisé avec l'option `--release`)
* un tir sur le proxy rust en multithreadé (un thread par coeur)
* un tir sur le proxy python (concurrence de 1)
* un tir sur le proxy monothreadé rust avec une concurrence de 8 (8 utilisateurs en parallèle)
* un tir sur le proxy python avec une concurrence de 8

Voici les résultats obtenus :

![diagramme](/images/proxy_benchmark/auth_proxy.png)

Ce que nous voyons : 

1. dans les mêmes conditions (monothreadé, concurrence de 1) rust est 4,2 fois plus efficace que python
2. rust en compilation non-optimisée est 2,6 fois moins efficace
3. avec une concurrence de 8 les performances de python explosent. C'est lié au fait que notre serveur est synchrone, il ne peut pas paralléliser les requêtes
4. résultat que nous avons du mal à expliquer : rust fait mieux avec 8 utilisateurs parallèles que avec un seul
 
Ok c'est très fort pour rust. Cela dit la comparaison n'est pas tout à fait juste : 

1. nous vérifions la signature du JWT en SHA-512 donc il y a aussi de la CPU dans ce calcul (sans doute fait avec binding C pour python)
2. nous décodons les crédentials en AES-256 ce qui est aussi de la crypto qui utilise la CPU (également avec un binding C pour python)
3. le serveur python n'est pas asynchrone alors que le proxy rust l'est

Alors testons un pur reverse proxy HTTP asynchrone en monothreadé. Nous récupérons ce [proxy asyncio python](https://github.com/haobanga/reverse-proxy), et nous modifions le code de notre proxy pour qu'il ne fasse que relayer la requête vers le backend (juste la partie [hyper-reverse-proxy](https://github.com/felipenoris/hyper-reverse-proxy)). 

Nous faisons plusieurs tirs de 100K requêtes. Voici les résultats:

![diagramme](/images/proxy_benchmark/http_proxy.png)

Nous constatons que le proxy rust fait toujours mieux, alors que nous sommes dans des situations comparables. Il ajoute 0,5ms au temps de réponse de nginx. Le proxy python fait très bien également en ajoutant 1ms, mais c'est deux fois plus.

Conclusion, même sur des performances presque uniquement _I/0 bound_ rust est quand même bien plus efficace que python.
