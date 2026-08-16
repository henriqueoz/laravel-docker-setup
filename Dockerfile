FROM php:8.5-fpm

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    iputils-ping \
    procps \
    iproute2 \
    dnsutils \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg

RUN docker-php-ext-install \
    pdo_pgsql \
    mbstring \
    exif \
    pcntl \
    bcmath \
    intl \
    gd

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN pecl install redis && docker-php-ext-enable redis

RUN mkdir -p /home/web/.composer

WORKDIR /var/www/html/

ENTRYPOINT ["php-fpm", "-F"]

