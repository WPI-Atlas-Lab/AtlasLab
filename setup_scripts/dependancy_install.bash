#!/bin/bash
sudo apt-get update

sudo apt-get -y install ros-hydro-qt-ros
sudo apt-get -y install ros-hydro-razer-hydra
sudo apt-get -y install ros-hydro-camera-info-manager-py
sudo apt-get -y install libbobcat-dev
sudo apt-get -y install ros-hydro-moveit-ros
sudo apt-get -y install ros-hydro-fcl
sudo apt-get -y install libx264-120
sudo apt-get -y install  ros-hydro-ar-track-alvar
sudo apt-get -y install python-pip
sudo pip install  -U pymodbus

#this is from ros answers, http://answers.ros.org/question/174736/since-updating-ros-a-few-hours-ago-roscatkin-is-broken/
#Once bug is fixed, this line can be removed.
sudo apt-get -y remove ros-hydro-qt-create

sudo apt-get -y install libeigen3-dev libsuitesparse-dev freeglut3-dev libglu-dev libglew-dev libboost-all-dev ros-hydro-libg2o gnuplot

cd ~/Downloads

wget http://www.dropbox.com/s/l0q4oc7yuk00t92/if_g2o_is_missed.zip 

unzip if_g2o_is_missed.zip

sudo mv if_g2o_is_missed/cmake /opt/ros/hydro/share/libg2o/

rm -rf if_g2o_is_missed

rm if_g2o_is_missed.zip
