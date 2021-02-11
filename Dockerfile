ARG ALPINE_VERSION=3.7

FROM alpine:${ALPINE_VERSION} as base

# Default env values
ENV PHP_FPM_PORT=9000 PHP_FPM_HOST=localhost

# Add nginx and setup
RUN apk --no-cache add nginx gettext
COPY nginx.conf.template /etc/nginx/nginx.conf.template
RUN mkdir /run/nginx

WORKDIR /srv/www

# Setup entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Custom entrypoint for variable substitution
ENTRYPOINT ["docker-entrypoint.sh"]

# Container port
EXPOSE 80

# Default command to start our container with
CMD ["nginx"]
