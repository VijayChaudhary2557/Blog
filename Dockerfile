# Stage 1: Dependencies
FROM composer:2 AS vendor

WORKDIR /var/www

COPY composer.json composer.lock ./

RUN composer diagnose
RUN composer check-platform-reqs
RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist -vvv

# Stage 2: PHP runtime
FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
 && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www

COPY . .

COPY --from=vendor /var/www/vendor ./vendor

RUN php artisan key:generate
RUN php artisan config:cache
RUN php artisan route:cache
RUN php artisan view:cache

RUN chown -R www-data:www-data storage bootstrap/cache

EXPOSE 9000

CMD ["php-fpm"]
