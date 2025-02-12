FROM php:7.4-fpm-alpine

RUN apk update && apk add --no-cache git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV PATH="$PATH:/usr/local/bin"

WORKDIR /var/www/html/

# COPY composer.json composer.lock ./
COPY . /var/www/html

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

composer install --no-dev --optimize-autoloader --no-interaction
RUN chown -R www-data:www-data /var/www/html/storage

COPY . .

CMD ["php", "-S", "0.0.0.0:8080"]