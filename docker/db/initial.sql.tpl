CREATE DATABASE IF NOT EXISTS `${MYSQL_DATABASE}`;

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '';

GRANT ALL ON `${MYSQL_DATABASE}`.* TO '${MYSQL_USER}'@'%';

flush privileges;
