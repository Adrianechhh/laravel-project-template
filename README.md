# Laravel template project

This template project includes configured and ready to use **PHP 8.0**, **MySQL 8.0**, **ClickHouse 21.3**, **Nginx**, **Redis** and **RabbitMQ** docker containers and **Laravel 9**
project files, created by `composer create-project laravel/laravel example-app` command. Nothing extra!

## Installation

To install and run this project follow next steps:

1. Create the **.env** file:
    ``` sh
    cp .env.example .env
    ````
    Set your own `GIT_EMAIL`,  `GIT_USER`, `APP_NAME` in the [.env](.env) file. You can also specify the project **name** and **description** at your [composer.json](composer.json).

2. Build containers:
    ``` sh
    docker-compose build
    ```
3. Run the containers and enter the php container:
    ``` sh
    docker-compose up -d && docker-compose exec php bash
    ```
4. Run composer install inside the container:
   ``` sh
   composer install
   ```
5. Run npm install inside the container:
   ``` sh
   npm install
   ```
6. Execute database migrations:
   ``` sh
   php artisan migrate &&
   php artisan clickhouse:migrate
   ```

### RabbitMQ Queue

The RabbitMQ Management panel can be accesed at http://localhost:15672/.
The **user** and **password** are specified in the [.env](.env) file.
If you want yor queues run automatically, use the [docker/php-fpm/supervisor.conf](docker/php-fpm/supervisor.conf) file
and configure the command for your queue. 
Rebuild your docker containers after configuring supervisor or execute next commands inside your PHP container: 
``` sh 
cp /app/docker/php-fpm/supervisor.conf /etc/supervisor/conf.d/supervisor.conf
supervisorctl reread
supervisorctl update
```

Don't forget to set **autostart** to **true** in the [supervisor.conf](docker/php-fpm/supervisor.conf) file.
