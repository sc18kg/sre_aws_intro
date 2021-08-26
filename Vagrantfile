Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "192.168.10.100"
    config.vm.provision "file", source: "~/Desktop/SpartaGlobalWork/sre_aws_intro/provision.sh", destination: "provision.sh"
    config.vm.provision "shell", inline: "chmod +x provision.sh", run: "always"
    config.vm.provision "shell", inline: "./provision.sh", run: "always"
end