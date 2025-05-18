# Stage 1: Build and install Composer dependencies
FROM composer:2 AS vendor

WORKDIR /var/www

# Copy only composer files to leverage Docker cache
COPY composer.json composer.lock ./

# Install PHP dependencies (no dev for production)
RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist


# Stage 2: Final image with PHP-FPM
FROM php:8.1-fpm

# System dependencies for Laravel
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
 && rm -rf /var/lib/apt/lists/*

# PHP extensions required by Laravel
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Set working directory
WORKDIR /var/www

# Copy application code (excluding vendor)
COPY . .

# Copy vendor directory from the build stage
COPY --from=vendor /var/www/vendor ./vendor

# Generate optimized autoload files and clear caches
RUN php artisan config:cache \
 && php artisan route:cache \
 && php artisan view:cache

# Ensure storage and bootstrap cache are writable
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Expose PHP-FPM port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
