FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nodejs npm -y

COPY tools/setup.sh /app/setup.sh
RUN git clone https://github.com/Haletran/Guess-the-Login /app/website
RUN mkdir /app/website/src/db
COPY conf/db.json /app/website/src/db/all.json
RUN chmod +x /app/setup.sh

EXPOSE 8080

CMD ["./app/setup.sh"]
