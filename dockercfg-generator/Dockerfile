FROM docker:17.05.0
LABEL maintainer='Codeship Inc., <maintainers@codeship.com>'

COPY heroku_docker_creds.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/heroku_docker_creds.sh

ENTRYPOINT ["heroku_docker_creds.sh"]
