#!/bin/bash
# -*- coding: UTF8 -*-

docker run --volume="$(pwd):/srv/jekyll" -it -p 127.0.0.1:4000:4000 jekyll/jekyll:4 \
  sh -c "apk add make gcc musl-dev && bundle install && bundle exec jekyll serve --drafts --watch --host 0.0.0.0"
