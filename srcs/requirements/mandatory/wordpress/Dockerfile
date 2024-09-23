FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && \
    apt-get install php7.3 curl wget php-fpm php-mysql mariadb-client -y

# RUN mkdir -p /var/www/html/ && \
#     chown -R www-data:www-data /var/www/html

# RUN curl -LO https://wordpress.org/latest.tar.gz && \
#     tar -xzf latest.tar.gz && \
#     rm latest.tar.gz && \
#     mv wordpress/* /var/www/html/

# RUN cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

RUN wget https://fr.wordpress.org/wordpress-6.6-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.6-fr_FR.tar.gz && rm wordpress-6.6-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf


COPY tools/setup.sh /var/www/
RUN chmod +x /var/www/setup.sh

EXPOSE 9000

CMD ["./var/www/setup.sh"]
