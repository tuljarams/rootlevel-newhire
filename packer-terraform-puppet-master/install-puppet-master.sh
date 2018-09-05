#!/bin/bash -x
set -eu -o pipefail

sudo apt-get clean
sudo apt-get update
sudo apt-get upgrade -y

sudo wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo dpkg -i puppetlabs-release-pc1-xenial.deb
sudo apt-get update -y

PKGS="puppetserver"

sudo apt-get install $PKGS -y

sleep 30s

sudo systemctl start puppetserver
sudo systemctl status puppetserver
sudo systemctl enable puppetserver
