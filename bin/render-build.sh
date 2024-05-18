#!/usr/bin/env bash
set -o errexit

bundle _${BUNDLER_VERSION}_ install

bundle exec rails db:create
bundle exec rails db:migrate

bundle exec rails assets:precompile
bundle exec rails assets:clean

bundle exec rails s

