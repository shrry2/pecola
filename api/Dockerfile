FROM ruby:3.2.2

ENV APP_HOME /var/app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim

WORKDIR $APP_HOME

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

COPY . .

# Add a script to be executed every time the container starts.
RUN ["chmod", "+x", "bin/entrypoint.sh"]
ENTRYPOINT ["bin/entrypoint.sh"]

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
