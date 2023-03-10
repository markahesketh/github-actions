#!/bin/sh -l

composer install ${INPUT_COMPOSER_INSTALL_ARGUMENTS}

locale-gen ${INPUT_LOCALE}
update-locale LANG=${INPUT_LOCALE}

export APP_ID=${INPUT_TEST_APP_ID}
php ./custom/vendor/bin/phpunit ${INPUT_PHPUNIT_ARGUMENTS}