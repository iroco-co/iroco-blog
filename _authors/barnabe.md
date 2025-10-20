---
layout: default
name: barnabe
display_name: Barnabé Geffroy
---

# {{ page.display_name }}

Quelques liens :

* [mon profil github](https://github.com/barnabegeffroy)
* [mon profil LinkedIn](https://www.linkedin.com/in/barnabe-geffroy-ensiie/)
## Articles

<!--
{% assign posts = site.posts | where_exp : "post" , "post.author.name == page.name "  %}
-->

<!-- {% for post in posts %} -->
- [{{ post.title }}]({{ post.url}})
<!-- {% endfor %} -->

