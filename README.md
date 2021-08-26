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
## Steps to be completed in order.
```
nano provision.sh

enter the commands which you would like to be completed when running vagrant up

nano Vagrantfile

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "192.168.10.100"
    config.vm.provision "file", source: "~/Desktop/SpartaGlobalWork/sre_aws_intro/provision.sh", destination: "provision.sh"
    config.vm.provision "shell", inline: "chmod +x provision.sh", run: "always"
    config.vm.provision "shell", inline: "./provision.sh", run: "always"
end

close and save the file

vagrant up