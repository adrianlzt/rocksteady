# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise_lxc"

  config.vm.hostname = "rocksteady.com"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/'
    puppet.manifest_file = 'init.pp'
    puppet.module_path = 'puppet/modules'
  end

end
