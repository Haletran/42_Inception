FROM debian:bullseye


RUN apt-get update && apt-get upgrade -y && \
    apt-get install netcat nodejs npm -y

COPY tools/server.sh /app/server.sh
COPY tools/index.html /app/index.html
COPY tools/stack_dance.mp4 /app/stack_dance.mp4

RUN chmod +x /app/server.sh

EXPOSE 8080

CMD ["./app/server.sh"]
