#!/bin/bash
#supervised homeassistant installer by maxe

sudo apt-get update

#Installiert dependencies
sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg \
lsb-release

#Installiert den Offiziellen gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#Setzt das installations image (stable|nightly|test)
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu\
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#erstellt dependencie tree
sudo apt-get update

#installiert docker
sudo apt-get install docker-ce docker-ce-cli containerd.io

#um zu testen ob docker läuft
sudo docker run hello-world
