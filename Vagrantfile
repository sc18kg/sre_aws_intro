Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "192.168.10.100"
    config.vm.synced_folder "app", "/home/ubuntu/app"
    config.vm.provision "file", source: "~/Desktop/SpartaGlobalWork/sre_aws_intro/provision.sh", destination: "provision.sh"
end