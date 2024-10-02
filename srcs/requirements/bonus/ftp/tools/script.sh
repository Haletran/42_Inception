#!/bin/bash

required_vars=("FTP_USER" "FTP_PASS")
for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        echo "Missing required environment variable $var"
        exit 1
    fi
done

if ! cat /etc/passwd | grep "$FTP_USER:" &>/dev/null; then
    echo "Creating user $FTP_USER"
    useradd -m $FTP_USER
fi

echo "$FTP_USER:$FTP_PASS" | chpasswd
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist &>/dev/null

usermod -d /var/www/wordpress $FTP_USER
exec vsftpd /etc/vsftpd/vsftpd.conf
