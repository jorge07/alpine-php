# Alpine-php

This images contains an alpine linux distro with fpm for producion, and several tools for developement like:

    - Composer
    - PHPUnit
    - Ant

Use the ENV variables to change the *USER* and *PASSWORD* for ssh and *COMPOSER_VERSION* to select an specific version. 

### To run the dev environment:

     docker run -it -d -v $PWD:/app -p 2244:22 -p 9000:9000 jorge07/alpine-php:7-dev

Use PHPStorm (or whatever IDE) **remote connexion via SSH Credentials**:

     u: root 
     p: root

Binary on: /usr/bin/php

Xdebug on: /usr/lib/php7/modules/xdebug.so
 
Add your **Path mapping** to your workspace folder to the /app folder inside the container.
 
###Using docker Compose

    version: '2'
    services:
      fpm:
          image: jorge07/alpine-php:7-dev
          ports:
            - "2244:22"
            - "9000:9000"
          volumes:
            - "$PWD:/app"


###To prod:

*Dockerfile*

    FROM jorge07/alpine-php:7
