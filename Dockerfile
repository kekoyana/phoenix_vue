FROM elixir:1.10.1-alpine

RUN apk add --update --no-cache \
  bash \
  inotify-tools \
  nodejs \
  yarn

RUN mix local.hex --force && \
  mix archive.install hex phx_new 1.4.3 --force && \
  mix local.rebar --force

WORKDIR /app

