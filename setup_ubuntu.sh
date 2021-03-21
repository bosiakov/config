#!/bin/bash
set -euo pipefail

sudo apt update
sudo apt upgrade
sudo apt install -y curl wget arc-theme build-essential chrome-gnome-shell gnome-tweak-tool mc git zsh python python3-dev evolution evolution-ews postgresql postgresql-contrib openjdk-11-jdk openjdk-11-jre openjdk-11-source gcc g++ make x11-utils vim vim-gtk3 colordiff gimp htop subversion net-tools

echo "Sublime Text + Merge"

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update && sudo apt install -y sublime-text sublime-merge

echo "ZSH"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "PIP"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo pip3 install virtualenv

echo "Node"
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs && sudo npm install yarn -g

echo "Essential gnome plugins:"
echo "https://extensions.gnome.org/extension/15/alternatetab/"
echo "https://extensions.gnome.org/extension/1267/no-title-bar/"
