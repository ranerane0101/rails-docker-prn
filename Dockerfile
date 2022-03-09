FROM ruby:2.6.3

ENV RAILS_ENV=production

ENV LANG C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y build-essential \
            libpq-dev \
            nodejs

RUN mkdir /app
RUN mkdir /app/src

ENV APP_ROOT /app/src
WORKDIR $APP_ROOT

ADD ./src $APP_ROOT

RUN bundle config --local set path 'vendor/bundle' \ && bundle install

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]