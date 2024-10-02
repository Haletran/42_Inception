#!/bin/bash

required_vars=("SQL_ROOT_PASS" "SQL_DATABASE_NAME" "SQL_USER" "SQL_PASSWORD")
for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        echo "Missing required environment variable $var";
        exit 1;
    fi
done

service mariadb start

# mise en place de la base de données
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE_NAME\`;
CREATE USER IF NOT EXISTS \`$SQL_USER\`@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$SQL_DATABASE_NAME\`.* TO \`$SQL_USER\`@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASS';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"$SQL_ROOT_PASS" shutdown

exec mysqld_safe
