#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y 
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
#inside app folder
cd ../ubuntu/app
sudo npm install pm2 -g
npm install
npm start

