#!/bin/bash
set -euo pipefail

echo "Essential software"

sudo apt install -y curl wget arc-theme build-essential chrome-gnome-shell gnome-tweak-tool mc git zsh python python3-dev evolution evolution-ews postgresql postgresql-contrib openjdk-11-jdk openjdk-11-jre openjdk-11-source gcc g++ make x11-utils vim vim-gtk3 colordiff gimp htop subversion net-tools

echo "Sublime Text + Merge"

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update && sudo apt install -y sublime-text sublime-merge alacarte

echo "Postman + spotify"
sudo snap install -y postman spotify dbeaver-ce

echo "ZSH"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "PIP"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo pip3 install virtualenv

echo "Node"
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs && sudo npm install yarn -g

echo "Sbt"

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update && sudo apt-get install -y sbt

echo "Docker"

sudo apt install -y docker-ce
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "Essential gnome plugins:"
echo "https://extensions.gnome.org/extension/15/alternatetab/"
echo "https://extensions.gnome.org/extension/1267/no-title-bar/"
