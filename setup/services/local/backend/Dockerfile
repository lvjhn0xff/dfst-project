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

# Make project directory.
RUN mkdir -p /home/project

# Export home variable.
ENV HOME="/home/project" 

# Expose PHP-FPM port
EXPOSE 9000

# Entrypoint
CMD ["php-fpm"]