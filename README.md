# Anti-fraud monitoring robot

---

### Local installation process

To install and run this project on a local machine follow next steps:

1. Create the .env file:
    ``` sh
    cp .env.example .env
    ````
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
