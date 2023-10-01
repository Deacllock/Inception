FROM debian:bullseye

WORKDIR /var/www/html

RUN export DEBIAN_FRONTEND="noninteractive" \
	&& apt-get update \
	&& apt-get install -y \
	wget \
	php \
	php-fpm \
	php-mysql \
	mariadb-client \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY tools/entrypoint.sh /
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php

ENTRYPOINT ["/entrypoint.sh"]