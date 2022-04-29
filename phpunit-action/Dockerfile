FROM php:7.4-alpine

# Install git
RUN apk add --update \
    git

# Add ast extension

# Fetch and install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add code file into the container
COPY entrypoint.sh /entrypoint.sh

# Execute code when container starts
ENTRYPOINT ["/entrypoint.sh"]
