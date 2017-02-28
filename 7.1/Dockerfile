FROM alpine:edge

MAINTAINER Jorge Arco <jorge.arcoma@gmail.com>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --update \
    tini \
    php7.1 \
    php7.1-bcmath \
    php7.1-ctype \
    php7.1-curl \
    php7.1-exif \
    php7.1-iconv \
    php7.1-json \
    php7.1-mysqli \
    php7.1-mbstring \
    php7.1-opcache \
    php7.1-openssl \
    php7.1-pcntl \
    php7.1-pdo_mysql \
    php7.1-pdo_pgsql \
    php7.1-pdo_sqlite \
    php7.1-phar \
    php7.1-posix \
    php7.1-session \
    php7.1-xml \
    php7.1-mcrypt \
    php7.1-xsl \
    php7.1-zip \
    php7.1-zlib \
    php7.1-fpm \
    && rm -rf /var/cache/apk/*

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm7.1", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app
