FROM php:8.0-alpine

# Install Git, fetch and install Composer
RUN apk update && apk add git openssh-client coreutils \
    && curl https://getcomposer.org/download/2.5.4/composer.phar -o /usr/bin/composer \
    && chmod a+x /usr/bin/composer

# Add code file into the container
COPY entrypoint.sh /entrypoint.sh

# Execute code when container starts
ENTRYPOINT ["/entrypoint.sh"]
