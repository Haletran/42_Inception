#!/bin/bash

# setup wp by cli

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

sleep 10
mkdir -p /var/www/wordpress

cat <<EOF > /var/www/wordpress/wp-config.php
<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'bapasqui' );
define( 'DB_PASSWORD', '1234' );
define( 'DB_HOST', '10.11.249.22' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}
require_once ABSPATH . 'wp-settings.php';
EOF

wp core install --url=bapasqui.42.fr --title=BapasquiWebsite --admin_user=bapasqui --admin_password=1234 --admin_email=bapasqui@student.42angouleme.fr --path=/var/www/wordpress --allow-root
wp user create michel michel@example.com --role=author --user_pass=1234 --path=/var/www/wordpress --allow-root

php-fpm8.2 -F
