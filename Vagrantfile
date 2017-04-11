Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.network "forwarded_port", guest: 80, host: 48080
  config.vm.network "forwarded_port", guest: 443, host: 48443
  config.vm.network "forwarded_port", guest: 8080, host: 58080
  config.vm.network "forwarded_port", guest: 8443, host: 58080
  config.vm.provision "shell", path: "script.sh", privileged: false
end
