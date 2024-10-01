FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install git iputils-ping curl -y

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

RUN git clone https://github.com/gethomepage/homepage.git /app/homepage

COPY tools/setup.sh /app/setup.sh
COPY tools/services.yaml /app/services.yaml
COPY tools/bookmarks.yaml /app/bookmarks.yaml

RUN chmod +x /app/setup.sh
CMD ["./app/setup.sh"]
