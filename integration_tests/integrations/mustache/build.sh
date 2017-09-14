#! /bin/bash
set -e

rm -rf vendor/mustache_hackney_template/*

# TODO: Pick the latest, not every matching tgz file!
tar -zxvf ../../../pkg/mustache_hackney_template-*.tgz -C vendor/

bundle install --path vendor/bundle

bundle exec ruby test_render.rb
