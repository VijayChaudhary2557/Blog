# Stage 1: Build dependencies with Composer
FROM composer:2 AS vendor

WORKDIR /var/www

# Copy composer files separately for caching
COPY composer.json composer.lock ./

# Install composer dependencies (no dev for production)
RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist

# Stage 2: PHP-FPM with Laravel requirements
FROM php:8.1-fpm

# Install system dependencies for Laravel & PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl \
 && rm -rf /var/lib/apt/lists/*

# Install PHP extensions needed for Laravel
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Set working directory inside the container
WORKDIR /var/www

# Copy application files except vendor (already installed in stage 1)
COPY . .

# Copy vendor directory from the vendor build stage
COPY --from=vendor /var/www/vendor ./vendor

# Copy environment example and generate app key
RUN cp .env.example .env

# Cache config, routes, and views for better performance
RUN php artisan key:generate \
 && php artisan config:cache \
 && php artisan route:cache \
 && php artisan view:cache

# Fix permissions for storage and cache directories
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM service
CMD ["php-fpm"]
