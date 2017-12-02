# Alpine PHP 
[![Build Status](https://travis-ci.org/jorge07/alpine-php.svg?branch=master)](https://travis-ci.org/jorge07/alpine-php) [![](https://img.shields.io/docker/pulls/jorge07/alpine-php.svg)](https://hub.docker.com/r/jorge07/alpine-php/)

Minimal PHP Docker images based on Alpine. Contains **tags** for development environments and adapted for various frameworks like [Symfony](http://symfony.com/) and [Wordpress](https://github.com/WordPress/WordPress).

[![nodesource/node](http://dockeri.co/image/jorge07/alpine-php)](https://registry.hub.docker.com/u/jorge07/alpine-php/)

## Documentation

[Read about Documentation and see some examples here](https://github.com/jorge07/alpine-php/tree/master/doc/README.md)

## Images

- [7.1](https://github.com/jorge07/alpine-php/blob/master/7.1/Dockerfile)
- [7](https://github.com/jorge07/alpine-php/blob/master/7/Dockerfile)
- [5.6](https://github.com/jorge07/alpine-php/blob/master/5.6/Dockerfile)

## Dev Dockerfiles

Dev images extend the standard ones and add some tools for development and CI like, composer, xdebug, etc...

| General purpose     | Symfony     | Wordpress                                                                   
|---------------------|-------------|-------------------
| [7.1-dev](https://github.com/jorge07/alpine-php/blob/master/7.1/Dockerfile.dev), [7.1-front](https://github.com/jorge07/alpine-php/blob/master/7.1/Dockerfile.front) | [7.1-dev-sf](https://github.com/jorge07/alpine-php/blob/symfony/7.1/Dockerfile.dev), [7.1-front-sf](https://github.com/jorge07/alpine-php/blob/symfony/7.1/Dockerfile.front) | [7.1-dev-wp](https://github.com/jorge07/alpine-php/blob/wordpress/7.1/Dockerfile.dev)
| [7-dev](https://github.com/jorge07/alpine-php/blob/master/7/Dockerfile.dev), [7-front](https://github.com/jorge07/alpine-php/blob/master/7/Dockerfile.front) | [7-dev-sf](https://github.com/jorge07/alpine-php/blob/symfony/7/Dockerfile.dev), [7-front-sf](https://github.com/jorge07/alpine-php/blob/symfony/7/Dockerfile.front) | [7-dev-wp](https://github.com/jorge07/alpine-php/blob/wordpress/7/Dockerfile.dev)
| [5.6-dev](https://github.com/jorge07/alpine-php/blob/master/5.6/Dockerfile.dev) | [5.6-dev-sf](https://github.com/jorge07/alpine-php/blob/symfony/5.6/Dockerfile.dev) | [5.6-dev-wp](https://github.com/jorge07/alpine-php/blob/wordpress/5.6/Dockerfile.dev)

## Usage:

```sh
docker run -d --name dev -p 9000:9000 -p 2323:22 -v $PWD:/app jorge07/alpine-php:7.1-dev
```

## Content table

|    Tag     | Parent     |        Content                                                                    | Image Layers
|------------|------------|-----------------------------------------------------------------------------------|---------
| 7.1        |   alpine   | tini, php7.1-cli & fpm                                                            | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.1.svg)](https://microbadger.com/images/jorge07/alpine-php:7.1 "Get your own image badge on microbadger.com")
| 7.1-dev    |    7.1     | + SSH server, xdebug, ant, composer                                               | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.1-dev.svg)](https://microbadger.com/images/jorge07/alpine-php:7.1-dev "Get your own image badge on microbadger.com")
| 7-dev-sf   |   7.1-dev    | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.1-dev-sf.svg)](https://microbadger.com/images/jorge07/alpine-php:7.1-dev-sf "Get your own image badge on microbadger.com")
| 7.1-front  |  7.1-dev   | + node6 & npm3 & yarn                                                             | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.1-front.svg)](https://microbadger.com/images/jorge07/alpine-php:7.1-front "Get your own image badge on microbadger.com")
| 7          |   alpine   | tini, php7-cli & fpm                                                              | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.svg)](https://microbadger.com/images/jorge07/alpine-php:7 "Get your own image badge on microbadger.com")
| 7-wp       |     7      | + upload-volume                                                                   | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7-wp.svg)](https://microbadger.com/images/jorge07/alpine-php:7-wp "Get your own image badge on microbadger.com")
| 7-dev      |     7      | + SSH server, xdebug, ant, composer                                               | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7-dev.svg)](https://microbadger.com/images/jorge07/alpine-php:7-dev "Get your own image badge on microbadger.com")
| 7-dev-sf   |   7-dev    | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7-dev-sf.svg)](https://microbadger.com/images/jorge07/alpine-php:7-dev-sf "Get your own image badge on microbadger.com")
| 7-dev-wp   |   7-dev    | + wp-cli, wp-autocompletion                                                       | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7-dev-wp.svg)](https://microbadger.com/images/jorge07/alpine-php:7-dev-wp "Get your own image badge on microbadger.com")
| 7-front    |   7-dev    | + node6 & npm3 & yarn                                                             | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7-front.svg)](https://microbadger.com/images/jorge07/alpine-php:7-front "Get your own image badge on microbadger.com")
| 7-front-sf |  7-dev-sf  | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7-front-sf.svg)](https://microbadger.com/images/jorge07/alpine-php:7-front-sf "Get your own image badge on microbadger.com")
| 5.6        |   alpine   | tini, php5.6-cli & fpm                                                            | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:5.6.svg)](https://microbadger.com/images/jorge07/alpine-php:5.6 "Get your own image badge on microbadger.com")
| 5.6-wp     |    5.6     | + upload-volume                                                                   | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:5.6-wp.svg)](https://microbadger.com/images/jorge07/alpine-php:5.6-wp "Get your own image badge on microbadger.com")
| 5.6-dev    |    5.6     | + SSH server, xdebug, ant, composer                                               | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:5.6-dev.svg)](https://microbadger.com/images/jorge07/alpine-php:5.6-dev "Get your own image badge on microbadger.com")
| 5.6-dev-sf |   5.6-dev  | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:5.6-dev-sf.svg)](https://microbadger.com/images/jorge07/alpine-php:5.6-dev-sf "Get your own image badge on microbadger.com")
| 5.6-dev-wp |  5.6-dev   | + wp-cli, wp-autocompletion                                                       | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:5.6-dev-wp.svg)](https://microbadger.com/images/jorge07/alpine-php:5.6-dev-wp "Get your own image badge on microbadger.com")
