#!/bin/bash

cd /app/homepage
mkdir config
cp src/skeleton/* config/
rm config/services.yaml config/bookmarks.yaml
mv ../services.yaml config/
mv ../bookmarks.yaml config/
npm install
npm run build
npm start
