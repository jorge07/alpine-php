# Production artifact pipeline

This pipeline its just an example, for a more accurate approach see [here](https://github.com/jorge07/ddd-playground)

## Build environment

I recommend build the artifact in the `jorge07/alpine-php:*-dev` image.

**Dockerfile.build**

    FROM jorge07/alpine-php:7-dev
    
    ENV SYMFONY_ENV prod
    
    COPY app /app/app
    COPY parameters.yml /app/app/config/parameters.yml
    COPY bin /app/bin
    COPY var /app/var
    
    COPY composer.json /app
    COPY composer.lock /app
    
    RUN composer install --no-ansi --no-scripts --no-dev --no-interaction --no-progress --optimize-autoloader
    
    COPY src /app/src
    COPY web /app/web
    
    RUN php /app/bin/console c:w

#### Important

To optimize build times using [Docker cache](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#/build-cache) I recommend add the src folders at the end of the *Dockerfile* after run `composer` and or `npm`.

    RUN composer install --no-ansi --no-scripts --no-dev --no-interaction --no-progress --optimize-autoloader
    
    COPY src /app/src
    COPY web /app/web

## Build Artifact

**Build image**

    docker build -t build-${RELEASE} -f Dockerfile.test .

**Up container**

    docker run -d --name build-container-${RELEASE} build-${RELEASE}

**Extract artifact**

    docker cp build-container-${RELEASE}:/app artifacts/${RELEASE}/

**Clean environment**

    docker kill build-container-${RELEASE}
    docker rmi build-build-${RELEASE}


## The production image

Extend Image. Add you PHP configuration and copy the entire artifact.

*Dockerfile.prod*

    FROM jorge07/alpine-php:7

    COPY config/php/php.ini /etc/php7/conf.d/50-setting.ini
    COPY config/php/php-fpm.conf /etc/php7/php-fpm.conf
    
    ENV SYMFONY_ENV prod
    
    COPY app/app /app/app
    COPY fpm/parameters.yml /app/app/config/parameters.yml
    COPY app/bin /app/bin
    COPY app/var /app/var
    COPY app/web /app/web
    COPY app/src /app/src
    COPY app/vendor /app/vendor
    
    RUN php /app/bin/console c:w

**Build and Store final production image**

    docker build -t prod-${RELEASE} -f Dockerfile.prod artifacts/${RELEASE}/
    
    docker login -u USER -p PASS
    
    docker push prod-${RELEASE}
