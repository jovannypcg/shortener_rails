FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /shortener
WORKDIR /shortener
ADD Gemfile /shortener/Gemfile
ADD Gemfile.lock /shortener/Gemfile.lock
RUN bundle install
ADD . /shortener
