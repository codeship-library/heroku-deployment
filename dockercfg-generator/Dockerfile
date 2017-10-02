FROM codeship/dockercfg-generator
LABEL maintainer='Codeship Inc., <maintainers@codeship.com>'

COPY heroku_docker_creds.sh /bin/
RUN chmod u+x /bin/heroku_docker_creds.sh

ENTRYPOINT ["heroku_docker_creds.sh"]
