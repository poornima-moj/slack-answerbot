FROM ruby:2.6-alpine

# These are needed to support building native extensions during
# bundle install step
RUN apk --update add --virtual build_deps build-base

# Required at runtime
RUN apk add --no-cache nodejs

# Required by the CircleCI build pipeline
RUN apk add --no-cache git openssh-client bash

RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

WORKDIR /app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . /app

RUN chown -R appuser:appgroup /app

USER 1000

CMD ["rake","deploy:run"]
