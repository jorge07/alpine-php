FROM alpine:3.14 as main

LABEL maintainer="Jorge Arco <jorge.arcoma@gmail.com>"

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted gnu-libiconv \
    && apk add -U --no-cache \
    # Packages
    tini \
    php8 \
    php8-dev \
    php8-common \
    php8-gd \
    php8-xmlreader \
    php8-bcmath \
    php8-ctype \
    php8-curl \
    php8-exif \
    php8-iconv \
    php8-intl \
    php8-mbstring \
    php8-opcache \
    php8-openssl \
    php8-pcntl \
    php8-phar \
    php8-session \
    php8-xml \
    php8-xsl \
    php8-zip \
    php8-zlib \
    php8-dom \
    php8-fpm \
    php8-sodium \
    # Iconv Fix
    && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted php8-pecl-apcu \
    && ln -s /usr/bin/php8 /usr/bin/php

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm8", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app

FROM main as dev

ARG USER=root
ARG PASSWORD=root

ARG COMPOSER_VERSION=2.0.8

RUN apk add -U --no-cache \
        php8-pear \
        openssh \
        supervisor \
        autoconf \
        git \
        curl \
        wget \
        make \
        zip \
        php8-xdebug \
    # Delete APK cache.
    && rm -rf /var/cache/apk/* \
    # Create ssh user for dev.
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && echo "${USER}:${PASSWORD}" | chpasswd \
    && ssh-keygen -A \
    # Download composer.
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION}

ADD devfs /

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord/conf.d/supervisord.conf"]

EXPOSE 22 9003
