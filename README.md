# Alpine-php

|   Tag   | Parent |        Content               |
|---------|--------|------------------------------|
| 7       | alpine | tini, php7-cli & fpm         |
| 7-dev   |   7    |  + SSH server, ant, composer |
| 7-front | 7-dev  |   + node6 & npm3 & yarn      |
| 5.6     | alpine | tini, php5.6-cli & fpm       |
| 5.6-dev |  5.6   |  + SSH server, ant, composer |


Use the ENV variables to change the *USER* and *PASSWORD* for ssh and *COMPOSER_VERSION* to select an specific version. 

## To run the dev environment:

     docker run -it -d -v $PWD:/app -p 2244:22 -p 9000:9000 jorge07/alpine-php:7-dev

Use the **debuger** with PHPStorm (or whatever IDE) via **[remote connexion via SSH Credentials](https://confluence.jetbrains.com/display/PhpStorm/Working+with+Remote+PHP+Interpreters+in+PhpStorm)**:

     u: root 
     p: root

 - Binary on: /usr/bin/php

 - Xdebug on: /usr/lib/php7/modules/xdebug.so
 
 - Add your **Path mapping** from your workspace folder to the /app folder inside the container.
 

## Xdebug

If you want to [debug php script commands](https://confluence.jetbrains.com/display/PhpStorm/Debugging+PHP+CLI+scripts+with+PhpStorm) (I.E: php bin/console something) with Your IDE (PHPStorm in this case):
 
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
          environment:
            - PHP_IDE_CONFIG=serverName=SomeName


## For prod:

*Dockerfile*

    FROM jorge07/alpine-php:7
