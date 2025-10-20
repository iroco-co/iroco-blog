---
layout: default
name: arthur
display_name: Arthur Billebaut
---

# {{ page.display_name }}

Quelques liens :

* [github](https://github.com/ArthB94)
* [LinkedIn](https://fr.linkedin.com/in/billebaut-arthur/)

## Articles

<!--
{% assign posts = site.posts | where_exp : "post" , "post.authors contains page.name"  %}
-->

<!-- {% for post in posts %} -->
- [{{ post.title }}]({{ post.url}})
<!-- {% endfor %} -->

