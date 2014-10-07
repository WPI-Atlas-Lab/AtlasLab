#!/bin/bash

echo PYTHONPATH="${PYTHONPATH}:~/drc_workspace/src/trajopt/build_trajopt/lib:~/drc_workspace/src/trajopt/src/trajopt" >> ~/.bashrc
echo export PYTHONPATH >> ~/.bashrc
echo export GUROBI_HOME="/opt/gurobi563/linux64" >> ~/.bashrc
echo export PATH="${PATH}:${GUROBI_HOME}/bin" >> ~/.bashrc
echo export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib >> ~/.bashrc
echo alias drctrajopt="'cd ~/drc_workspace/src/trajopt/'" >> ~/.bashrc
. ~/.bashrc

cd ~/drc_workspace/src/trajopt
mkdir build_trajopt	
cd build_trajopt 
cmake -DBUILD_HUMANOIDS=ON -DBUILD_CLOUDPROC=ON ../
make -j
