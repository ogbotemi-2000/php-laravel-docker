FROM php:7.4-fpm-alpine

RUN apk update && apk add --no-cache git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV PATH="$PATH:/usr/local/bin"

WORKDIR /var/www/html/

COPY . /var/www/html
COPY composer.json composer.lock ./


ENV COMPOSER_ALLOW_SUPERUSER 1

# RUN composer install --no-dev --optimize-autoloader --no-interaction

COPY . .

RUN chmod +x artisan
RUN chown -R www-data:www-data /var/www/html/storage

# RUN composer dump-autoload --optimize && composer run-script post-install-cmd

RUN composer --version


CMD ["php", "-S", "0.0.0.0:8080"]