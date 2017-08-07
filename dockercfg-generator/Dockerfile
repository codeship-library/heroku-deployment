FROM docker:stable
LABEL maintainer maintainers@codeship.com

COPY heroku_docker_creds.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/heroku_docker_creds.sh

ENTRYPOINT ["heroku_docker_creds.sh"]
