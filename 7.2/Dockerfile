FROM alpine:3.7

LABEL maintainer="Jorge Arco <jorge.arcoma@gmail.com>"

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates \
    && echo "@edge-main http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "@edge-community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "@cast https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories \
    && apk add -U \

    tini \
    php7@cast \
    php7-dev@cast \
    php7-common@cast \
    php7-apcu@cast \
    php7-bcmath@cast \
    php7-xmlwriter@cast \
    php7-ctype@cast \
    php7-curl@cast \
    php7-exif@cast \
    php7-iconv@cast \
    php7-intl@cast \
    php7-json@cast \
    php7-mbstring@cast \
    php7-opcache@cast \
    php7-openssl@cast \
    php7-pcntl@cast \
    php7-pdo@cast \
    php7-mysqlnd@cast \
    php7-pdo_mysql@cast \
    php7-pdo_pgsql@cast \
    php7-phar@cast \
    php7-posix@cast \
    php7-session@cast \
    php7-xml@cast \
    php7-simplexml@cast \
    php7-mcrypt@cast \
    php7-xsl@cast \
    php7-zip@cast \
    php7-zlib@cast \
    php7-dom@cast \
    php7-redis@cast \
    php7-fpm@cast \
    php7-tokenizer@cast \

    && ln -s /usr/bin/php7 /usr/bin/php \
    && rm -rf /var/cache/apk/*

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app
