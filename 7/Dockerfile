FROM alpine:3.4

ENV PHP_VERSION 7

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk --update add \
        zip \
        php${PHP_VERSION} \
        php${PHP_VERSION}-dom \
        php${PHP_VERSION}-ctype \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-fpm \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-intl \
        php${PHP_VERSION}-json \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-mcrypt \
        php${PHP_VERSION}-mysqlnd \
        php${PHP_VERSION}-apcu \
        php${PHP_VERSION}-opcache \
        php${PHP_VERSION}-pdo \
        php${PHP_VERSION}-pdo_mysql \
        php${PHP_VERSION}-posix \
        php${PHP_VERSION}-session \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-iconv \
        php${PHP_VERSION}-phar \
        php${PHP_VERSION}-openssl \
    && rm -rf /var/cache/apk/*

COPY config/php/php.ini /etc/php${PHP_VERSION}/conf.d/50-setting.ini
COPY config/php/php-fpm.conf /etc/php${PHP_VERSION}/php-fpm.conf

ENTRYPOINT ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app
