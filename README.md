# Alpine-php

Minimal PHP containers based on alpine. Contains Tags for development environments and adapted for various frameworks like [Symfony](http://symfony.com/) and [Wordpress](https://github.com/WordPress/WordPress).

## 7 and 5.6 Schemas

![Tree](https://raw.githubusercontent.com/jorge07/alpine-php/master/doc/Untitled%20Diagram.png)

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
| 7-wp       | 7          |                                                                                   |
| 7-dev-wp   | 7-dev      | + wp-cli, wp-autocompletion                                                       |
| 5.6-wp     | 5.6        |                                                                                   |
| 5.6-dev-wp | 5.6-dev    | + wp-cli, wp-autocompletion                                                       |


## Quick start Dev environment:

Run example:

    docker run -itd --name test-php7 -v $PWD:/app -p 2244:22 -p 9000:9000 jorge07/alpine-php:7-dev
    
    docker exec -it test-php7 psysh
    Psy Shell v0.8.1 (PHP 7.0.15 — cli) by Justin Hileman
    >>> new DateTime()
    => DateTime {#170
         +"date": "2017-02-16 11:46:55.000000",
         +"timezone_type": 3,
         +"timezone": "UTC",
       }
    >>> 

## IDE integration

Use the **debuger** with PHPStorm (or whatever IDE) via **[remote connexion via SSH Credentials](https://confluence.jetbrains.com/display/PhpStorm/Working+with+Remote+PHP+Interpreters+in+PhpStorm)**:

###PHPSTORM

- Languages & Frameworks > PHP > Add > Remote...
    - SSH Credentials
        - HOST
            - Docker-machine: 192.168.99.100 ([Recommended](https://github.com/adlogix/docker-machine-nfs))
            - Linux or Docker4{MAc|Windows}: localhost
        - port: 2244
        - user: root
        - pass: root 
        - Executable: /usr/bin/php
    - Path mappings:
        - <Project root> -> /app
#### Steps in detail

##### Credentials

> Use the ARG variables to change the *USER* and *PASSWORD* for ssh and *COMPOSER_VERSION* to select an specific version on the build. 

##### Default Credentials Values:

- user: root 
- pass: root

##### Binary path

- /usr/bin/php

##### Xdebug.so path

- /usr/lib/php{7}/modules/xdebug.so

##### Server mappings

Add your **Path mapping** from your workspace folder to the `/app` folder inside the container.

##### Xdebug

Some times there is more config quiered. If you want to [debug php script commands remotely](https://confluence.jetbrains.com/display/PhpStorm/Debugging+PHP+CLI+scripts+with+PhpStorm) (I.E: php bin/console something) with Your IDE (PHPStorm in this case):
 
 - Set the PHP_IDE_CONFIG environment variable with **serverName=SomeName**
 - where **SomeName** is the name of the server configured in *Settings / Preferences | Languages & Frameworks | PHP | Servers* in the PHPStorm IDE.

## Using docker Compose

    version: '2'
    services:
      fpm:
          image: jorge07/alpine-php:7-dev
          ports:
            - "2244:22"
            - "9000:9000"
          volumes:
            - "$PWD:/app"
          
You can optionally add:

     ...
       fpm:
          environment:
            - PHP_IDE_CONFIG=serverName=SomeName

## Nginx integration

This example is based on a [Symfony](http://symfony.com/) project. 

**etc/dev/nginx/demo.conf**

     server {
         server_name demo.dev www.demo.dev;
         root /app/web;

         location / {
             try_files $uri /app_dev.php$is_args$args;
         }
         
         location ~ ^/(app|app_dev|config)\.php(/|$) {
             
             fastcgi_pass fpm:9000;
             fastcgi_split_path_info ^(.+\.php)(/.*)$;
             include fastcgi_params;
             
             fastcgi_param  SCRIPT_FILENAME  $realpath_root$fastcgi_script_name;
             fastcgi_param DOCUMENT_ROOT $realpath_root;
         }
     }
     
**etc/dev/nginx/Dockerfile**

     FROM nginx:1.11-alpine

     COPY ddd.conf /etc/nginx/conf.d/default.conf

**/etc/dev/dev.yml**

     version: '2'
     services:
       nginx:
         build: etc/dev/nginx/
         depends_on:
           - fpm
         ports:
           - "80:80"
         volumes:
           - "$PWD:/app"

       fpm:
         image: jorge07/alpine-php:7-dev
         ports:
           - "2244:22"
           - "9000:9000"
         volumes:
           - "$PWD:/app"

Up enviroment

     $ docker-compose -f /etc/dev/dev.yml up -d
     
## Real world example

For a real world example have a look at: https://github.com/jorge07/ddd-playground/blob/master/etc/infrastructure/dev/docker-compose.yml

## For prod:

*Dockerfile*

    FROM jorge07/alpine-php:7
