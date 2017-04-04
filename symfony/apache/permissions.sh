#!/usr/bin/env bash

setfacl -R -m g:www-data:rwX /var/www/html/
setfacl -dR -m g:www-data:rwX /var/www/html/
chown www-data:www-data -R /var/www/html/