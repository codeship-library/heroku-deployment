FROM debian:latest

RUN apt-get update && apt-get install -y \
  bash \
  curl \
  ruby \
  sudo \
  wget

# Install the Heroku Toolbelt and and add it to the PATH
RUN wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
ENV PATH /usr/local/heroku/bin:$PATH

# RUN heroku status to install the latest version of the Heroku Toolbelt
RUN heroku status

# Clean the apt cache after Heroku Toolbelt installation
RUN apt-get clean

# Install JQ
ENV JQ_VERSION 1.5
RUN wget -q -O /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-$JQ_VERSION/jq-linux64
RUN chmod 744 /usr/bin/jq

COPY scripts/ /usr/bin/
