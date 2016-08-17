FROM alpine:3.4

RUN apk update \
    && apk add --no-cache \
    php \
    php5-apcu \
    php5-bcmath \
    php5-ctype \
    php5-curl \
    php5-dom \
    php5-exif \
    php5-gd \
    php5-iconv \
    php5-intl \
    php5-json \
#    php5-libsodium \
#    php5-mbstring \
    php5-mysqli \
    php5-opcache \
    php5-openssl \
    php5-pcntl \
    php5-pdo_mysql \
    php5-pdo_pgsql \
    php5-pdo_sqlite \
    php5-phar \
    php5-posix \
#    php5-session \
    php5-xml \
    php5-xsl \
    php5-zip \
    php5-zlib \
    php5-fpm \
    && rm -rf /var/cache/apk/*

COPY config/php/php.ini /etc/phpconf.d/50-setting.ini
COPY config/php/php-fpm.conf /etc/php/php-fpm.conf

CMD ["/usr/sbin/php-fpm", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app
