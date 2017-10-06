#!/bin/sh

set -e

echo 'Heroku Registry dockercfg generator'

: "${HEROKU_API_KEY:?Need to set your HEROKU_API_KEY}"

DOCKER_USERNAME="_" \
DOCKER_PASSWORD="${HEROKU_API_KEY}" \
DOCKER_REGISTRY="registry.heroku.com" \
/bin/docker_creds.sh "${1}"
