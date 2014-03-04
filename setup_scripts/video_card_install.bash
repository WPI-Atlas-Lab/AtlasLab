#!/bin/bash

sudo apt-get -y update
sudo apt-get -y install linux-headers-generic
sudo apt-get -y install nvidia-current
sudo nvidia-xconfig 
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

