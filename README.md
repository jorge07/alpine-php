# Alpine-php
To run the environment:

     docker run -it -v $PWD:/app -p 2244:22 -p 9000:9000 jorge07/alpine-php:7
 
Using docker Compose

    version: '2'
    service:
      fpm:
          image: jorge07/alpine-php:7
          ports:
            - 2244:22
            - 9000:9000
          volumes:
            - $PWD:/app
