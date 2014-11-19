#!/bin/bash

sudo apt-get install -y libopenscenegraph-dev cmake libboost-all-dev libeigen3-dev python-numpy python3.2-dev
sudo add-apt-repository -y ppa:openrave/testing
sudo apt-get -y update
sudo apt-get install -y openrave
sudo apt-get -y update


# cd ~/drc_workspace/src
# wstool set trajopt https://github.com/WPI-Atlas-Lab/drc-trajopt.git --git 
# wstool update trajopt

