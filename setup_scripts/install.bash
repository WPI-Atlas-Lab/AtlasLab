#!/bin/bash
  onlyroot="Do not run this as root."
  
if [ $(whoami) == 'root' ];then
    echo -e  $COLOR$onlyroot$MONO       #"Only root can do this operation."
    #DBG_MSG  "exit 5"
    exit 0
fi

cd ~/Downloads
wget https://raw.github.com/WPI-Atlas-Lab/AtlasLab/master/setup_scripts/video_card_install.bash
sudo chmod +x video_card_install.bash
./video_card_install.bash

cd ~/Downloads
wget https://raw.github.com/WPI-Atlas-Lab/AtlasLab/master/setup_scripts/ros_drcsim_install.bash
sudo chmod +x ros_drcsim_install.bash
./ros_drcsim_install.bash

cd ~/Downloads
wget https://raw.github.com/WPI-Atlas-Lab/AtlasLab/master/setup_scripts/workspace_setup.bash
sudo chmod +x workspace_setup.bash
./workspace_setup.bash

cd ~/Downloads
wget https://raw.github.com/WPI-Atlas-Lab/AtlasLab/master/setup_scripts/dependancy_install.bash
sudo chmod +x dependancy_install.bash
./dependancy_install.bash

cd ~/Downloads
wget https://raw.github.com/WPI-Atlas-Lab/AtlasLab/master/setup_scripts/flycapture_install.bash
sudo chmod +x flycapture_install.bash
./flycapture_install.bash

cd ~/Downloads
wget https://raw.github.com/WPI-Atlas-Lab/AtlasLab/master/setup_scripts/useful_software_install.bash
sudo chmod +x useful_software_install.bash
./useful_software_install.bash

cd ~/Downloads
wget https://raw.github.com/WPI-Atlas-Lab/AtlasLab/master/setup_scripts/printer_install.bash
sudo chmod +x printer_install.bash
sudo ./printer_install.bash
