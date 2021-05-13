FROM alpine:3.11 as main

LABEL maintainer="Jorge Arco <jorge.arcoma@gmail.com>"

ADD https://packages.whatwedo.ch/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates \
    && echo "@cast https://packages.whatwedo.ch/php-alpine/v3.11/php-7.3" >> /etc/apk/repositories \
    && apk add -U \
    # Packages
    tini \
    php7@cast \
    php7-amqp@cast \
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
    && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted gnu-libiconv \
	# Clean up
    && ln -s /usr/bin/php7 /usr/bin/php \
    && rm -rf /var/cache/apk/*
# iconv hack https://github.com/docker-library/php/issues/240
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app

FROM main as dev

ARG USER=root
ARG PASSWORD=root

ARG COMPOSER_VERSION=1.10.1

RUN apk add -U --no-cache \
        php7-pear \
        openssh \
        supervisor \
        autoconf \
        git \
        curl \
        wget \
        make \
        zip \
        php7-xdebug@cast \

    && rm -rf /var/cache/apk/* \

    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && echo "${USER}:${PASSWORD}" | chpasswd \
    && ssh-keygen -A \

    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
    && composer global require "hirak/prestissimo:0.3.10"

ADD devfs /

RUN HOST_IP="$(/sbin/ip route|awk '/default/ { print $3 }')" \
    && sed -i "$ a\xdebug.remote_host=${HOST_IP}" /etc/php7/conf.d/00_xdebug.ini

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor/conf.d/supervisord.conf"]

EXPOSE 22 9000
