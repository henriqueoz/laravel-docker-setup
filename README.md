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
docker compose run --rm -it --entrypoint /bin/bash php
```

Setup base project:

```bash
composer create-project laravel/laravel src
```

(Optional) move the files to the root of the project:

If you want to do in this way, remember to change wokring directory and source volume bind in your compose file.

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
