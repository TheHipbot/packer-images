#!/usr/bin/env bash

# yum install tools to add repo
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# add docker repo
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# install docker
sudo yum update -y
sudo yum install docker-ce -y

# create docker group and add ubuntu user
sudo usermod -aG docker ubuntu

# start docker service and enable on boot
sudo systemctl start docker
sudo systemctl enable docker