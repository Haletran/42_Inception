#!/bin/sh

GREEN='\033[0;32m'
BGREEN='\033[1;32m'
BLUE='\033[0;34m'
BCYAN='\033[1;36m'
NC='\033[0m'

if [ ! -f ../../srcs/.env ]; then
    echo -e $BGREEN"Downloading .env file..."$NC
    curl -o srcs/.env https://raw.githubusercontent.com/Haletran/42_Inception/refs/heads/main/srcs/.env?token=GHSAT0AAAAAACXK7MDA7NQTKUSYKDOGRZN2ZX2TELA
fi

if [ ! -d ./secrets ]; then
    echo -e $BGREEN"Creating secrets folder..."$NC
    mkdir ./secrets
    curl -o ./secrets/credentials.txt https://raw.githubusercontent.com/Haletran/42_Inception/refs/heads/main/secrets/credentials.txt?token=GHSAT0AAAAAACXK7MDASCH3NGCAB3YTWZFMZX2UBAQ
    curl -o ./secrets/db_password.txt https://raw.githubusercontent.com/Haletran/42_Inception/refs/heads/main/secrets/db_password.txt?token=GHSAT0AAAAAACXK7MDAYUE6PSPLT377NL46ZX2UAZQ
    curl -o ./secrets/db_root_password.txt https://raw.githubusercontent.com/Haletran/42_Inception/refs/heads/main/secrets/db_root_password.txt?token=GHSAT0AAAAAACXK7MDBLYBVEZ6HGRFZORTAZX2UBHA
fi

echo -e $BGREEN"Building images..."$NC
