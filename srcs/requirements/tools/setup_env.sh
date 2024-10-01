#!/bin/sh

CREDENTIAL_LINK="https://raw.githubusercontent.com/Haletran/42_Inception/refs/heads/Secrets/secrets/credentials.txt?token=GHSAT0AAAAAACXK7MDASDLDIYX4QLZB3MDMZX4ESQA"
DB_PASSWORD_LINK="https://raw.githubusercontent.com/Haletran/42_Inception/refs/heads/Secrets/secrets/db_password.txt?token=GHSAT0AAAAAACXK7MDBUAVDS5FOQSY4MQ74ZX4ERLA"
DB_ROOT_PASSWORD_LINK="https://raw.githubusercontent.com/Haletran/42_Inception/refs/heads/Secrets/secrets/db_root_password.txt?token=GHSAT0AAAAAACXK7MDATHFQE5S6PSFGCIFAZX4ERSA"
ENV_LINK="https://raw.githubusercontent.com/Haletran/42_Inception/refs/heads/Secrets/srcs/.env?token=GHSAT0AAAAAACXK7MDA3AQFEAVFLBFEFSNMZX4ERZA"

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

echo -e $BGREEN"Building images..."$NC
