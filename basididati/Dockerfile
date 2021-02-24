FROM php:apache

# Install Postgre PDO
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql
