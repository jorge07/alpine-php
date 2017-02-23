# Alpine-php

[![Build Status](https://travis-ci.org/jorge07/alpine-php.svg?branch=master)](https://travis-ci.org/jorge07/alpine-php)

Minimal PHP containers based on alpine. Contains Tags for development environments and adapted for various frameworks like [Symfony](http://symfony.com/) and [Wordpress](https://github.com/WordPress/WordPress).

## Quick start Dev environment:

Run example:

    docker run -itd --name php7 -v $PWD:/app -p 2244:22 -p 9000:9000 jorge07/alpine-php:7-dev
    
    docker exec -it php7 psysh
    Psy Shell v0.8.1 (PHP 7.0.15 — cli) by Justin Hileman
    >>> new DateTime()
    => DateTime {#170
         +"date": "2017-02-16 11:46:55.000000",
         +"timezone_type": 3,
         +"timezone": "UTC",
       }
    >>> 


## Content table

|    Tag     | Parent     |        Content                                                                    |
|------------|------------|-----------------------------------------------------------------------------------|
| 7          | alpine     | tini, php7-cli & fpm                                                              |
| 7-dev      |   7        |  + SSH server, ant, composer                                                      |
| 7-front    | 7-dev      |   + node6 & npm3 & yarn                                                           |
| 5.6        | alpine     | tini, php5.6-cli & fpm                                                            |
| 5.6-dev    |  5.6       |  + SSH server, ant, composer                                                      |
| 7-dev-sf   | 7-dev      | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) |
| 7-front-sf | 7-dev-sf   | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) |
| 5.6-dev-sf | 5.6-dev    | + [Symfony aliases](https://github.com/jorge07/alpine-php/blob/symfony/README.md) |
| 7-wp       | 7          | + upload-volume                                                                   |
| 7-dev-wp   | 7-dev      | + wp-cli, wp-autocompletion                                                       |
| 5.6-wp     | 5.6        | + upload-volume                                                                   |
| 5.6-dev-wp | 5.6-dev    | + wp-cli, wp-autocompletion                                                       |

Documentation
-------------

[Read the Documentation](https://github.com/jorge07/alpine-php/tree/master/doc/README.md)
