#!/bin/bash

FTP_USER=ftp
FTP_PASS=1234

mkdir -p /var/www/html/
if ! id -u ftp &>/dev/null; then
    adduser ftp --disabled-password
fi

echo "$FTP_USER:$FTP_PASS" | chpasswd
chown -R $FTP_USER:$FTP_USER /var/www/html/
echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

vsftpd /etc/vsftpd/vsftpd.conf
