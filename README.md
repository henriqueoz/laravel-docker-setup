# Laravel Docker Setup

Personal Docker setup for Laravel development (and to help my bad memory).

## Create Laravel project

Create the docker file

```bash
cp compose.dev.yml compose.yml
```

Entering the php container:

```bash
docker compose run --rm --interactive php bash
```

Setup base project:

```bash
composer create-project laravel/laravel app
```

Move everything to root folder

```bash
mv app/* .
mv app/.* .
rmdir app

Basic laravel setup:

```bash
php artisan key:generate
php artisan migrate
```

After creating everything you can up everything normally:

```bash
docker compose up -d
```
