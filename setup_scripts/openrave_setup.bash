#!/bin/bash

echo PYTHONPATH="${PYTHONPATH}:~/drc_workspace/src/trajopt/build_trajopt/lib:~/drc_workspace/src/trajopt/src/trajopt" >> ~/.bashrc
echo export PYTHONPATH >> ~/.bashrc
echo export GUROBI_HOME="/opt/gurobi563/linux64">> ~/.bashrc
. ~/.bashrc

cd ~/drc_workspace/src/trajopt
mkdir build_trajopt	
cd build_trajopt 
cmake -DBUILD_HUMANOIDS=ON -DBUILD_CLOUDPROC=ON ../src/trajopt/
make -j
