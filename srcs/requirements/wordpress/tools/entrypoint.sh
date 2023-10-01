#!/bin/sh

set -e
if [ ! -f /var/www/html/wp-config.php ]; then
	wp core download --allow-root;
	wp config create --allow-root \
		--dbname=${WORDPRESS_DB_NAME} \
		--dbuser=${WORDPRESS_DB_USER} \
		--dbpass=${WORDPRESS_DB_PASSWORD} \
		--dbhost=${WORDPRESS_DB_HOST} \
		--dbprefix=wp;

	wp core install --allow-root --skip-email \
		--url=${DOMAIN_NAME} \
		--title="${WORDPRESS_TITLE}" \
		--admin_user=${WORDPRESS_ADMIN_LOGIN} \
		--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL};

	wp user create --allow-root \
	${WORDPRESS_USER_LOGIN} \
	${WORDPRESS_USER_EMAIL} \
	--user_pass=${WORDPRESS_USER_PASSWORD};

else
	echo "Wordpress already installed, skipping...";
fi

exec /usr/sbin/php-fpm7.4 -F -R