# syntax=docker/dockerfile:1.2
FROM ruby:3

WORKDIR /app

RUN apt-get update && apt-get install -y \
        postgresql-client \
        imagemagick

ENV RAILS_ENV production

COPY Gemfile /app
COPY Gemfile.lock /app

RUN bundle config --global frozen 1 \
      && bundle install

COPY . /app
COPY --chmod=755 ./docker/entrypoint.sh /usr/bin/entrypoint.sh

EXPOSE 3000
ENTRYPOINT [ "entrypoint.sh" ]
CMD ["puma", "-C", "config/puma.rb"]
