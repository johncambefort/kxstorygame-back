# README

A containerized ruby-on-rails postgresql backend for the kxstorygame app!

# Instructions

```sh
docker compose up -d

# create & seed the development db
docker compose exec kxback rails db:setup RAILS_ENV='development'
```
