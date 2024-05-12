FROM debian:bookworm

RUN apt update
RUN apt install -y nginx openssl

COPY default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]