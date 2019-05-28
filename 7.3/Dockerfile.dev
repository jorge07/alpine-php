FROM jorge07/alpine-php:7.3

ARG USER=root
ARG PASSWORD=root

ARG COMPOSER_VERSION=1.6.3

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
    && composer global require "hirak/prestissimo:0.3.7"

ADD devfs /

RUN HOST_IP="$(/sbin/ip route|awk '/default/ { print $3 }')" \
    && sed -i "$ a\xdebug.remote_host=${HOST_IP}" /etc/php7/conf.d/00_xdebug.ini

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor/conf.d/supervisord.conf"]

EXPOSE 22 9000
