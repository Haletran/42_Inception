FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install php7.4 curl wget php7.4-fpm php-mysql mariadb-client php-curl -y

RUN mkdir -p /var/www/html
RUN wget -O /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php;
COPY tools/setup.sh /var/www/html/setup.sh

RUN chmod +x /var/www/html/setup.sh
RUN mkdir -p /run/php
RUN chown www-data:www-data /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["./var/www/html/setup.sh"]
