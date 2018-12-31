FROM ruby:2.5.3-alpine3.8
LABEL maintainer="hello@danriley.me"

RUN apk add --no-cache --update build-base \
                                linux-headers \
                                git \
                                postgresql-dev \
                                postgresql-client \
                                imagemagick \
                                nodejs \
                                tzdata
# Minimal requirements to run a Rails app
RUN mkdir /app
WORKDIR /app

ADD Gemfile* /app/
RUN bundle config --global frozen 1 \
  && BUNDLE_FORCE_RUBY_PLATFORM=1 bundle install -j4 --retry 3 \
  # Remove unneeded files (cached *.gem, *.o, *.c)
  && rm -rf /usr/local/bundle/cache/*.gem \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

COPY . /app

RUN chmod +x docker/run.sh
RUN chmod +x docker/wait-for
RUN chmod +x docker/docker-entrypoint.sh

EXPOSE 50051
EXPOSE 3000