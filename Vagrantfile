# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
BOX_NAME = ENV["BOX_NAME"] || "ubuntu/bionic64"
BOX_MEMORY = ENV["BOX_MEMORY"] || 4000
BOX_CPUS = ENV["BOX_CPUS"] || 4
BOX_HOST = ENV["BOX_HOST"] || "preempt-rt"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = BOX_NAME
  config.vm.host_name = BOX_HOST
  config.disksize.size = '30GB'

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "kernels", "/tmp/kernels"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = BOX_MEMORY
    vb.cpus = BOX_CPUS
  end
  
  config.vm.provision "shell", path: "get-linux-kernel.sh"
end