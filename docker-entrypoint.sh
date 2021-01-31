#!/usr/bin/env sh
set -eu

envsubst '${PHP_FPM_HOST} ${PHP_FPM_PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec "$@"
