FROM alpine:3.8

LABEL maintainer="Jorge Arco <jorge.arcoma@gmail.com>"

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates \
    && echo "@edge-main http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "@edge-community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "@cast https://php.codecasts.rocks/v3.8/php-7.2" >> /etc/apk/repositories \
    && apk add -U \
    # Packages
    tini \
    php@cast \
    php-dev@cast \
    php-common@cast \
    php-apcu@cast \
    php-bcmath@cast \
    php-ctype@cast \
    php-curl@cast \
    php-exif@cast \
    php-iconv@cast \
    php-intl@cast \
    php-json@cast \
    php-mbstring@cast \
    php-opcache@cast \
    php-openssl@cast \
    php-pcntl@cast \
    php-pdo@cast \
    php-mysqlnd@cast \
    php-pdo_mysql@cast \
    php-pdo_pgsql@cast \
    php-phar@cast \
    php-posix@cast \
    php-session@cast \
    php-xml@cast \
    php-xsl@cast \
    php-zip@cast \
    php-zlib@cast \
    php-dom@cast \
    php-redis@cast \
    php-fpm@cast \
    php-sodium@cast \
	# Clean up
    && ln -s /usr/bin/php7 /usr/bin/php \
    && rm -rf /var/cache/apk/*

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app
