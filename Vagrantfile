Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.network "forwarded_port", guest: 80, host: 50080
  config.vm.network "forwarded_port", guest: 443, host: 50443
  config.vm.network "forwarded_port", guest: 8080, host: 58080
  config.vm.network "forwarded_port", guest: 8443, host: 58443
  config.vm.provision "shell", path: "script.sh", privileged: false
  config.vm.provider :virtualbox do |vb|
    vb.name = "Work"
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--vram", "256"]
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
  end
end
