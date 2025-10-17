---
layout: post
title: Migration du Design System des outils Iroco
description: Nous avons récemment changé notre façon de documenter le Design System des outils de l’écosystème autour d’Iroco. Dans cet article un peu technique, nous expliquons les raisons de ce changement. Nous décrivons notre démarche pour comparer quelques alternatives. Nous concluons avec les raisons de notre choix final.
author:
  name: marc
categories:
  - Sous le capot
  - Avancé
tags:
  - Refactoring
  - Accessibilité
  - Design System
---

*Nous avons récemment changé notre façon de documenter le Design System des outils de l’écosystème autour d’Iroco.
Dans cet article un peu technique, nous expliquons les raisons de ce changement. 
Nous décrivons notre démarche pour comparer quelques alternatives. 
Nous concluons avec les raisons de notre choix final.*

## Pourquoi un Design System ?

[Iroco][iroco-landing] se décompose en plusieurs outils[^1]. 
Nous avons observé de la redondance (copier-coller) sur leur identité visuelle. 
Ça nous demande un effort conséquent quand nous devons mettre à jour l’apparence visuelle et la répercuter sur les différents outils. 

[iroco-landing]: https://iroco.co

[^1]: Exemples d’outils de l’écosystème Iroco partageant leur identité visuelle : [iroco.co][iroco-landing], [app.iroco.co][iroco-app]

[iroco-landing]: https://iroco.co
[iroco-app]: https://app.iroco.co

Pour rendre réutilisable cette identité visuelle, nous avons mis en place un Design System[^2]. 
Voici [à quoi il ressemble][iroco-ui-2024-01-12] le 12 janvier 2024.

[^2]: Design System, aussi appelé "Système de Design" ou encore "Système de conception". C’est une collection de composants web prêts à l’emploi, en général accompagnée de guides de style, d’images et parfois de typographies. Un Design System permet souvent d’avoir une identité visuelle cohérente entre plusieurs applications d’une même marque, organisation ou encore produit.

[iroco-ui-2024-01-12]: https://web.archive.org/web/20240112104445/https://iroco-co.github.io/iroco-ui/

Fin 2023, nous avons décidé d’explorer des alternatives à notre approche initiale ([Svelte-Docs][svelte-docs]).
Après quelques recherches, la liste des candidats a été réduite aux 2 outils suivants :

- [Histoire][histoire]
- [Storybook][storybook]

[svelte-docs]: https://github.com/alexxnb/svelte-docs/
[histoire]: https://histoire.dev/
[storybook]: https://storybook.js.org/

## Spike et méthode mikado

Pour décider de l’outil à adopter, nous avons construit un Spike[^3] dans le but de comparer les 2 solutions sur les critères que nous allions découvrir en partie lors de l’expérimentation.

[^3]: Une [Spike Solution][xp-spike-solution] est une courte expérimentation pour vérifier rapidement la faisabilité d'une solution. 

[xp-spike-solution]: https://web.archive.org/web/20240118212527/http://www.extremeprogramming.org/rules/spike.html

Comme souvent, nous avons organisé cette session sous la forme de Pair-Programming[^4] en utilisant la "Mikado Method"[^5] pour structurer notre exploration. 
Aussi cela nous permettrait d’arrêter l’expérimentation si un critère important n’était pas rempli pour un ou pour l’autre candidat.

[^4]: [Pair-Programming][xp-pair-programming], aussi appelé binômage, consiste à travailler à 2 sur le même problème. Nous aimons bien cette approche, car nous y trouvons plusieurs avantages : compréhension partagée du problème, nous apprenons beaucoup de choses, relecture en direct, moins d’erreurs.

[^5]: [Mikado Method ][mikado-method]: La méthode Mikado est une approche visuelle partant d’un problème où on explore des solutions en remontant ses dépendances (prérequis). Cette technique permet de faciliter la résolution de problèmes complexes comme : le refactoring, le debugging, l’exploration de solutions. Elle nous est très utile pour explorer des idées et éviter de nous éparpiller en pouvant revenir sur nos pas.

[xp-pair-programming]: https://web.archive.org/web/20240108010754/http://www.extremeprogramming.org/rules/pair.html
[mikado-method]: https://mikadomethod.info/

![Diagramme “Mikado Method” : Le point de départ est la problématique “Documentation vivante du Design System iroco-ui”. Il en découle en dépendances les 3 alternatives étudiées : application Svelte existante, Storybook, Histoire. De chacune de ces branches découle des dépendances/prérequis correspondant aux capacités que nous attendons des outils mais aussi aux étapes nécessaires pour les réaliser. On observe plus de noeuds du côté de Storybook. Nous avons aussi ajouté des “pour” et des “contre” du côté de chaque outil. Le rapport “pour/contre” est en faveur de Storybook. Les raisons de nos choix sont expliquées plus en détails dans la suite de l’article.](/images/choix-outil-design-system/mikado-method-graph.jpg)

## Svelte-Docs : L'existant

À ce moment, le "showcase" consiste en une application [Svelte][svelte] enrichie par  [Svelte Docs][svelte-docs] qui montre les différents composants.

[svelte]: https://svelte.dev/

Bien que cette approche fonctionne, on arrive rapidement à des limites :

- Difficulté à maintenir
- Svelte-Docs est assez peu populaire, et a peu de contributeurs
- Svelte-Docs semble être en cours de réécriture

## Storybook : L’acteur établi

Storybook a été le premier outil que nous ayons essayé.

Nous avons été très agréablement surpris par la facilité à démarrer un projet Storybook à l’aide de la CLI[^6] Wizard proposée par l’outil.

[^6]: CLI : Outil en ligne de commandes

La [documentation de démarrage](https://storybook.js.org/docs/get-started/install) est assez concise et efficace à l'heure où j'écris cet article et permet de choisir avec quelle technologie utiliser Storybook. 
Nous avons choisi le "parfum" Svelte.

[Une fois initialisé](https://github.com/iroco-co/iroco-ui/pull/4/commits/3e0a5d12fe34daef2c7fafffa958daec4e54cebe), l'outil propose un squelette simple avec quelques exemples et une documentation sous la forme d’un fichier ["Configure.mdx"](https://github.com/iroco-co/iroco-ui/pull/4/commits/3e0a5d12fe34daef2c7fafffa958daec4e54cebe#diff-cad826cca64452dfc7386369bb63481b8daf8ec62b17494551427c7b1c496ebd)

Nous avons [nettoyé certains exemples](https://github.com/iroco-co/iroco-ui/pull/4/commits/bfd07fd0e0a7cbe63dd8075ce65f831e37ee698f) pour réduire le bruit.

L’étape d’après : brancher un de nos propres composants ! Ce sera le bouton. 
Nous nous inspirons de l’exemple de bouton déjà présent.

Nous avons ajouté l’addon [`@storybook/addon-svelte-csf`](https://storybook.js.org/addons/@storybook/addon-svelte-csf) qui nous permet d'écrire la documentation sous la forme de fichier svelte. 
Pour ce faire, nous avons quelque peu [modifié la configuration](https://github.com/iroco-co/iroco-ui/pull/4/commits/23f96ca5319a35947fc06e8c67410185529a2878) pour que storybook interprète les fichiers de documentation svelte.

Écrire [notre première spécification pour le bouton](https://github.com/iroco-co/iroco-ui/pull/4/commits/23f96ca5319a35947fc06e8c67410185529a2878#diff-40b36718642a1b7c33552aa520ea28b28b884faf3104007ab342287f9ba90010) est finalement assez compact et concis.

Il aurait été sympa d'avoir une forme de complétion via le typage pour l'objet `meta` qui décrit le composant à documenter. 
Nous avons du nous référer régulièrement à [la documentation en ligne](https://storybook.js.org/docs/writing-stories) pour écrire cette première histoire.

Le système de template est assez bien fait et permet de créer facilement des variations sans avoir à réécrire le composant complètement. 
On ne modifie que ce qui varie.

Les contrôles et certains event handlers peuvent être définis dans des balises script.

```html

<script context="module"
        type="ts">
    import Button from './Button.svelte';
    export const meta = {
        title: "Button",
        component: Button,
        argTypes: {
            kind: {
                control: {type: 'select'},
                options: ['danger', 'success', 'dark', 'basic'],
            },
            size: {
                control: {type: 'select'},
                options: ['small', 'regular']
            }
        },
    }
</script>

<script>
    import {Story, Template} from '@storybook/addon-svelte-csf';

    let count = 0;

    function handleClick() {
        count += 1;
    }
</script>
```

Les templates sont définis à l’aide de composants Svelte. 
On voit ici que les arguments sont passés de manière générique. 
Ce qui semble rendre possible d’en faire des variations partielles (voir plus bas).

```html

<Template let:args>
    <Button {...args}
            on:click
            on:click={handleClick}>
        You clicked: {count}
    </Button>
</Template>

<Story name="Danger"
       args=\{\{kind: "danger"\}\}/>

<Story name="Button No Args">
    <Button>Label</Button>
</Story>
```

Nous avons ajouté [des contrôles](https://github.com/iroco-co/iroco-ui/pull/4/commits/23f96ca5319a35947fc06e8c67410185529a2878) permettant de faire varier les attributs d’un composant même en dehors de variations. 
Par exemples des listes de sélection pour faire varier les attributs `kind` et `size` de notre bouton.

```js
    export const meta = {
    title: "Button",
    component: Button,
    argTypes: {
        kind: {
            control: {type: 'select'},
            options: ['danger', 'success', 'dark', 'basic'],
        },
        size: {
            control: {type: 'select'},
            options: ['small', 'regular']
        }
    },
}
```

De façon assez étrange, il n’est pas évident de voir un aperçu du composant en même temps que son code source dans les exemples que nous avons essayés.

Nous avons observé que Storybook disposait d’un [catalogue assez fourni d’extensions](https://storybook.js.org/integrations/).

Certaines d'entre-elles pourraient nous intéresser :

- https://storybook.js.org/addons/@storybook/addon-a11y/
- https://storybook.js.org/addons/@storybook/test-runner/

Storybook propose des fonctionnalités intéressantes parmi lesquelles :

- Un aperçu permettant de simuler les dimensions d’un appareil mobile
- La simulation de déficience visuelle (pour vérifier certains aspects d’[Accessibilité][tag-accessibilite])
- La simulation de certains événements du navigateur (`:active`, `:hover`, `:visited` ) qui d’habitude se retrouve dans les outils de développeur des navigateurs web. 
  Ce qui rend accessible ces paramètres à des utilisateurs non techniques
- Un onglet d'accessibilité qui permet d'indiquer la conformité de certains critères d'accessibilité

[tag-accessibilite]:/tags/#Accessibilité-ref

Il y a pléthore d'extensions.
Cela a probablement considérablement influé sur notre choix final.

[Storybook est très connu](https://github.com/storybookjs/storybook) et maintenu : plus de 80 000 étoiles Github.

![Capture d’écran : Storybook a plus de 80000 étoiles sur Github](/images/choix-outil-design-system/storybook-80000-github-stars.jpg)

[Les statistiques de contribution](https://github.com/storybookjs/storybook/pulse/monthly) montrent qu'il y a au moins 10 contributeurs significatifs sur la période du 12 décembre 2023 au 12 janvier 2024.

![Capture d’écran : Statistiques de contribution de Storybook entre décembre 2023 et janvier 2024 qui montrent une activité conséquente de 25 auteurs)](/images/choix-outil-design-system/storybook-contribution-stats-early-2024.jpg)

[L'historique des contributeurs](https://github.com/storybookjs/storybook/graphs/contributors) montre que depuis presque 10 ans les contributions sont régulières et ne sont pas le fait d'un seul auteur.

![Capture d’écran : Storybook a des contributions régulières et diverses entre 2015 et 2024. Le premier contributeur cumule 13977 commits. Le second en compte 10853](/images/choix-outil-design-system/storybook-overall-contribution-from-2015-to-2024.jpg)

[Le projet est sponsorisé](https://github.com/storybookjs/storybook?tab=readme-ov-file#sponsors) par une trentaine d'organisations.

## Histoire : Le challenger

Nous avons ensuite essayé [Histoire][histoire].

Histoire gravite autour de l'écosystème de VueJs et s'appuie sur ViteJs pour assembler le contenu. 
L'outil vante sa rapidité qui est historiquement un problème de Storybook.

Nous avons de prime abord été un peu déçus par le démarrage qui manquait de clarté.

Nous avons ensuite compris qu'une des façons les plus simples de commencer était [d'ouvrir l'éditeur de la démo live](https://stackblitz.com/edit/histoire-svelte3-starter?file=package.json) et copier les bouts de code qu'il nous fallait.

Un peu étrange comme approche, mais ça a plutôt bien fonctionné.

Nous n’avons pas eu de difficultés à documenter un composant.

```html

<script lang="ts">
    import {logEvent} from 'histoire/client'
    import Button from './Button.svelte'
    import type {Hst} from '@histoire/plugin-svelte'

    export let Hst: Hst
    let disabled = false
    let size = 'small'
    let type = 'button'
    let kind = 'basic'
    // let node : 'small' | 'regular' | undefined = 'small'
</script>
```

```html

<Hst.Story title="Button">

    <Hst.Variant title="Default">
        <Button
                {disabled}
                {size}
                {kind}
                on:click={event
        => logEvent('click', event)}
        id="bar">
        Click me!
        </Button>
    </Hst.Variant>

    <Hst.Variant title="Danger">
        <Button
                kind="danger"
                id="bar-danger">
            Click me!
        </Button>
    </Hst.Variant>

    <!-- définition des controles -->

</Hst.Story>
```

Contrairement à Storybook, les contrôles sont également définis à l’aide de composants Svelte. 
Cela offre une expérience un peu plus unifiée et plus proche de code Svelte.

Les attributs sont clairement associés aux variables définies dans la partie script.
Ce qui rend la documentation assez explicite.

```html

<Hst.Story title="Button">

    <!-- définition des variantes -->

    <svelte:fragment slot="controls">
        <Hst.Checkbox
                bind:value={disabled}
                title="Disabled"
        />
        <Hst.Select
                bind:value={size}
                options={['small',
        'regular']}
        title="Size"
        />
        <Hst.Select
                bind:value={kind}
                options={['danger',
        'success','dark','basic']}
        title="Kind"
        />
        <Hst.Select
                bind:value={type}
                options={['button',
        'submit','reset']}
        title="Type"
        />
        <pre>{JSON.stringify({disabled, size}, null, 2)}</pre>
    </svelte:fragment>
</Hst.Story>
```

Histoire est théoriquement capable de générer des templates dynamiques du code source : "Auto-CodeGen". 
C’est-à-dire qu’on peut jouer avec les contrôles pour modifier les attributs (ex. `kind` ou `size` dans l’exemple de notre bouton) et afficher le code à copier. 
C'est probablement une fonctionnalité qui fonctionne mieux sur des composants [VueJs][vuejs]. 
Nous n’avons cependant pas réussi à le faire fonctionner lors de notre expérimentation.

[vuejs]: https://vuejs.org/

Histoire propose une fonctionnalité expérimentale assez intéressante : "Auto-Docs". 
Celle-ci permet de générer une documentation et des contrôles automatiquement en analysant les composants importés. 
Cela permet de gagner un peu de temps quand on commence de documenter un composant.

Le statut de support de ces fonctionnalités peut être retrouvé [sur cette page](https://histoire.dev/guide/getting-started.html#supported-frameworks).

Comme Storybook, Histoire permet de faire varier la dimension de la zone d'affichage pour simuler des appareils mobiles. 
Par contre, nous n’avons pas trouvé de fonctionnalités d’accessibilité plus avancées.

Si Histoire dispose de moins de fonctionnalités que Storybook, l’interface nous parait un peu moins chargée visuellement.

Avec une fonctionnalité de composants dynamique un peu intégrée, on peut imaginer que des binômages entre des développeurs et des experts d’expérience utilisateur puissent être fluidifiées.

Histoire propose [quelques plugins](https://histoire.dev/guide/plugins/official.html) qui servent notamment à supporter des frameworks de test automatisé. 
S'il est limité, on peut imaginer que ce catalogue vienne à s’étoffer quand Histoire sera plus adopté.

[Le projet Histoire](https://github.com/histoire-dev/histoire) avoisine les 3 000 étoiles Github.

![Capture d’écran : environs 3000 étoiles sur Github](/images/choix-outil-design-system/histoire-3000-github-stars.jpg)

[Les statistiques de contribution](https://github.com/histoire-dev/histoire/pulse/monthly) montrent très peu d'acticité entre le 12 décembre 2023 et le 12 janvier 2024.

![Capture d’écran : Statistiques de contribution Github du 12 décembre 2023 au 12 janvier 2024. Aucun commit à cette période.](/images/choix-outil-design-system/histoire-contribution-activity-2023-12-to-2024-01.jpg)

[L'historique des contributeurs](https://github.com/histoire-dev/histoire/graphs/contributors) illustre un projet jeune avec un seul contributeur significatif.


![Capture d’écran : Historique des contributeurs entre le début du projet en janvier 2022 et aujourd'hui en janvier 2024. On observe une grande activité entre 2022 et début 2023. Ensuite des contributions plus rares et plus espacées. L’activité est principalement du fait d’un auteur (983 commits). Le 2ème contributeur cumule 37 commits.](/images/choix-outil-design-system/histoire-maintained-mainly-by-1-contributor.jpg)

[Le projet est sponsorisé](https://github.com/histoire-dev/histoire?tab=readme-ov-file#sponsors) par des acteurs majeurs de l'écosystème VueJs.

## Conclusion

### Storybook

Storybook est établi et a une quantité considérable de fonctionnalités et d'extensions. 
Il est selon nous plus probable que des contributeurs maitrisent cet outil.

Nous pressentons une courbe d’apprentissage qui nécessite de passer du temps régulièrement dans la documentation.

Nous avons pu "échafauder" Storybook assez simplement et de façon quasiment complètement automatisée.

Le code permettant de décrire des "stories" s'éloigne assez de code qu'on pourrait écrire en production. 
On ne peut pas vraiment copier-coller de code depuis le code de documentation.

Les fonctionnalités autour de l’accessibilité sont très intéressantes pour notre contexte.

Storybook est développé et maintenu très activement depuis plusieurs années par plusieurs contributeurs actifs.

### Histoire

Histoire dispose pour le moment de peu de fonctionnalités. 

Nous trouvons son interface graphique moins chargée que Storybook.

Nous avons trouvé la documentation succincte. 
Nous avons trouvé qu’Histoire était plutôt intuitif à utiliser, car le code est assez similaire de code qu’on écrirait en production.

L’outil vante sa rapidité. 
Lors de nos essais, nous n'avons pas ressenti que ce critère pouvait avoir une importance. 
Peut-être qu’un usage plus prolongé nous ferait changer d'avis?

Les fonctionnalités de génération de documentation à partir des composants importés et code dynamique sont prometteuses. 
Nous trouvons qu’elles manquent de maturité.

### Notre choix

Nous avons finalement choisi Storybook pour les raisons suivantes :

- la maturité de l’écosystème
- un projet maintenu par plusieurs personnes depuis longtemps
- des fonctionnalités d’accessibilité intéressantes

## Ressources et liens

L'issue Github qui couvre ce périmètre : https://github.com/iroco-co/iroco-ui/issues/2

[La Pull Request concernant la mise en place de Storybook](https://github.com/iroco-co/iroco-ui/pull/4) permet de retracer les modifications pour passer à Storybook.

Nous avons volontairement laissé une branche ouverte sur le [spike de Histoire](https://github.com/iroco-co/iroco-ui/tree/spike-histoire) pour conserver quelques éléments de contexte sur notre exploration.

Le board Miro que nous avons construit est également [disponible en lecture](https://miro.com/app/board/uXjVNCxGGLM=/?share_link_id=395188175322).

***
