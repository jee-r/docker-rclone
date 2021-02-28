# docker-rclone

[![Drone (cloud)](https://img.shields.io/drone/build/jee-r/docker-rclone?&style=flat-square)](https://cloud.drone.io/jee-r/docker-rclone)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/j33r/rclone?style=flat-square)](https://microbadger.com/images/j33r/rclone)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/j33r/rclone?style=flat-square)](https://microbadger.com/images/j33r/rclone)
[![Docker Pulls](https://img.shields.io/docker/pulls/j33r/rclone?style=flat-square)](https://hub.docker.com/r/j33r/rclone)
[![DockerHub](https://shields.io/badge/Dockerhub-j33r/rclone-%232496ED?logo=docker&style=flat-square)](https://hub.docker.com/r/j33r/rclone)

A docker image for [rclone](https://rclone.org) ![rclone's logo](https://rclone.org/img/rclone-32x32.png)

# Supported tags

| Tags | <RESERVED_1> | <RESERVED_2> | Size | Layers |
|-|-|-|-|-|
| `latest`, `stable`, `master` | <RESERVED_1> | <RESERVED_2> | ![](https://img.shields.io/docker/image-size/j33r/rclone/latest?style=flat-square) | ![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/j33r/rclone/latest?style=flat-square) |
| `dev` | <RESERVED_1> | <RESERVED_2> | ![](https://img.shields.io/docker/image-size/j33r/rclone/dev?style=flat-square) | ![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/j33r/rclone/dev?style=flat-square) |

# What is rclone?

From [rclone](https://rcone.org):

> 

Rclone is a command line program to manage files on cloud storage. It is a feature rich alternative to cloud vendors' web storage interfaces. Over 40 cloud storage products support rclone including S3 object stores, business & consumer file storage services, as well as standard transfer protocols.

# How to use these images

```bash
docker run \
    --detach \
    --interactive \
    --name rclone \
    --user $(id -u):$(id -g)
    --env TZ=Europe/Paris
    --volume /etc/localtime:/etc/localtime:ro
    j33r/rclone:latest
```    

## Volume mounts


```bash
docker run \
    --detach \
    --interactive \
    --name rclone \
    --user $(id -u):$(id -g) \
    --volume /path/to/your/<VOLUME>:<VOLUME> \
    j33r/rclone:latest
```

You should create directory before run the container otherwise directories are created by the docker deamon and owned by the root user

## Environment variables

To change the timezone of the container set the `TZ` environment variable. The full list of available options can be found on [Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

You can also set the `HOME` environment variable this is usefull to get in the right directory when you attach a shell in your docker container.


## Docker Compose

[`docker-compose`](https://docs.docker.com/compose/) can help with defining the `docker run` config in a repeatable way rather than ensuring you always pass the same CLI arguments.

Here's an example `docker-compose.yml` config:

```yaml
version: "3"

services:
  rclone:
    image: j33r/rclone:latest    
    user: "${UID:-1000}:${GID:-1000}"
    restart: unless-stopped
    environment:
        - HOME=/app
        - TZ=Europe/Paris
    volumes:
        - /etc/localtime:/etc/localtime:ro
```

# License

This project is under the [GNU Generic Public License v3](https://github.com/jee-r/docker-rclone/blob/master/LICENSE) to allow free use while ensuring it stays open.

# Credits

- Thank's to [Nick Craig-Wood](https://www.craig-wood.com/nick/) for [rclone](https://rclone.org) 
