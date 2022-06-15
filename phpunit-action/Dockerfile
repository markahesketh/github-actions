FROM php:8.0-alpine

# Install Git, fetch and install Composer
RUN apk update && apk add git \
    && curl -sS https://getcomposer.org/installer | php --install-dir=/usr/local/bin --filename=composer

# Add code file into the container
COPY entrypoint.sh /entrypoint.sh

# Execute code when container starts
ENTRYPOINT ["/entrypoint.sh"]
