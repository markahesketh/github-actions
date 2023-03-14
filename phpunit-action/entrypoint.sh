#!/bin/sh -l

if [ -n "$GITHUB_TOKEN" ]; then
  echo "Configuring composer with GITHUB_TOKEN"
  composer config github-oauth.github.com $GITHUB_TOKEN
fi
composer install ${INPUT_COMPOSER_INSTALL_ARGUMENTS}

locale-gen ${INPUT_LOCALE}
update-locale LANG=${INPUT_LOCALE}

export APP_ID=${INPUT_TEST_APP_ID}
php ./custom/vendor/bin/phpunit ${INPUT_PHPUNIT_ARGUMENTS}