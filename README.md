# Alpine-php
###To run the dev environment:

*SSH*

     u: root 
     p: root

*Run*

     docker run -it -v $PWD:/app -p 2244:22 -p 9000:9000 jorge07/alpine-php:7-dev
 
###Using docker Compose

    version: '2'
    service:
      fpm:
          image: jorge07/alpine-php:7-dev
          ports:
            - 2244:22
            - 9000:9000
          volumes:
            - $PWD:/app

###To prod:

*Dockerfile*

    FROM jorge07/alpine-php:7
