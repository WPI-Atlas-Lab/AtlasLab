#!/bin/bash

echo export PYTHONPATH=~/drc_workspace/src/drc/trajopt/build_trajopt/lib:~/drc_workspace/src/drc/trajopt:'${PYTHONPATH}' >> ~/.bashrc
echo export LD_LIBRARY_PATH='${LD_LIBRARY_PATH}':/usr/lib >> ~/.bashrc
echo export GUROBI_HOME="/opt/gurobi600/linux64" >> ~/.bashrc
echo export OPENRAVE_DATA='${OPENRAVE_DATA}':~/drc_workspace/src/drc/trajopt/ >> ~/.bashrc
echo alias drctrajopt="'cd ~/drc_workspace/src/drc/trajopt/'" >> ~/.bashrc
. ~/.bashrc

# cd ~/drc_workspace/src/drc/trajopt
# mkdir build_trajopt	
# cd build_trajopt 
# cmake -DBUILD_HUMANOIDS=ON -DBUILD_CLOUDPROC=ON ../
# make -j

#. ~/.bashrc

#Download gurobi6.0.0:
#http://www.gurobi.com/download/gurobi-optimizer

#cd ~/Downloads
#tar xvfz gurobi6.0.0_linux64.tar.gz

#sudo rm -rf /opt/gurobi600
#sudo mv gurobi600 /opt/
#Getting a license:
#http://www.gurobi.com/documentation/5.6/quick-start-guide/how_to_obtain_and_install_
#cd /opt/gurobi600/linux64/bin
#./grbgetkey <LICENSE NUMBER GOES HERE>
