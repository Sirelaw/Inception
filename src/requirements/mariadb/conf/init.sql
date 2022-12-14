USE mysql;
FLUSH PRIVILEGES ;

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASS');

CREATE DATABASE IF NOT EXISTS wp CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS 'owner'@'%' IDENTIFIED BY '$DB_ADMIN_PASS';
-- CREATE USER IF NOT EXISTS 'dev'@'%' IDENTIFIED BY 'devpass';

GRANT ALL PRIVILEGES ON wp.* TO 'owner'@'%' IDENTIFIED BY '$DB_ADMIN_PASS' WITH GRANT OPTION; 
-- GRANT ALL PRIVILEGES ON wp.* TO 'dev'@'%' IDENTIFIED BY 'devpass' WITH GRANT OPTION;

FLUSH PRIVILEGES ;