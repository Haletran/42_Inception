FROM debian:bookworm

RUN apt-get update

COPY tools/script.sh .
RUN chmod +x script.sh

CMD ["./script.sh"]
