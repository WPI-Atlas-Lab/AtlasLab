#!/bin/bash
  onlyroot="Do not run this as root."
  
if [ $(whoami) == 'root' ];then
echo -e $COLOR$onlyroot$MONO #"Only root can do this operation."
    #DBG_MSG "exit 5"
    exit 0
fi



sudo rosdep init
rosdep update
source /opt/ros/hydro/setup.bash
sudo apt-get -y install python-rosinstall
mkdir -p ~/drc_workspace/src
cd ~/drc_workspace/src
catkin_init_workspace
cd ~/drc_workspace/
catkin_make
source devel/setup.bash
echo source /opt/ros/hydro/setup.bash >> ~/.bashrc
echo source /usr/share/drcsim/setup.sh >> ~/.bashrc
echo source ~/drc_workspace/devel/setup.bash >> ~/.bashrc
echo export ATLAS_ROBOT_INTERFACE=~/drc_workspace/src/drc/field/atlas_controllers/AtlasRobotInterface >> ~/.bashrc
. ~/.bashrc
cd ~/drc_workspace/src
wstool init
wstool set drc https://github.com/WPI-Atlas-Lab/drc --git
wstool set robotiq --git https://github.com/ros-industrial/robotiq.git
wstool update
