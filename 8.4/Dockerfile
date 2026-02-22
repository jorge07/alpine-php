# PHP 8.4 — uses alpine:edge until php84 lands in a stable Alpine release.
# TODO: pin to alpine:3.22 (or next stable) once available.
FROM --platform=$BUILDPLATFORM alpine:edge AS main

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

RUN apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/main add \
    icu-libs \
    && apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/community add \
    libavif \
    gnu-libiconv \
    tini \
    php84 \
    php84-dev \
    php84-common \
    php84-gd \
    php84-xmlreader \
    php84-bcmath \
    php84-ctype \
    php84-curl \
    php84-exif \
    php84-fileinfo \
    php84-iconv \
    php84-intl \
    php84-mbstring \
    php84-opcache \
    php84-openssl \
    php84-pcntl \
    php84-phar \
    php84-session \
    php84-xml \
    php84-xsl \
    php84-zip \
    php84-zlib \
    php84-dom \
    php84-fpm \
    php84-sodium \
    php84-tokenizer \
    php84-pdo \
    php84-pdo_mysql \
    php84-pdo_pgsql \
    php84-simplexml \
    php84-pecl-apcu \
    && ln -sf /usr/bin/php84 /usr/bin/php

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

HEALTHCHECK --interval=10s --timeout=3s --start-period=10s --retries=3 \
    CMD /usr/sbin/php-fpm84 -t 2>&1 | grep -q "test is successful" || exit 1

CMD ["/usr/sbin/php-fpm84", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app

FROM --platform=$BUILDPLATFORM main AS dev

ARG USER=root
ARG PASSWORD=root

ARG COMPOSER_VERSION=2.9.5

RUN apk add -U --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        php84-pear \
        php84-xdebug \
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
