# Laravel Docker Setup

Personal Docker setup for Laravel development (and to help my bad memory).

This setup expects Laravel >=13 and PHP >=8.5.

## Create Laravel project

Remove existing git from template:

```bash
rm -rf .git
```

Create the docker file

```bash
cp compose.dev.yml compose.yml
```

Entering the php container:

```bash
docker compose run --rm -it --entrypoint /bin/bash php
```

Setup base project:

```bash
composer create-project laravel/laravel src
```

Moving everything from src to the root folder:

```bash
mv src/* .
mv src/.* .
rmdir src
```

Basic laravel setup:

```bash
php artisan key:generate
php artisan migrate
```

After creating everything you can up everything normally:

```bash
docker compose up -d
```
