FROM php:8.0-alpine

RUN apk add --update \
    git

RUN wget https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.16.2/php-cs-fixer.phar -O php-cs-fixer \
    && chmod a+x php-cs-fixer \
    && mv php-cs-fixer /usr/local/bin/php-cs-fixer

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
