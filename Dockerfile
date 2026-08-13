FROM php:8.5-fpm

ARG UID=1000
ARG GID=1000

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath intl gd opcache

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN groupadd -g ${GID} web \
    && useradd -u ${UID} -m -s /bin/bash -g web web

RUN mkdir -p /home/web/.composer

WORKDIR /var/www/html

RUN chown -R web:web /var/www

USER web

ENTRYPOINT ["php-fpm", "-F"]

