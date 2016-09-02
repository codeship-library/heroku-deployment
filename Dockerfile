FROM debian:jessie
MAINTAINER maintainers@codeship.com

ENV \
  JQ_VERSION="1.5" \
  PATH="/usr/local/heroku/bin:$PATH"

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    bash \
    curl \
    ruby \
    sudo \
    wget && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

# Install the Heroku Toolbelt and and add it to the PATH
RUN \
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh && \
  heroku --version && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

# Install JQ, required for some of the included scripts
RUN \
  wget -q -O /usr/bin/jq "https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64" && \
  chmod 744 /usr/bin/jq

COPY scripts/ /usr/bin/
