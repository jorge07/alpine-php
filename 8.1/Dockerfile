FROM --platform=$BUILDPLATFORM alpine:3.19 AS main

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

RUN apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.19/main add \
    icu-libs \
    && apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.19/community add \
    libavif \
    gnu-libiconv \
    tini \
    php81 \
    php81-dev \
    php81-common \
    php81-gd \
    php81-xmlreader \
    php81-bcmath \
    php81-ctype \
    php81-curl \
    php81-exif \
    php81-fileinfo \
    php81-iconv \
    php81-intl \
    php81-mbstring \
    php81-opcache \
    php81-openssl \
    php81-pcntl \
    php81-phar \
    php81-session \
    php81-xml \
    php81-xsl \
    php81-zip \
    php81-zlib \
    php81-dom \
    php81-fpm \
    php81-sodium \
    php81-tokenizer \
    php81-pdo \
    php81-pdo_mysql \
    php81-pdo_pgsql \
    php81-simplexml \
    php81-pecl-apcu \
    && ln -sf /usr/bin/php81 /usr/bin/php

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

HEALTHCHECK --interval=10s --timeout=3s --start-period=10s --retries=3 \
    CMD /usr/sbin/php-fpm81 -t 2>&1 | grep -q "test is successful" || exit 1

CMD ["/usr/sbin/php-fpm81", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app

FROM --platform=$BUILDPLATFORM main AS dev

ARG USER=root
ARG PASSWORD=root

ARG COMPOSER_VERSION=2.9.5

RUN apk add -U --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.19/community/ \
        php81-pear \
        php81-xdebug \
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
