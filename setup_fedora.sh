#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo dnf update -y
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig 
sudo dnf install -y curl wget gnome-tweak-tool mc git zsh vim htop bash-completion vlc arc-theme util-linux-user gimp

echo "Postgres"
sudo dnf install -y postgresql postgresql-server # install client/server
sudo postgresql-setup initdb                     # initialize PG cluster
sudo systemctl start postgresql                  # start cluster
sudo systemctl enable postgresql 
echo "https://stackoverflow.com/questions/7695962/postgresql-password-authentication-failed-for-user-postgres"

echo "Flatpak"
# https://docs.fedoraproject.org/en-US/quick-docs/installing-spotify/
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub com.spotify.Client
sudo flatpak install -y flathub io.dbeaver.DBeaverCommunity
sudo flatpak install flathub com.getpostman.Postman
sudo flatpak install -y --from https://flathub.org/repo/appstream/com.skype.Client.flatpakref

echo "JRE + JDK 11"
sudo dnf install -y java-11-openjdk.x86_64 java-11-openjdk-devel.x86_64
java -version
javac -version

echo "Media codecs"
# https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade -y --with-optional Multimedia

echo "Python 3"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo pip3 install virtualenv
rm -rf get-pip.py

echo "OhMyZSH"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install NodeJS"
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
sudo dnf install -y nodejs

echo "Sublime text"
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-text sublime-merge

echo "SBT"
curl https://bintray.com/sbt/rpm/rpm > bintray-sbt-rpm.repo
sudo mv bintray-sbt-rpm.repo /etc/yum.repos.d/
sudo yum install -y sbt

echo "VSCode"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update -y
sudo dnf install -y code

echo "Fonts"
sudo dnf install -y cabextract xorg-x11-font-utils fontconfig
sudo rpm -i -y https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm # http://mscorefonts2.sourceforge.net/
sudo dnf install -y dnf install fira-code-fonts
echo "Download the Ubuntu Font Family: https://design.ubuntu.com/font/"

echo "NTFS mount"
sudo echo "\nUUID=<> /media/fs auto rw,user,auto 0 0" >> /etc/fstab
sudo blkid
sudo subl /etc/fstab
sudo mkdir /media/fs
sudo chown eugene:eugene /media/fs
sudo chmod +rw /media/fs
echo "Check your config: sudo mount /media/fs"

mkdir -p Documents/venvs
mkdir -p Documents/work
mkdir -p Documents/tmp

echo "Essential gnome plugins:"
echo "https://extensions.gnome.org/extension/15/alternatetab/"
echo "https://extensions.gnome.org/extension/1503/tray-icons/"
echo "https://extensions.gnome.org/extension/307/dash-to-dock/"
echo "https://extensions.gnome.org/extension/1267/no-title-bar/"
