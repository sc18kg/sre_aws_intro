Vagrant.configure("2") do |config|

    config.vm.define "db" do |db|
        db.vm.box = "ubuntu/xenial64"
        db.vm.network "private_network", ip: "192.168.10.150"
        db.vm.synced_folder "db", "/home/ubuntu/app"
        db.vm.synced_folder "new_config", "/home/ubuntu/new_config"
        db.vm.provision "shell", path: "db/provision.sh"
    end
    config.vm.define "app" do |app|
        app.vm.box = "ubuntu/xenial64"
        app.vm.network "private_network", ip: "192.168.10.100"
        app.vm.synced_folder "app", "/home/ubuntu/app"
        app.vm.synced_folder "new_config", "/home/ubuntu/new_config"
        app.vm.provision "shell", path: "provision.sh"
    end
    
end