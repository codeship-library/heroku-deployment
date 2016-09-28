# dockercfg Generation Service for Heroku Container Registry

This container allows you to generate a temporary dockercfg using your Heroku credentials and writes it to a specified filename. Typical usage of this image would be to run it with a volume attached, and write the dockercfg to that volume.

In order to export a `dockercfg`, the container needs access to a Docker instance, so
you must mount a docker socket, or provide access to a Docker host in some way.

```bash
$ cat heroku_creds.env
HEROKU_API_KEY=XXXXXXXXXXXXXXXXXXX
$ docker run -it -v ./data:/opt/data --env-file=heroku_creds.env -v /var/run/docker.sock:/var/run/docker.sock codeship/heroku-dockercfg-generator /opt/data/heroku.dockercfg
Logging into AWS ECR
WARNING: login credentials saved in /root/.docker/config.json
Login Succeeded
Writing Docker creds to /opt/data/aws.dockerccfg
$ cat ./data/heroku.dockercfg # file is available locally
```

## Using with Codeship

Codeship supports using custom images to generate dockercfg files during the build process. To use this image to integrate with Heroku Container Registry, simply define an entry in your services file for this image, and reference it from any steps or services which need to interact with the repositories with the `dockercfg_service` field. You'll also need to provide the following environment variables using an [encrypted env file](https://codeship.com/documentation/docker/encryption/):

* HEROKU_API_KEY - Your Heroku API key

Here is an example of using and Heroku Container Registry dockercfg generator to authenticate pushing an image.

```yaml
# codeship-services.yml
app:
  build:
    image: registry.heroku.com/codeship-sample-app/web
    dockerfile_path: ./Dockerfile
heroku_dockercfg:
  image: codeship/heroku-dockercfg-generator
  add_docker: true
  encrypted_env_file: heroku.env.encrypted
```

```yaml
# codeship-steps.yml
- service: app
  type: push
  tag: master
  image_name: registry.heroku.com/codeship-sample-app/web
  registry: regisrty.heroku.com
  dockercfg_service: heroku_dockercfg
```

You can also use this authentication to pull images, by defining the `dockercfg_service` field on groups of steps, or each individual step that pulls or pushes an image, or by adding the field to specific services.
