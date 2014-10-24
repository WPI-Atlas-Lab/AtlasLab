#!/bin/bash
  onlyroot="Do not run this as root."
  
if [ $(whoami) == 'root' ];then
    echo -e  $COLOR$onlyroot$MONO       #"Only root can do this operation."
    #DBG_MSG  "exit 5"
    exit 0
fi

cd ~/Downloads 
wget https://raw.github.com/WPI-Atlas-Lab/AtlasLab/openrave/setup_scripts/openrave_install.bash 
sudo chmod +x openrave_install.bash 
./openrave_install.bash

cd ~/Downloads 
wget https://raw.github.com/WPI-Atlas-Lab/AtlasLab/openrave/setup_scripts/openrave_setup.bash
sudo chmod +x openrave_setup.bash 
./openrave_setup.bash