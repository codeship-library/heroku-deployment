FROM alpine:3.2

RUN apk --update add \
  bash \
  curl \
  ruby \
  ruby-json \
  sudo

RUN wget -O- https://toolbelt.heroku.com/install.sh | sh

ENV PATH /usr/local/heroku/bin:$PATH

ENV JQ_VERSION 1.5
RUN wget -q -O /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-$JQ_VERSION/jq-linux64
RUN chmod 744 /usr/bin/jq

COPY scripts/ /usr/bin/

ONBUILD RUN mkdir /app
ONBUILD WORKDIR /app
ONBUILD COPY . /app
