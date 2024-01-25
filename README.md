Ordering System (OS)
===================

## Docker setup for local development
- This setup is similar to most standard Docker projects or the one you can find on online tutorials.<br>
- Config files for docker can be found in docker folder inside project.<br>
- `dev` script is used as docker-compose helper. 

###Dependencies:
- [docker](https://www.docker.com/) **18.06.0+**
- [docker-compose](https://docs.docker.com/compose/) **1.22.0+**

1. Clone the project
   ```
   git clone https://github.com/mogresta/web-shop-api.git
   ```
2. Add to your `.bashrc` or `.bash_aliases` alias `alias="./dev"`. All references of `dev` script it is assumed you did this step.

3. Run `dev up`. This command will run `docker-compose up --build --no-recreate -d` which will build containers and run project.

4. More useful commands can be found by running `dev info`.

## Import development database

Prerequisite:
- start project `dev up`
- OPTION 1: migrate and execute `bin/console doctrine:fixtures:load` to generate fake data
- OPTION 2: import database from the dump in `docker/configuration/mysql`

## Project setup:

Install php8 dependencies:

- dev php8
- composer install
- exit

Copy environment variables:

- copy .env to .env.local (`cp -a ./.env ./.env.local`)
