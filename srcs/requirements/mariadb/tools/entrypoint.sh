#!/bin/sh

set -e

if [ -d /var/lib/mysql/${MARIADB_DATABASE} ] || [ -d /var/lib/mysql/mysql ]; then
	echo "Database already created, skipping..."
else
	mysql_install_db;
	mysql.server start; 

	mysql -e"CREATE DATABASE ${MARIADB_DATABASE}";
	mysql -e"USE ${MARIADB_DATABASE}";
	mysql -e"CREATE USER ${MARIADB_USER}@'%' IDENTIFIED BY '${MARIADB_PASSWORD}'";
	mysql -e"GRANT SELECT,INSERT,UPDATE,DELETE,ALTER,CREATE,DROP,INDEX ON ${MARIADB_DATABASE}.* TO ${MARIADB_USER}@'%'";
	mysql -e"FLUSH PRIVILEGES";

	mysql.server stop;
fi

exec mysqld --bind-address=0.0.0.0;