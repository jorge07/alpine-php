# Alpine PHP 

[![Build Status](https://travis-ci.org/jorge07/alpine-php.svg?branch=master)](https://travis-ci.org/jorge07/alpine-php) ![Docker Pulls](https://img.shields.io/docker/pulls/jorge07/alpine-php.svg?style=flat-square)

Minimal PHP Docker images based on Alpine. Contains **tags** for development environments and adapted for various frameworks like [Symfony](http://symfony.com/) and [Wordpress](https://github.com/WordPress/WordPress).

## Documentation

[Read about Documentation and see some examples here](https://github.com/jorge07/alpine-php/tree/master/doc/README.md)

## Images

- [7.4](https://github.com/jorge07/alpine-php/blob/master/7.4/Dockerfile)
- [7.3](https://github.com/jorge07/alpine-php/blob/master/7.3/Dockerfile)
- [7.2](https://github.com/jorge07/alpine-php/blob/master/7.2/Dockerfile)
- [7.1](https://github.com/jorge07/alpine-php/blob/master/7.1/Dockerfile)
- [5.6](https://github.com/jorge07/alpine-php/blob/master/5.6/Dockerfile)

## Usage:

```sh
docker run -d --name dev -p 9000:9000 -p 2323:22 -v $PWD:/app jorge07/alpine-php:7.3-dev
```

> SSH is only for IDE integration to use container as remote interpreter 

## Dev Dockerfiles

Dev images extend the standard ones and add some tools for development and CI like, composer, xdebug, etc...

| General purpose     | Symfony     | Wordpress                                                                   
|---------------------|-------------|-------------------
| [7.4-dev](https://github.com/jorge07/alpine-php/blob/master/7.4/Dockerfile.dev), [7.4-front](https://github.com/jorge07/alpine-php/blob/master/7.4/Dockerfile.front) |  | 
| [7.3-dev](https://github.com/jorge07/alpine-php/blob/master/7.3/Dockerfile.dev), [7.3-front](https://github.com/jorge07/alpine-php/blob/master/7.3/Dockerfile.front) |  | 
| [7.2-dev](https://github.com/jorge07/alpine-php/blob/master/7.2/Dockerfile.dev), [7.2-front](https://github.com/jorge07/alpine-php/blob/master/7.2/Dockerfile.front) | [7.2-dev-sf](https://github.com/jorge07/alpine-php/blob/symfony/7.2/Dockerfile.dev), [7.2-front-sf](https://github.com/jorge07/alpine-php/blob/symfony/7.2/Dockerfile.front) | [7.2-dev-wp](https://github.com/jorge07/alpine-php/blob/wordpress/7.2/Dockerfile.dev)
| [7.1-dev](https://github.com/jorge07/alpine-php/blob/master/7.1/Dockerfile.dev), [7.1-front](https://github.com/jorge07/alpine-php/blob/master/7.1/Dockerfile.front) | [7.1-dev-sf](https://github.com/jorge07/alpine-php/blob/symfony/7.1/Dockerfile.dev), [7.1-front-sf](https://github.com/jorge07/alpine-php/blob/symfony/7.1/Dockerfile.front) | [7.1-dev-wp](https://github.com/jorge07/alpine-php/blob/wordpress/7.1/Dockerfile.dev)
| [5.6-dev](https://github.com/jorge07/alpine-php/blob/master/5.6/Dockerfile.dev) | [5.6-dev-sf](https://github.com/jorge07/alpine-php/blob/symfony/5.6/Dockerfile.dev) | [5.6-dev-wp](https://github.com/jorge07/alpine-php/blob/wordpress/5.6/Dockerfile.dev)

## Content table

|    Tag     | Parent     |        Content                                                                    | Image Layers
|------------|------------|-----------------------------------------------------------------------------------|---------
| 7.4        |   alpine   | tini, php7.4-cli & fpm                                                            | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.4.svg)](https://microbadger.com/images/jorge07/alpine-php:7.4 "Get your own image badge on microbadger.com")
| 7.4-dev    |    7.4     | + SSH server, xdebug, ant, composer                                               | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.4-dev.svg)](https://microbadger.com/images/jorge07/alpine-php:7.4-dev "Get your own image badge on microbadger.com")
| 7.4-front  |  7.4-dev   | + node6 & npm3 & yarn                                                             | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.4-front.svg)](https://microbadger.com/images/jorge07/alpine-php:7.4-front "Get your own image badge on microbadger.com")
| 7.3        |   alpine   | tini, php7.3-cli & fpm                                                            | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.3.svg)](https://microbadger.com/images/jorge07/alpine-php:7.3 "Get your own image badge on microbadger.com")
| 7.3-dev    |    7.3     | + SSH server, xdebug, ant, composer                                               | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.3-dev.svg)](https://microbadger.com/images/jorge07/alpine-php:7.3-dev "Get your own image badge on microbadger.com")
| 7.3-front  |  7.3-dev   | + node6 & npm3 & yarn                                                             | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.1-front.svg)](https://microbadger.com/images/jorge07/alpine-php:7.3-front "Get your own image badge on microbadger.com")
| 7.2        |   alpine   | tini, php7.2-cli & fpm                                                            | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.2.svg)](https://microbadger.com/images/jorge07/alpine-php:7.2 "Get your own image badge on microbadger.com")
| 7.2-dev    |    7.2     | + SSH server, xdebug, composer                                               | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.2-dev.svg)](https://microbadger.com/images/jorge07/alpine-php:7.2-dev "Get your own image badge on microbadger.com")
| 7.2-dev-sf |   7.2-dev  | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.2-dev-sf.svg)](https://microbadger.com/images/jorge07/alpine-php:7.2-dev-sf "Get your own image badge on microbadger.com")
| 7.2-front  |  7.2-dev   | + node6 & npm3 & yarn                                                             | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.2-front.svg)](https://microbadger.com/images/jorge07/alpine-php:7.2-front "Get your own image badge on microbadger.com")
| 7.1        |   alpine   | tini, php7.1-cli & fpm                                                            | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.1.svg)](https://microbadger.com/images/jorge07/alpine-php:7.1 "Get your own image badge on microbadger.com")
| 7.1-dev    |    7.1     | + SSH server, xdebug, ant, composer                                               | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.1-dev.svg)](https://microbadger.com/images/jorge07/alpine-php:7.1-dev "Get your own image badge on microbadger.com")
| 7-dev-sf   |   7.1-dev  | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.1-dev-sf.svg)](https://microbadger.com/images/jorge07/alpine-php:7.1-dev-sf "Get your own image badge on microbadger.com")
| 7.1-front  |  7.1-dev   | + node6 & npm3 & yarn                                                             | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:7.1-front.svg)](https://microbadger.com/images/jorge07/alpine-php:7.1-front "Get your own image badge on microbadger.com")
| 5.6        |   alpine   | tini, php5.6-cli & fpm                                                            | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:5.6.svg)](https://microbadger.com/images/jorge07/alpine-php:5.6 "Get your own image badge on microbadger.com")
| 5.6-wp     |    5.6     | + upload-volume                                                                   | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:5.6-wp.svg)](https://microbadger.com/images/jorge07/alpine-php:5.6-wp "Get your own image badge on microbadger.com")
| 5.6-dev    |    5.6     | + SSH server, xdebug, ant, composer                                               | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:5.6-dev.svg)](https://microbadger.com/images/jorge07/alpine-php:5.6-dev "Get your own image badge on microbadger.com")
| 5.6-dev-sf |   5.6-dev  | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:5.6-dev-sf.svg)](https://microbadger.com/images/jorge07/alpine-php:5.6-dev-sf "Get your own image badge on microbadger.com")
| 5.6-dev-wp |  5.6-dev   | + wp-cli, wp-autocompletion                                                       | [![](https://images.microbadger.com/badges/image/jorge07/alpine-php:5.6-dev-wp.svg)](https://microbadger.com/images/jorge07/alpine-php:5.6-dev-wp "Get your own image badge on microbadger.com")
