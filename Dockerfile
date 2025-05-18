# Stage 1: Build and install Composer dependencies
FROM php:8.1-cli AS vendor

# Install system dependencies and PHP extensions needed for composer install
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
 && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip \
 && rm -rf /var/lib/apt/lists/*

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www

# Copy composer files
COPY composer.json composer.lock ./

# Install PHP dependencies without dev packages
RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist

# Stage 2: Final image with PHP-FPM
FROM php:8.1-fpm

# Install system dependencies for Laravel runtime
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
 && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www

# Copy application source code
COPY . .

# Copy vendor directory from the build stage
COPY --from=vendor /var/www/vendor ./vendor

# Cache config, routes, views for optimized performance
RUN php artisan config:cache \
 && php artisan route:cache \
 && php artisan view:cache

# Set proper permissions for storage and cache
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

EXPOSE 9000

CMD ["php-fpm"]
