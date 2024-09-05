FROM debian:bullseye

# Install dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl git && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

RUN git clone https://github.com/louislam/uptime-kuma.git /app

COPY tools/script.sh /app/script.sh
RUN chmod +x /app/script.sh

EXPOSE 3001

CMD ["./app/script.sh"]
