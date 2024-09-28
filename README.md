# alpin3/php83-apache

Multiple purpose Apache and PHP image based on Alpine

Image is based on the official [alpine](https://registry.hub.docker.com/u/alpine/) base image

## Docker image size
[![Latest](https://images.microbadger.com/badges/image/alpin3/php7-apache.svg)](https://microbadger.com/images/alpin3/php7-apache 'latest')

## Docker image usage

```
docker run [docker-options] ghcr.io/alpin3/php83-apache
```

## Examples

Typical basic usage:

```
docker run -it alpin3/php83-apache
```

Typical usage in Dockerfile:

```
FROM ghcr.io/alpin3/php83-apache
RUN echo "<?php phpinfo() ?>" > /app/index.php
```

Typical usage:

```
docker run -it --link=somedb:db ghcr.io/alpin3/php83-apache
```

### Todo
- [ ] Check volume and data

