#!/bin/sh

set -e
if [ ! -f /etc/nginx/ssl/certificate.crt ]; then
	echo "certificate.crt not present generating certificate..."
	openssl req -newkey rsa:4096 -sha256 -x509 -days 365 -nodes \
		-out /etc/nginx/ssl/certificate.crt \
		-keyout /etc/nginx/ssl/certificate.key \
		-subj "/CN=vkrajcov.42.fr";
fi

exec nginx -g "daemon off;"