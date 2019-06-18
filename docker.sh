#!/bin/bash

#Installed with Vagrant 2.2.4
#Installs docker, terraform and ansible on ubuntu 18 bionic
#Uncomment the version of terraform needed before running 

#remove docker if needed 
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update -y

echo "installing docker dependencies"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo "adding gpg key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "verifying fingerprint"
sudo apt-key fingerprint 0EBFCD88

echo "adding docker repo"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sleep 2

echo "updating"
sudo apt-get update -y
echo "installing docker"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sleep 2

#add user to docker group to avoid typing sudo docker
sudo usermod -aG docker $USER 

sleep 2

#Install link for docker-machine
#https://docs.docker.com/machine/install-machine/
#base=https://github.com/docker/machine/releases/download/v0.16.0 &&
#  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
#  sudo install /tmp/docker-machine /usr/local/bin/docker-machine

#Install docker compose and add executable
#sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose


#link to versions https://releases.hashicorp.com/terraform/

sudo apt-get update

sudo apt-get install unzip

#move to $PATH
cd /usr/local/bin

#Uncomment version that is needed verify if desired version will work for your needs
#version 12.0 has many differences 

sudo wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip

#wget https://releases.hashicorp.com/terraform/0.11.9/terraform_0.11.9_linux_amd64.zip

#wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip

#wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip

#wget https://releases.hashicorp.com/terraform/0.11.12/terraform_0.11.12_linux_amd64.zip

#wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip

#wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip

#wget https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip

sudo unzip terraform*

sudo rm -rf terraform_*

sleep 2

sudo su

sleep 1

#adds repo to sources.list
echo deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main >> /etc/apt/sources.list

sudo apt-get update

sudo apt-get install -y ansible

#reboot
sudo reboot now
