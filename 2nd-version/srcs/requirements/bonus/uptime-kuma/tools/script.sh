#!/bin/bash

# Install dependencies
cd /app/ && npm run setup

node server/server.js
