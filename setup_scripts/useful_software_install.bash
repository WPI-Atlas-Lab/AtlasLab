#!/bin/bash

cd ~/Downloads/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb


sudo apt-get -y install aptitude
sudo apt-get -y install terminator
sudo apt-get -y install qtcreator
sudo apt-get -y install stress
sudo apt-get -y install fping
sudo apt-get -y install iftop 
sudo apt-get -y install lm-sensors 
sudo apt-get -y install vim 
sudo apt-get -y install emacs 
sudo apt-get -y install htop 
sudo apt-get -y install openssh-server
sudo apt-get -y install gimp
sudo apt-get -y install gitg
sudo apt-get -y install gitk



sudo apt-get -y install openjdk-7-jre openjdk-7-jdk
cd ~/Downloads/
wget http://mirrors.ibiblio.org/pub/mirrors/eclipse/technology/epp/downloads/release/luna/R/eclipse-cpp-luna-R-linux-gtk-x86_64.tar.gz
tar xvf eclipse-cpp-luna-R-linux-gtk-x86_64.tar.gz
sudo mv eclipse /opt/
echo '[Desktop Entry]' >> eclipse.desktop
echo 'Name=Eclipse' >> eclipse.desktop
echo 'Type=Application' >> eclipse.desktop
echo 'Exec=/opt/eclipse/eclipse' >> eclipse.desktop
echo 'Terminal=false' >> eclipse.desktop
echo 'Icon=/opt/eclipse/icon.xpm' >> eclipse.desktop
echo 'Comment=Integrated Development Environment' >> eclipse.desktop
echo 'NoDisplay=false' >> eclipse.desktop
echo 'Categories=Development;IDE' >> eclipse.desktop
echo 'Name[en]=Eclipse' >> eclipse.desktop
sudo mv eclipse.desktop /usr/share/applications/eclipse.desktop
cd /usr/local/bin
sudo ln -s /opt/eclipse/eclipse
