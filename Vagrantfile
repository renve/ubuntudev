Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  #setting /home/vagrant will not work
  config.vm.synced_folder "data/", "/home/vagrant/data"
  config.vm.hostname = "devbox"
  config.vm.provision "provisioner1", type: "shell", path: "./docker.sh"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
  end
end
