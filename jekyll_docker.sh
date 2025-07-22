#!/bin/bash
# -*- coding: UTF8 -*-

docker run --rm --volume=$(pwd):/srv/jekyll -it -p 127.0.0.1:4000:4000 jekyll/jekyll:4 apk add make gcc musl-dev && bundle install && bundle exec jekyll serve --drafts --watch
