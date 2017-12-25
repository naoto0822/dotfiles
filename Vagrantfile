# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :centos do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = "centos"
    centos.vm.network "private_network", ip: "192.168.56.90"
  end

  config.vm.define :ubuntu do |ubuntu|
    ubuntu.vm.box = "ubuntu/trusty64"
    ubuntu.vm.hostname = "ubuntu"
    ubuntu.vm.network "private_network", ip: "192.168.56.91"
  end

  # config.vm.provision "ansible" do |ansible|
    # ansible.limit = "dev"
    # ansible.inventory_path = "./playbook/hosts"
    # ansible.playbook = "./playbook/dev_server.yml"
  # end
end
