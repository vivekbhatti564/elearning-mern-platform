#!/bin/bash

echo "Starting MongoDB..."
sudo service mongod start

echo "Starting Backend..."
cd ~/elearning-mern-platform/backend
npm install
nohup node server.js &

echo "Starting Frontend..."
cd ~/elearning-mern-platform/frontend
npm install
npm run build
serve -s build
