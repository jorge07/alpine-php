FROM alpine:edge

LABEL maintainer "Jorge Arco <jorge.arcoma@gmail.com>"

RUN echo "@edge-main http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "@edge-testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && wget -O /etc/apk/keys/diego@hernandev.com-58b4c2e0.rsa.pub http://php.codecasts.rocks/php-alpine.pub \
    && echo "@cast http://php.codecasts.rocks/7.1" >> /etc/apk/repositories \

    && apk add -U \

    tini \
    php7@edge-testing \
    php7-dev@edge-testing \
    php7-common@edge-testing \
    php7-apcu@cast \
    php7-bcmath@edge-testing \
    php7-xmlwriter@edge-testing \
    php7-ctype@edge-testing \
    php7-curl@edge-testing \
    php7-exif@edge-testing \
    php7-iconv@edge-testing \
    php7-intl@edge-testing \
    php7-json@edge-testing \
    php7-mbstring@edge-testing \
    php7-opcache@edge-testing \
    php7-openssl@edge-testing \
    php7-pcntl@edge-testing \
    php7-pdo@edge-testing \
    php7-mysqlnd@edge-testing \
    php7-pdo_mysql@edge-testing \
    php7-pdo_pgsql@edge-testing \
    php7-phar@edge-testing \
    php7-posix@edge-testing \
    php7-session@edge-testing \
    php7-xml@edge-testing \
    php7-mcrypt@edge-testing \
    php7-xsl@edge-testing \
    php7-zip@edge-testing \
    php7-zlib@edge-testing \
    php7-dom@edge-testing \
    php7-redis@edge-testing \
    php7-fpm@edge-testing \

    && rm -rf /var/cache/apk/*

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app
