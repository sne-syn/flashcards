# syntax=docker/dockerfile:1
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /flashcards
COPY Gemfile /flashcards/Gemfile
COPY Gemfile.lock /flashcards/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /flashcards/

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000
