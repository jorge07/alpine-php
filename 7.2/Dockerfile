FROM alpine:3.9

LABEL maintainer="Jorge Arco <jorge.arcoma@gmail.com>"


RUN apk --update add ca-certificates \
    && apk add -U \
    # Packages
    tini \
    php7 \
    php7-dev \
    php7-common \
    php7-apcu \
    php7-bcmath \
    php7-ctype \
    php7-curl \
    php7-exif \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pcntl \
    php7-pdo \
    php7-mysqlnd \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-phar \
    php7-posix \
    php7-session \
    php7-xml \
    php7-xsl \
    php7-zip \
    php7-zlib \
    php7-dom \
    php7-redis \
    php7-fpm \
    php7-sodium \
    php7-tokenizer \
    php7-xmlwriter \
    php7-simplexml \
	# Clean up
    && rm -rf /var/cache/apk/*

ADD rootfs /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]

EXPOSE 9000

WORKDIR /app
