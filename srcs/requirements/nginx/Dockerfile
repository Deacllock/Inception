FROM debian:bullseye

RUN export DEBIAN_FRONTEND="noninteractive" \
	&& apt-get update \
	&& apt-get install -y \
	nginx \
	openssl

COPY ./conf/default.conf /etc/nginx/sites-available/default

RUN mkdir -p /run/nginx \
	/etc/nginx/ssl

COPY tools/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]