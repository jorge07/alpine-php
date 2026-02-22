FROM --platform=$BUILDPLATFORM alpine:3.20 AS main

ARG BUILD_DATE
ARG VCS_REF

LABEL org.opencontainers.image.authors="Jorge Arco <jorge.arcoma@gmail.com>" \
      org.opencontainers.image.source="https://github.com/jorge07/alpine-php" \
      org.opencontainers.image.title="jorge07/alpine-php" \
      org.opencontainers.image.description="Lightweight PHP-FPM Docker images based on Alpine Linux" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.url="https://hub.docker.com/r/jorge07/alpine-php" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.revision="${VCS_REF}"

RUN apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.20/main add \
    icu-libs \
    && apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.20/community add \
    libavif \
    gnu-libiconv \
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
    php83-fileinfo \
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
    php83-pdo \
    php83-pdo_mysql \
    php83-pdo_pgsql \
    php83-simplexml \
    php83-pecl-apcu \
    && ln -sf /usr/bin/php83 /usr/bin/php

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

HEALTHCHECK --interval=10s --timeout=3s --start-period=10s --retries=3 \
    CMD /usr/sbin/php-fpm83 -t 2>&1 | grep -q "test is successful" || exit 1

CMD ["/usr/sbin/php-fpm83", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app

FROM --platform=$BUILDPLATFORM main AS dev

ARG USER=root
ARG PASSWORD=root

ARG COMPOSER_VERSION=2.9.5

RUN apk add -U --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.20/community/ \
        php83-pear \
        php83-xdebug \
        openssh \
        supervisor \
        autoconf \
        git \
        curl \
        wget \
        make \
        zip \
    && rm -rf /var/cache/apk/* \
    && echo "${USER}:${PASSWORD}" | chpasswd \
    && ssh-keygen -A \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION}

ADD devfs /

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord/conf.d/supervisord.conf"]

EXPOSE 22 9003
