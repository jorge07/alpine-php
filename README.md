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


Documentation
-------------

[Read the Documentation](https://github.com/jorge07/alpine-php/tree/master/doc/README.md)
