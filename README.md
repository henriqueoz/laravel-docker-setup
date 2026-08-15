# Laravel Docker Setup

Personal Docker setup for Laravel development (and to help my bad memory).

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
docker compose run --rm --interactive php bash
```

Setup base project:

```bash
composer create-project laravel/laravel src
```

Move everything to root folder (completely optional, but I like it this way. Just remeber to change the `WORKDIR`
in the docker file if you do this):

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
