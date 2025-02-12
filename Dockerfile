FROM php:7.4-fpm-alpine

RUN apk update && apk add --no-cache git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV PATH="$PATH:/usr/local/bin"

COPY composer.json composer.lock ./
RUN composer install

COPY . .

CMD ["php", "-S", "0.0.0.0:8080"]