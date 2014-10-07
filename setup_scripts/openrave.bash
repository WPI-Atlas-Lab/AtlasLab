#!/bin/bash


sudo apt-get install libopenscenegraph-dev cmake libboost-all-dev libeigen3-dev python-numpy
sudo add-apt-repository ppa:openrave/testing
sudo apt-get -y update
sudo apt-get install openrave
sudo apt-get -y update


cd ~/drc_workspace/src
wstool set trajopt https://github.com/WPI-Atlas-Lab/drc-trajopt.git --git 
wstool update trajopt


echo PYTHONPATH="${PYTHONPATH}:~/drc_workspace/src/trajopt/build_trajopt/lib:~/drc_workspace/src/trajopt/src/trajopt" >> ~/.bashrc
echo export PYTHONPATH >> ~/.bashrc
echo export GUROBI_HOME="/opt/gurobi563/linux64">> ~/.bashrc
echo alias drctrajopt="'cd ~/drc_workspace/src/trajopt/'" >> ~/.bashrc
. ~/.bashrc

cd ~/drc_workspace/src/trajopt
mkdir build_trajopt	
cd build_trajopt 
cmake -DBUILD_HUMANOIDS=ON -DBUILD_CLOUDPROC=ON ../
make -j
