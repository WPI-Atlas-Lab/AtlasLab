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
echo export ATLAS_ROBOT_INTERFACE=~/drc_workspace/src/drc/bdi_api/AtlasRobotInterface >> ~/.bashrc
echo export LD_LIBRARY_PATH='${LD_LIBRARY_PATH}':'${ATLAS_ROBOT_INTERFACE}'/lib64 >> ~/.bashrc
echo alias drchome="'cd ~/drc_workspace/src/drc/'" >> ~/.bashrc
echo alias drcmake="'catkin_make -C ~/drc_workspace'" >> ~/.bashrc
echo alias drceclipse="'catkin_make --force-cmake -G\"Eclipse CDT4 - Unix Makefiles\" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_ECLIPSE_MAKE_ARGUMENTS=-j8 -C ~/drc_workspace'" >> ~/.bashrc
echo export GAZEBO_PLUGIN_PATH=~/drc_workspace/devel/lib:'${GAZEBO_PLUGIN_PATH}' >> ~/.bashrc
echo export GAZEBO_MODEL_PATH=~/drc_workspace/src/robotiq:'${GAZEBO_MODEL_PATH}' >> ~/.bashrc

. ~/.bashrc
cd ~/drc_workspace/src
wstool init
wstool set drc https://github.com/WPI-Atlas-Lab/drc --git
wstool set robotiq --git https://github.com/ros-industrial/robotiq.git -v hydro-devel
. ~/.bashrc
wstool update
. ~/.bashrc
cd ~/drc_workspace/
catkin_make
. ~/.bashrc
