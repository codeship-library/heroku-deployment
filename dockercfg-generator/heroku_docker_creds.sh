#!/bin/sh

set -e

echo 'Heroku Registry dockercfg generator'

: "${HEROKU_API_KEY:?Need to set HEROKU_API_KEY}"

# fetching Heroku Docker login
echo "Logging into Heroku Container Registry"
docker login --username=_ --password="${HEROKU_API_KEY}" registry.heroku.com

# writing aws docker creds to desired path
echo "Writing Docker creds to $1"
chmod 544 ~/.docker/config.json
cp ~/.docker/config.json $1
