FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx openssl -y

RUN rm -rf /etc/nginx/nginx.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/run/nginx /var/run/php
RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=bapasqui"

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
