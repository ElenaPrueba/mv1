# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.network "forwarded_port", guest: 80,    host: 8080
  config.vm.network "forwarded_port", guest: 8000,  host: 9090
  config.vm.network "forwarded_port", guest: 22,    host: 2222

  config.vm.provision "shell", path: "bootstrap.sh", privileged: false
  config.vm.provision "file", source: "files", destination: "$HOME/files"
  config.vm.provision "shell", path: "services.sh", privileged: false
  config.vm.provision "shell", path: "prepare_project.sh", privileged: false

end
