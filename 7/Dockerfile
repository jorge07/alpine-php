FROM alpine:3.4

ENV PHP_VERSION 7

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk --update add \
        openssh \
        supervisor \
        git \
        zip \
        wget \
        curl \
        php${PHP_VERSION} \
        php${PHP_VERSION}-dom \
        php${PHP_VERSION}-ctype \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-fpm \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-intl \
        php${PHP_VERSION}-json \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-mcrypt \
        php${PHP_VERSION}-mysqlnd \
        php${PHP_VERSION}-apcu \
        php${PHP_VERSION}-opcache \
        php${PHP_VERSION}-pdo \
        php${PHP_VERSION}-pdo_mysql \
        php${PHP_VERSION}-posix \
        php${PHP_VERSION}-session \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-iconv \
        php${PHP_VERSION}-phar \
        php${PHP_VERSION}-xdebug \
        php${PHP_VERSION}-openssl \

    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && echo "root:root" | chpasswd \
    && ssh-keygen -A \

    && rm -rf /var/cache/apk/* \

    && curl -sS https://getcomposer.org/installer | php${PHP_VERSION} -- --install-dir=/usr/local/bin --filename=composer \

    && wget https://phar.phpunit.de/phpunit.phar \
    && chmod +x phpunit.phar \
    && mv phpunit.phar /usr/bin/phpunit

COPY config/supervisor/supervisor.conf /etc/supervisor/conf.d/supervisord.conf
COPY config/php/php.ini /etc/php${PHP_VERSION}/conf.d/50-setting.ini
COPY config/php/php-fpm.conf /etc/php${PHP_VERSION}/php-fpm.conf

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor/conf.d/supervisord.conf"]

EXPOSE 22 9000

WORKDIR /app
