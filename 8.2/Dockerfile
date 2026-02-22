FROM --platform=$BUILDPLATFORM alpine:3.21 AS main

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

RUN apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.21/main add \
    icu-libs \
    && apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.21/community add \
    # Current packages don't exist in other repositories
    libavif \
    gnu-libiconv \
    # Packages
    tini \
    php82 \
    php82-dev \
    php82-common \
    php82-gd \
    php82-xmlreader \
    php82-bcmath \
    php82-ctype \
    php82-curl \
    php82-exif \
    php82-fileinfo \
    php82-iconv \
    php82-intl \
    php82-mbstring \
    php82-opcache \
    php82-openssl \
    php82-pcntl \
    php82-phar \
    php82-session \
    php82-xml \
    php82-xsl \
    php82-zip \
    php82-zlib \
    php82-dom \
    php82-fpm \
    php82-sodium \
    php82-tokenizer \
    php82-pdo \
    php82-pdo_mysql \
    php82-pdo_pgsql \
    php82-simplexml \
    # Iconv Fix
    php82-pecl-apcu \
    && ln -sf /usr/bin/php82 /usr/bin/php

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

HEALTHCHECK --interval=10s --timeout=3s --start-period=10s --retries=3 \
    CMD /usr/sbin/php-fpm82 -t 2>&1 | grep -q "test is successful" || exit 1

CMD ["/usr/sbin/php-fpm82", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app

FROM --platform=$BUILDPLATFORM main AS dev

ARG USER=root
ARG PASSWORD=root

ARG COMPOSER_VERSION=2.9.5

RUN apk add -U --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.21/community/ \
        php82-pear \
        openssh \
        supervisor \
        autoconf \
        git \
        curl \
        wget \
        make \
        zip \
        php82-xdebug \
    # Delete APK cache.
    && rm -rf /var/cache/apk/* \
    # Create ssh user for dev.
    && echo "${USER}:${PASSWORD}" | chpasswd \
    && ssh-keygen -A \
    # Download composer.
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION}

ADD devfs /

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord/conf.d/supervisord.conf"]

EXPOSE 22 9003
