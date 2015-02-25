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
echo alias drceclipse="'catkin_make --force-cmake -G\"Eclipse CDT4 - Unix Makefiles\" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_ECLIPSE_MAKE_ARGUMENTS=-j8 -C ~/drc_workspace'" >> ~/.bashrc
echo export GAZEBO_PLUGIN_PATH=~/drc_workspace/devel/lib:'${GAZEBO_PLUGIN_PATH}' >> ~/.bashrc
echo export GAZEBO_MODEL_PATH=~/drc_workspace/src/robotiq:'${GAZEBO_MODEL_PATH}' >> ~/.bashrc
echo export PYTHONPATH=~/drc_workspace/src/drc/trajopt/build_trajopt/lib:~/drc_workspace/src/drc/trajopt:'${PYTHONPATH}' >> ~/.bashrc
echo export LD_LIBRARY_PATH='${LD_LIBRARY_PATH}':/usr/lib >> ~/.bashrc
echo export GUROBI_HOME="/opt/gurobi563/linux64" >> ~/.bashrc
echo export OPENRAVE_DATA='${OPENRAVE_DATA}':~/drc_workspace/src/drc/trajopt/ >> ~/.bashrc
echo alias drctrajopt="'cd ~/drc_workspace/src/drc/trajopt/'" >> ~/.bashrc

echo alias drcmake="'catkin_make install -DCMAKE_INSTALL_PREFIX:PATH=~/drc_workspace/install -C ~/drc_workspace -DCMAKE_BUILD_TYPE=Release'" >> ~/.bashrc

echo alias drcinstall="'catkin_make install -DCMAKE_INSTALL_PREFIX:PATH=~/drc_workspace/install -C ~/drc_workspace -DCMAKE_BUILD_TYPE=Release'" >> ~/.bashrc
echo alias atlaslogs="'source ~/drc_workspace/src/drc/wrecs_bringup/scripts/atlas_logs.bash'" >> ~/.bashrc
echo alias atlasdeploy="'source ~/drc_workspace/src/drc/wrecs_bringup/scripts/deploy.bash'" >> ~/.bashrc
echo alias atlasstart="'source ~/drc_workspace/src/drc/wrecs_bringup/scripts/atlas_start.bash'" >> ~/.bashrc
echo alias atlasstop="'source ~/drc_workspace/src/drc/wrecs_bringup/scripts/atlas_stop.bash'" >> ~/.bashrc


. ~/.bashrc
cd ~/drc_workspace/src
wstool init
wstool set drc https://github.com/WPI-Atlas-Lab/drc --git
wstool set robotiq --git https://github.com/ros-industrial/robotiq.git -v hydro-devel
. ~/.bashrc
wstool update
touch ~/drc_workspace/src/robotiq/robotiq_modbus_rtu/CATKIN_IGNORE
touch ~/drc_workspace/src/robotiq/robotiq_modbus_tcp/CATKIN_IGNORE

. ~/.bashrc
cd ~/drc_workspace/
catkin_make install -DCMAKE_INSTALL_PREFIX:PATH=~/drc_workspace/install -C ~/drc_workspace -DCMAKE_BUILD_TYPE=Release
. ~/.bashrc
