FROM alpine:3.14 as main

LABEL maintainer="Jorge Arco <jorge.arcoma@gmail.com>"

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted gnu-libiconv \
    && apk add -U --no-cache \
    # Packages
    tini \
    php7 \
    php7-amqp \
    php7-dev \
    php7-common \
    php7-apcu \
    php7-gd \
    php7-xmlreader \
    php7-bcmath \
    php7-ctype \
    php7-curl \
    php7-exif \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pcntl \
    php7-pdo \
    php7-mysqlnd \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-phar \
    php7-posix \
    php7-session \
    php7-xml \
    php7-xsl \
    php7-zip \
    php7-zlib \
    php7-dom \
    php7-redis \
    php7-fpm \
    php7-sodium

# iconv hack https://github.com/docker-library/php/issues/240
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app

FROM main as dev

ARG USER=root
ARG PASSWORD=root

ARG COMPOSER_VERSION=1.10.1

RUN apk add -U --no-cache \
        php7-pear \
        openssh \
        supervisor \
        autoconf \
        git \
        curl \
        wget \
        make \
        zip \
        php7-xdebug \
    # Delete APK cache.
    && rm -rf /var/cache/apk/* \
    # Create ssh user for dev.
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && echo "${USER}:${PASSWORD}" | chpasswd \
    && ssh-keygen -A \
    # Download composer.
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
    && composer global require "hirak/prestissimo:0.3.10"

ADD devfs /

RUN HOST_IP="$(/sbin/ip route|awk '/default/ { print $3 }')" \
    && sed -i "$ a\xdebug.remote_host=${HOST_IP}" /etc/php7/conf.d/00_xdebug.ini

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord/conf.d/supervisord.conf"]

EXPOSE 22 9000
