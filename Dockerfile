FROM debian:bullseye
LABEL maintainer='Codeship Inc., <maintainers@codeship.com>'

ENV CACHE_BUST='2023-10-30' \
    PATH="/usr/local/heroku/bin:${PATH}"

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    apt-transport-https \
    bash \
    ca-certificates \
    curl \
    git \
    gnupg \
    sudo \
    wget && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

# Install the Heroku CLI
RUN \
  curl https://cli-assets.heroku.com/install-ubuntu.sh | sh && \
  heroku plugins:install heroku-builds && \
  heroku --version && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

COPY deployment/scripts/ /usr/bin/
