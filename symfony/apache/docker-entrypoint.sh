#!/usr/bin/env bash
set -e


if [ "$APPLICATION_ENV" = 'dev' ] || [ "$APPLICATION_ENV" = 'e2e' ]; then
  cat /20-xdebug.ini > /usr/local/etc/php/conf.d/20-xdebug.ini
  phing update-dev
else
  phing update-production
fi

sh /permissions.sh

exec "$@"