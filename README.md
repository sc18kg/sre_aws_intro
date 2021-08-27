# SRE INTRO
## Cloud Computing with AWS
### SDLC Stages
#### Monitoring
##### Risk Factors with SDLC Stages

# Key Advantages

* Ease of Use
* Flexibility
* Robustness
* Cost

**SRE Intro**
- What is the role of SRE?
Continually defining reliability goals and working to improve the service, SRE bridge the gap between developers and IT operations to create software that improves the reliability of systems in production, solving problems and responding to incidents.


**Cloud Computing**
## What is Cloud Computing and the benefits of using it?
 - Cloud computing is on-demand availablity of computer system resources. The advantages of this is cost effectiveness, Flexibility, Ease of USe and Robustness.

## On Premisies Server or Cloud?
 - Have to invest capital upfront to purchase and replace equipment, land and personell to have the server running. If you migraate to cloud no worries for networking and security and will pay only for the use. This is flexible and cost effective scaling to the demand needed. A simple subscription fee and resources that are used fee is what is payed to the cloud provider. If on premisises goes down, you potentially lose all data which isn't backed up. On cloud it is easily available wherever you are located or any device you are on.
![CLOUDVONPREM](https://www.ebcgroup.co.uk/wp-content/uploads/2020/05/On_Premise_Vs_Cloud.png)

## Hybrid and GovCloud
 - Banks use hybrid cloud infrastructure, all data which is confidential is stored in their own data centre which is not in cloud so they are responsible for the data. They are happy to foot the cost due to the sensitivity of data. AWS created GOV cloud which can only be accessed and purchased by government officials. NASA use AWS but many still use Hybrid
![HYBRIDCLOUD](https://www.cloudplan.net/webcontent/img/blog/HybridCloud.png)

## MultiCloud
 - Data is available as backups in different clouds which means if one server goes down, you are able to still access the information from another provider.
![MULTI](http://www.xorlogics.com/wp-content/uploads/2019/11/Screenshot-2019-11-23-at-14.34.27.png)

**What is Amazon Web Services (AWS)?**
## What is AWS and benefits of using it?
 - AWS is an Amazon owned online cloud computing web service that provides customers with a variety of infrastructure as service, platform as service and packaged software as service. You are given access to hardware which is ran on their servers.


**What is SDLC and states of SDLC?**
## What is SDLC and what are the stages of it?

 - Business Requirements - LOW
 - Design and Develop - LOW
 - Testing - LOW/MEDIUM
 - Build - MEDIUM
 - Deploy - HIGH
 - Live Monitoring - HIGH


**What are the Risk level at each stage of SDLC?**
- Low
- Medium
- High

![SDLCIMAGE](https://bigwater.consulting/wp-content/uploads/2019/04/SDLC_BWC.png)

**Provisioning Files Using Vagrant**
## What is Provisioning
- Provisioning files is a systems management process that creates a new virtual machine on a server. You are are to use a file such as a Vagrantfile which allows a user to set up provisions and pass these to a new VM prior to loading.
 
## Steps to be completed in order.
```
nano provision.sh

enter the commands which you would like to be completed when running vagrant up

nano Vagrantfile

Vagrant.configure("2") do |config|
    config.vm.define "db" do |db|
        db.vm.box = "ubuntu/xenial64"
        db.vm.network "private_network", ip: "192.168.10.150"
        db.vm.synced_folder "db", "/home/ubuntu/app"
        db.vm.provision "shell", path: "db/provision.sh"
    end
    config.vm.define "app" do |app|
        app.vm.box = "ubuntu/xenial64"
        app.vm.network "private_network", ip: "192.168.10.100"
        app.vm.synced_folder "app", "/home/ubuntu/app"
        app.vm.provision "shell", path: "provision.sh"
    end
    
end
```
close and save the file

vagrant up

## Running the App

 - Install the dependencies Step by Step
 ```
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
```
- Make sure you navigate to the app directory to run the following
```
cd app
sudo npm install pm2 -g
npm install
npm start
```
## Running the db
 - Install the dependencies Step by Step
 ```
sudo apt-get update -y
sudo apt-get upgrade -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongodb
sudo systemctl status mongodb
sudo systemctl enable mongod
 ```
## Making an Environmental Variable 
- To create an environmental variable you run:
```
export DB_HOST=192.168.10.150:27017/posts
printenv DB_HOST
```
- Making it persistent it needs to be available in .bashrc
```
echo DB_HOST=192.168.10.150:27017/posts >> ~/.bashrc
source ~/.bashrc
```
## Set up nginx as a Reverse Proxy Server
```
sudo nano /etc/nginx/sites-available/default
location / {
    proxy_pass http://localhost:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade
    proxy_set_header Connection 'upgrade;
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
    
}
sudo nginx -t
sudo systemctl restart nginx
```

## Once the two machines are running 
```
sudo nano /etc/mongo.conf
ip 127.0.0.1 change to 0.0.0.0 port: 27017
sudo systemctl restart mongod
sudo systemctl enable mongod
sudo systemctl status mongod

node seeds/seed.js
npm start
```