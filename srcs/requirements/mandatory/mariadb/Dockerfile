FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    mariadb-server

COPY tools/setup.sh /data/setup.sh
COPY tools/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /data/setup.sh

EXPOSE 3306

CMD ["./data/setup.sh"]
