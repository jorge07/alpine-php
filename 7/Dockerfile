FROM alpine:3.4

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --no-cache \
    php7 \
    php7-apcu \
    php7-bcmath \
    php7-ctype \
    php7-curl \
    php7-exif \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-libsodium \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pcntl \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-phar \
    php7-posix \
    php7-session \
    php7-xml \
    php7-xsl \
    php7-zip \
    php7-zlib \
    php7-fpm \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && rm -rf /var/cache/apk/*

COPY config/php/php.ini /etc/php7conf.d/50-setting.ini
COPY config/php/php-fpm.conf /etc/php7/php-fpm.conf

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app
