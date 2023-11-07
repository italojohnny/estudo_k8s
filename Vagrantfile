# -*- mode: ruby -*-
# vi: set ft=ruby :


$IMAGE = "debian/bookworm64"
$NAME = "k8s"
$IP = "192.168.100."
$ID = 80
$INTERFACE = ""
$PUBKEY = ""


Vagrant.configure("2") do |config|
  (0..3).each do |i|
    name = (i == 0) ? "#{$NAME}master" : "#{$NAME}#{i}"
    id = $ID + i
    ip = "#{$IP}#{id}"

    config.vm.define "#{name}" do |node|

      node.vm.box = $IMAGE
      node.vm.hostname = name
      node.vm.network "public_network", ip: "#{ip}", bridge: "#{$INTERFACE}"

      node.vm.provider "virtualbox" do |vb|
        vb.name = name
        vb.gui = false
        vb.memory = "2048"
        vb.cpus = "2"
      end

      node.vm.provision "file", source: $PUBKEY, destination: "/home/vagrant/.ssh/host.pub"
      node.vm.provision "shell", inline: <<-SHELL
        cat /home/vagrant/.ssh/host.pub >> /home/vagrant/.ssh/authorized_keys
      SHELL

    end
  end
end
