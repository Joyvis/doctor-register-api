FROM ruby:2.5.5
MAINTAINER jjs276@gmail.com

ARG RAILS_PORT

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev nodejs

RUN mkdir -p /doctor_register_api
WORKDIR /doctor_register_api

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY . ./

EXPOSE $RAILS_PORT

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
