#!/bin/bash

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list' 
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install ros-hydro-desktop-full
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
sudo sh -c 'echo "deb http://packages.osrfoundation.org/drc/ubuntu precise main" > /etc/apt/sources.list.d/drc-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
wget http://packages.osrfoundation.org/drc.key -O - | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install drcsim-hydro

