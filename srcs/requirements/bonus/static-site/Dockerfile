FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nodejs npm -y

COPY tools/setup.sh /app/setup.sh
RUN git clone https://github.com/Haletran/Guess-the-Login /app/website
RUN mkdir /app/website/src/db
COPY conf/all.json /app/website/src/db/all.json
COPY conf/2023.json /app/website/src/db/2023.json
COPY conf/2024.json /app/website/src/db/2024.json
RUN chmod +x /app/setup.sh

EXPOSE 8080

CMD ["./app/setup.sh"]
