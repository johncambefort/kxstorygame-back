FROM ruby:3.2.2-alpine

ENV BUNDLER_VERSION=2.4.20

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
      nodejs \
      python3 \
      tzdata \
      bash

RUN gem install bundler -v 2.4.20

COPY Gemfile Gemfile.lock ./

WORKDIR /app
COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

