FROM ruby:2.5-buster

ENV APP_DIR=/opt/app/

WORKDIR $APP_DIR

RUN apt-get update -y && \
apt-get install -y \
ubuntu-dev-tools \
libpq-dev libgsl0-dev \
postgresql-client

COPY Gemfile* $APP_DIR

RUN bundle install

COPY . $APP_DIR

# RUN bundle config --global frozen 1

CMD ["bash", "start.sh"]