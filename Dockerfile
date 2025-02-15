FROM php:7.4-fpm-alpine

RUN apk update && apk add --no-cache git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV PATH="$PATH:/usr/local/bin"

WORKDIR /var/www/html/

COPY . /var/www/html

COPY . .

RUN chmod +x artisan
RUN chown -R www-data:www-data /var/www/html/storage

RUN composer dump-autoload --optimize && composer run-script post-install-cmd

CMD ["php", "-S", "0.0.0.0:8080"]