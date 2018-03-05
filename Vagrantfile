# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provision :shell, inline: "echo start"
  
  # ansible control node
  config.vm.define :control do |control_config|
    control_config.vm.provision :shell, inline: "echo start control"
    control_config.vm.box = "ubuntu/trusty64"
    control_config.vm.hostname = "control"
    control_config.vm.network :private_network, ip: "10.0.17.10"
    control_config.vm.provider "virtualbox" do |v|
      v.memory = 800
      v.cpus = 4
    end
    control_config.vm.provision :shell, path: "boot-control.sh"
  end
  
  # ubuntu clients club#
  (1..2).each do |i|
    config.vm.define "club#{i}" do |client_config|
      client_config.vm.provision :shell, inline: "echo start client ubuntu #{i}"
      client_config.vm.box = "ubuntu/trusty64"
      client_config.vm.hostname = "club#{i}"

      client_config.vm.network :private_network, ip: "10.0.17.2#{i}"
      client_config.vm.provider "virtualbox" do |v|
        v.memory = 800
        v.cpus = 2
      end
    end
  end

  config.vm.provision :shell, inline: "echo complete"

end
