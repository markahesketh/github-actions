FROM php:8.0-alpine

# Install git and bash
RUN apk add --update autoconf gcc musl-dev make bash git \
    && pecl install ast-1.0.16 \
    && docker-php-ext-enable ast

# Fetch and install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add code file into the container
COPY entrypoint.sh /entrypoint.sh

# Execute code when container starts
ENTRYPOINT ["/entrypoint.sh"]
