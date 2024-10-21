#!/bin/bash

required_vars=("GLOBAL_IP")
for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        echo "Missing required environment variable $var"
        exit 1
    fi
done

sed -i "s/10.13.248.249/$GLOBAL_IP/g" /etc/nginx/nginx.conf
nginx -g 'daemon off;'
