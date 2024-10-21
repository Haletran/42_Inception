#!/bin/sh

CREDENTIAL_LINK="https://pastebin.com/raw/A6aH6Awe"
DB_PASSWORD_LINK="https://pastebin.com/raw/igs6QLeK"
DB_ROOT_PASSWORD_LINK="https://pastebin.com/raw/ZQUDNnyZ"
ENV_LINK="https://pastebin.com/raw/pi9jx11G"

GREEN='\033[0;32m'
BRED='\033[1;31m'
BGREEN='\033[1;32m'
BLUE='\033[0;34m'
BCYAN='\033[1;36m'
NC='\033[0m'

if [ ! -f srcs/.env ]; then
    echo -e $BGREEN"Downloading .env file..."$NC
    curl -o srcs/.env $ENV_LINK
fi

if [ ! -d ./secrets ]; then
    echo -e $BGREEN"Creating secrets folder..."$NC
    mkdir ./secrets
    curl -o ./secrets/credentials.txt $CREDENTIAL_LINK
    curl -o ./secrets/db_password.txt $DB_PASSWORD_LINK
    curl -o ./secrets/db_root_password.txt $DB_ROOT_PASSWORD_LINK
fi

sed -i "s/^GLOBAL_IP=\".*\"/GLOBAL_IP=\"$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1 | head -n 1)\"/" srcs/.env

echo -e $BGREEN"Building images..."$NC
