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
sudo npm install
sudo rm /etc/nginx/sites-available/default
sudo ln -s /home/ubuntu/new_config/default /etc/nginx/sites-available/default
sudo nginx -t
sudo systemctl restart ngninx
echo "DB_HOST=mongodb://192.168.10.150:27017/posts" | sudo tee -a /etc/environment
source /etc/environment


