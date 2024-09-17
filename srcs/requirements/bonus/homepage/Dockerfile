FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nodejs npm git iputils-ping -y

RUN git clone https://github.com/gethomepage/homepage.git /app/homepage

COPY tools/setup.sh /app/setup.sh
COPY tools/services.yaml /app/services.yaml
COPY tools/bookmarks.yaml /app/bookmarks.yaml

RUN chmod +x /app/setup.sh

CMD ["./app/setup.sh"]
