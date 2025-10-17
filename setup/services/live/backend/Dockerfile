# Specify arguments
ARG PHP_FPM_VERSION=php:8.3-fpm-alpine
ARG COMPOSER_TAG=2.8.12

# Load composer
FROM composer:$COMPOSER_TAG AS composer-stage

# Install system utilities for PHP-FPM
FROM $PHP_FPM_VERSION

RUN apk add --no-cache \
        bash \
        git \
        unzip \
        curl \
        libzip-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        libwebp-dev \
        freetype-dev \
        icu-dev \
        postgresql-dev \
    && docker-php-ext-install \
        pdo \
        pdo_pgsql \
        zip \
        bcmath \
        gd \
        intl \
        opcache \
        pcntl \
    && docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype


RUN apk add ca-certificates;

# Add composer from local image
COPY --from=composer-stage /usr/bin/composer /usr/bin/composer

# Install Laravel installer globally
RUN composer global require laravel/installer

# Add composer global vendor bin to PATH
ENV PATH="$PATH:/root/.composer/vendor/bin"

# Expose PHP-FPM port
EXPOSE 9000

# Copy project source.
COPY --chown=www-data:www-data \
    ./source/backend \
    /home/project/source

# Copy www.conf 
COPY --chown=www-data:www-data \
    /setup/services/live/backend/www.conf \
    /usr/local/etc/php-fpm.d/www.conf

# Copy clear-config.sh 
COPY --chown=www-data:www-data \
    ./setup/services/live/backend/clear-config.sh \
    /home/project/clear-config.sh

# Make home project directory.
RUN mkdir -p /home/project/base 

# Set home directory.
RUN HOME=/home/project/base

# Entrypoint
CMD ["php-fpm"]