# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise_lxc"
  config.box.url = "http://bit.ly/vagrant-lxc-precise64-2013-10-23"

  config.vm.hostname = "rocksteady.com"

  config.vm.provision :puppet
end
