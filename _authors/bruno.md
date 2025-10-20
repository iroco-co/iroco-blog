---
layout: default
name: bruno
display_name: Bruno Thomas
---

# {{ page.display_name }}

Quelques liens :

* [github](https://github.com/bamthomas)
* [LinkedIn](https://fr.linkedin.com/in/bamthomas)
* [Mastodon](https://mastodon.social/@bthomas)

## Articles

<!--
{% assign posts = site.posts | where_exp : "post" , "post.author.name == page.name "  %}
-->

<!-- {% for post in posts %} -->
- [{{ post.title }}]({{ post.url}})
<!-- {% endfor %} -->

