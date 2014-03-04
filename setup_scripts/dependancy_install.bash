#!/bin/bash

sudo apt-get -y install ros-hydro-qt-ros
roscd atlas_sitcams
cd flycapture
tar xvf flycapture2-2.5.3.4-amd64-pkg.tgz
cd flycapture2-2.5.3.4-amd64
sudo apt-get -y -f install
sudo apt-get -y update
sudo apt-get -y install libraw1394-11 libgtk2.0-0 libgtkmm-2.4-dev libglademm-2.4-dev libgtkglextmm-x11-1.2-dev libusb-1.0-0
./install_flycapture.sh
cd ..
rm -r flycapture2-2.5.3.4-amd64
