#!/bin/bash
set -euo pipefail

sudo dnf update -y
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig perl-open cloc
sudo dnf install -y curl wget gnome-tweak-tool mc git zsh vim htop bash-completion vlc util-linux-user gimp patch libpq-devel openssh-askpass

echo "OhMyZSH"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "JRE + JDK 11"
sudo dnf install -y java-11-openjdk.x86_64 java-11-openjdk-devel.x86_64
java -version
javac -version

echo "Media codecs"
# https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade -y --with-optional Multimedia

echo "PIP"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo pip3 install virtualenv
rm -rf get-pip.py

echo "NodeJS"
sudo dnf -y install nodejs

echo "Sublime text"
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-text sublime-merge

echo "SDKMAN"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
sdk install sbt

echo "VSCode"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update -y
sudo dnf install -y code

code --install-extension ms-python.python
code --install-extension ms-vscode.hexeditor
code --install-extension redhat.vscode-yaml
code --install-extension scala-lang.scala

echo "Fonts"
sudo dnf -y copr enable chenxiaolong/ubuntu-fonts 
sudo dnf -y install ubuntu-family-fonts fontconfig-ubuntu ubuntu-font-gsettings
sudo dnf -y install fira-code-fonts # https://github.com/tonsky/FiraCode/wiki/Linux-instructions#manual-installation

echo "PODMAN"
echo 'eugene ALL=(ALL) NOPASSWD: /usr/bin/podman' | sudo EDITOR='tee -a' visudo

echo "Flatpak"
# https://docs.fedoraproject.org/en-US/quick-docs/installing-spotify/
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub com.spotify.Client
sudo flatpak install flathub com.getpostman.Postman

mkdir ~/bin/

echo "Essential gnome plugins:"
echo "https://extensions.gnome.org/extension/15/alternatetab/"
echo "https://extensions.gnome.org/extension/307/dash-to-dock/"