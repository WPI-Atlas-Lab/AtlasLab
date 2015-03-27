#!/bin/bash

cd ~/Downloads
wget -N https://raw.github.com/WPI-Atlas-Lab/AtlasLab/master/flycapture2-2.7.3.19-amd64-pkg.tgz
tar xvf flycapture2-2.7.3.19-amd64-pkg.tgz
cd flycapture2-2.7.3.19-amd64
sudo apt-get -y -f install
sudo apt-get -y update
sudo apt-get -y install libraw1394-11 libgtk2.0-0 libgtkmm-2.4-dev libglademm-2.4-dev libgtkglextmm-x11-1.2-dev libusb-1.0-0
./install_flycapture.sh
cd ..
rm -r flycapture2-2.7.3.19-amd64
