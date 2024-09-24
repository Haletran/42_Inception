#!/bin/bash

FTP_USER="ftpuser"
FTP_PASS="1234"

if ! cat /etc/passwd | grep "$FTP_USER:" &>/dev/null; then
    echo "Creating user $FTP_USER"
    useradd -m $FTP_USER
fi

echo "$FTP_USER:$FTP_PASS" | chpasswd
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist &>/dev/null

usermod -d /var/www/wordpress $FTP_USER
exec vsftpd /etc/vsftpd/vsftpd.conf
