#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=baptiste --admin_password=1811 --admin_email=bapasqui@student.42angouleme.fr --allow-root
./wp-cli.phar user create Michel Michel@gmail.com --role=editor --user_pass=815michmich --allow-root
./wp-cli.phar user delete admin --allow-root

php-fpm8.2 -F