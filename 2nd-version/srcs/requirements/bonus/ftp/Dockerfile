FROM debian:bullseye

RUN apt-get update && \
    apt-get install vsftpd -y

COPY tools/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY tools/script.sh .

RUN mkdir -p /var/run/vsftpd/empty && \
    chown root:root /var/run/vsftpd/empty && \
    chmod 755 /var/run/vsftpd/empty

RUN chmod +x script.sh
CMD ["./script.sh"]
