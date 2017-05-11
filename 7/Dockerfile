FROM alpine:3.5

LABEL maintainer "Jorge Arco <jorge.arcoma@gmail.com>"

RUN echo "@main http://dl-cdn.alpinelinux.org/alpine/v3.5/main" >> /etc/apk/repositories \
    && echo "@community http://dl-cdn.alpinelinux.org/alpine/v3.5/community" >> /etc/apk/repositories \
    && echo "@cast http://php.codecasts.rocks/7.0" >> /etc/apk/repositories \
    && apk add -U \

    tini \
    php7@community \
    php7-dev@community \
    php7-apcu@community \
    php7-bcmath@community \
    php7-ctype@community \
    php7-curl@community \
    php7-exif@community \
    php7-iconv@community \
    php7-intl@community \
    php7-json@community \
    php7-mbstring@community \
    php7-opcache@community \
    php7-openssl@community \
    php7-pcntl@community \
    php7-pdo_mysql@community \
    php7-pdo_pgsql@community \
    php7-pdo_sqlite@community \
    php7-phar@community \
    php7-posix@community \
    php7-session@community \
    php7-xml@community \
    php7-mcrypt@community \
    php7-xsl@community \
    php7-zip@community \
    php7-zlib@community \
    php7-fpm@community \
    php7-redis@community \
    php7-tokenizer@community \

    && ln -s /usr/bin/php7 /usr/bin/php \
    && rm -rf /var/cache/apk/*

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app
