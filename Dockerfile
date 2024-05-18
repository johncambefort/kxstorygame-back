FROM ruby:3.3.1-alpine

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \ 
      gcompat \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      openssl \
      pkgconfig \
      postgresql-dev \
      postgresql-client \
      tzdata \
      bash

RUN gem install bundler -v 2.5.10

COPY Gemfile Gemfile.lock ./

WORKDIR /app
COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

