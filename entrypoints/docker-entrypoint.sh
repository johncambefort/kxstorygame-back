#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install

bundle exec rails db:create # could fail, that's alright
bundle exec rails db:migrate

bundle exec rails assets:precompile
bundle exec rails assets:clean

bundle exec rails s

