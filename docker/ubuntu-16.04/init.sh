#!/usr/bin/env bash

# update apt cache and install tools to add repo
sudo apt-get update -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# get docker gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add docker edge repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   edge"

# install docker
sudo apt-get update -y
sudo apt-get install -y docker-ce

# create docker group and add ubuntu user
sudo usermod -aG docker ubuntu

# enable docker start on boot
sudo systemctl enable docker