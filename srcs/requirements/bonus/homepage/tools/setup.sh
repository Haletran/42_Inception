#!/bin/bash

cd /app/homepage
mkdir config
cp src/skeleton/* config/
npm install
npm run build
npm start
