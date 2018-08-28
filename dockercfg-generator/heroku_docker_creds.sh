#!/bin/sh

set -e

echo 'Heroku Registry dockercfg generator'

# If $HEROKU_API_KEY value is present, set to $CODESHIP_HEROKU_API_KEY
[[ ! -z "${HEROKU_API_KEY}" ]] && CODESHIP_HEROKU_API_KEY=${HEROKU_API_KEY}
: "${CODESHIP_HEROKU_API_KEY:?Need to set your CODESHIP_HEROKU_API_KEY}"

DOCKER_USERNAME="_" \
DOCKER_PASSWORD="${CODESHIP_HEROKU_API_KEY}" \
DOCKER_REGISTRY="registry.heroku.com" \
/bin/docker_creds.sh "${1}"
