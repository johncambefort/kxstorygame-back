#!/bin/sh
set -o errexit

bundle install

bundle exec rails assets:precompile
bundle exec rails assets:clean

# Clean stale pid file
rm -f tmp/pids/server.pid

bundle exec rails s -b 0.0.0.0

