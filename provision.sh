#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y 
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo apt-get install python-software-properties -y
curl -sL https://nodesource.com/setup_6.x | sudo -E bash -
#inside app folder
sudo npm install pm2 -g
npm install
npm start

