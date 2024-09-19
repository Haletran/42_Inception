#!/bin/bash

service mariadb start
SQL_DATABASE="wordpress"
SQL_USER="wordpress"
SQL_PASSWORD="1234"
SQL_ROOT_PASSWORD="12345"

# mise en place de la base de données
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;
CREATE USER IF NOT EXISTS \`$SQL_USER\`@'localhost' IDENTIFIED BY '$SQL_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"$SQL_ROOT_PASSWORD" shutdown

exec mysqld_safe
