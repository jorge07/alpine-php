FROM --platform=$BUILDPLATFORM alpine:edge as main

LABEL maintainer="Jorge Arco <jorge.arcoma@gmail.com>"

RUN apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/main add \
    icu-libs \
    && apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/community add \
    # Current packages don't exist in other repositories
    libavif \
    gnu-libiconv \
    # Packages
    tini \
    php83 \
    php83-dev \
    php83-common \
    php83-gd \
    php83-xmlreader \
    php83-bcmath \
    php83-ctype \
    php83-curl \
    php83-exif \
    php83-iconv \
    php83-intl \
    php83-mbstring \
    php83-opcache \
    php83-openssl \
    php83-pcntl \
    php83-phar \
    php83-session \
    php83-xml \
    php83-xsl \
    php83-zip \
    php83-zlib \
    php83-dom \
    php83-fpm \
    php83-sodium \
    php83-tokenizer \
    # Iconv Fix
    php83-pecl-apcu \
    && ln -sf /usr/bin/php83 /usr/bin/php

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm83", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app

FROM --platform=$BUILDPLATFORM main as dev

ARG USER=root
ARG PASSWORD=root

ARG COMPOSER_VERSION=2.5.1

RUN apk add -U --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/   \
        php83-pear \
        openssh \
        supervisor \
        autoconf \
        git \
        curl \
        wget \
        make \
        zip \
        php83-xdebug \
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
