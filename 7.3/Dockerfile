FROM alpine:3.9

LABEL maintainer="Jorge Arco <jorge.arcoma@gmail.com>"

ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub


RUN apk --update add ca-certificates \
    && echo "@cast https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories \
    && apk add -U \
    # Packages
    tini \
    php7@cast \
    php7-dev@cast \
    php7-common@cast \
    php7-apcu@cast \
    php7-gd@cast \
    php7-xmlreader@cast \
    php7-bcmath@cast \
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
    php7-xsl@cast \
    php7-zip@cast \
    php7-zlib@cast \
    php7-dom@cast \
    php7-redis@cast \
    php7-fpm@cast \
    php7-sodium@cast \
	# Clean up
    && ln -s /usr/bin/php7 /usr/bin/php \
    && rm -rf /var/cache/apk/*

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app
