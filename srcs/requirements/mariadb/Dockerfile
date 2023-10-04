FROM debian:bullseye

RUN export DEBIAN_FRONTEND="noninteractive" \
	&& apt-get update \
	&& apt-get install -y \
	mariadb-server \
	mariadb-client \
	curl \
	&& curl -o /usr/local/bin/mysql.server https://raw.githubusercontent.com/MariaDB/server/10.5/support-files/mysql.server.sh \
	&& chmod +x /usr/local/bin/mysql.server

COPY tools/entrypoint.sh /

RUN mkdir /run/mysqld && chown mysql /run/mysqld

ENTRYPOINT ["/entrypoint.sh"]