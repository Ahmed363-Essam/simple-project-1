# Pull php-apache image 
FROM php:7.3-apache

# use root user
USER root 

# Set working directory to the apache public directory 
WORKDIR /var/www/html

# Copy all files into the apache public directory
COPY . /var/www/html/

# Install the dependencies to run php

RUN echo "deb http://deb.debian.org/debian bullseye main" > /etc/apt/sources.list \
    && echo "deb http://security.debian.org/debian-security bullseye-security main" >> /etc/apt/sources.list \
    && echo "deb http://deb.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list \
    && apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        zip \
        curl \
        unzip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-source delete \
    && rm -rf /var/lib/apt/lists/*

COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf

# Download php composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Switch to non-root user for runtime
USER www-data
