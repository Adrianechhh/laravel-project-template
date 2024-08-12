#!/bin/bash
set -e

echo '##########'
echo 'Database configuration script'
echo '##########'
env
echo '##########'

mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD <<-EOSQL
    DROP DATABASE IF EXISTS $MYSQL_DATABASE;
    CREATE DATABASE $MYSQL_DATABASE;
    CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';
EOSQL
