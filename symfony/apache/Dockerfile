FROM php:7.1-apache

# tools
RUN apt-get update && apt-get install -y git unzip vim curl mc

# system extensions
RUN apt-get install -y libicu-dev libjpeg62-turbo-dev libpng-dev libjpeg-dev libfontconfig-dev libxrender1 locales

# php extensions
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd intl pdo_mysql bcmath
RUN pecl install -o -f xdebug
RUN pear channel-discover pear.phing.info
RUN pear install --alldeps phing/phing

# php configuration
RUN echo memory_limit = 8192M >> /usr/local/etc/php/conf.d/php.ini
RUN echo upload_max_filesize = 1024M >> /usr/local/etc/php/conf.d/php.ini
RUN echo post_max_size = 1024M >> /usr/local/etc/php/conf.d/php.ini

# apache configuration
COPY symfony.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

# locale
RUN echo 'en_US.CP1252 CP1252' >> /etc/locale.gen && \
    echo 'pl_PL.CP1250 CP1250' >> /etc/locale.gen && \
    locale-gen

COPY 20-xdebug.ini /
COPY docker-entrypoint.sh /
COPY permissions.sh /
COPY bashrc /root/.bashrc

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["apache2-foreground"]