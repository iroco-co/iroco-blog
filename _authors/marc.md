---
layout: default
name: marc
display_name: Marc Bouvier
---

# {{ page.display_name }}

Quelques liens :

* [github](https://github.com/marc-bouvier)
* [moi](https://u.baldir.fr/me)
* [blog](https://baldir.fr)
* [LinkedIn](https://fr.linkedin.com/in/profileofmarcbouvier)
* [Mastodon](https://pouet.chapril.org/@marc_bouvier)
 

## Articles

<!--
TODO : maybe generalize ?
{% assign posts = site.posts | where_exp : "post" , "post.author.display_name == page.display_name "  %}
-->

<!-- {% for post in posts %} -->
- [{{ post.title }}]({{ post.url}})
<!-- {% endfor %} -->

