#!/bin/bash
  onlyroot="Do not run this as root."
  
if [ $(whoami) == 'root' ];then
    echo -e  $COLOR$onlyroot$MONO       #"Only root can do this operation."
    #DBG_MSG  "exit 5"
    exit 0
fi

sudo apt-get -y update
sudo apt-get -y install linux-headers-generic
sudo apt-get -y install nvidia-current
sudo nvidia-xconfig 
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list' 
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install ros-hydro-desktop-full
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
sudo sh -c 'echo "deb http://packages.osrfoundation.org/drc/ubuntu precise main" > /etc/apt/sources.list.d/drc-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
wget http://packages.osrfoundation.org/drc.key -O - | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install drcsim-hydro

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

sudo apt-get -y install ros-hydro-qt-ros
roscd atlas_sitcams
cd flycapture
tar xvf flycapture2-2.5.3.4-amd64-pkg.tgz
cd flycapture2-2.5.3.4-amd64
sudo apt-get -y -f install
sudo apt-get -y update
sudo apt-get -y install libraw1394-11 libgtk2.0-0 libgtkmm-2.4-dev libglademm-2.4-dev libgtkglextmm-x11-1.2-dev libusb-1.0-0
./install_flycapture.sh
cd ..
rm -r flycapture2-2.5.3.4-amd64

cd ~/Downloads/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -y install terminator
sudo apt-get -y install qtcreator
sudo apt-get -y install stress
sudo apt-get -y install fping
sudo apt-get -y install iftop 
sudo apt-get -y install lm-sensors 
sudo apt-get -y install vim 
sudo apt-get -y install emacs 
sudo apt-get -y install htop 

sudo apt-get -y install openjdk-7-jre openjdk-7-jdk
cd ~/Downloads/
wget http://ftp.osuosl.org/pub/eclipse//technology/epp/downloads/release/kepler/SR1/eclipse-cpp-kepler-SR1-linux-gtk-x86_64.tar.gz
tar xvf eclipse-cpp-kepler-SR1-linux-gtk-x86_64.tar.gz 
sudo mv eclipse /opt/
echo '[Desktop Entry]' >> eclipse.desktop
echo 'Name=Eclipse' >> eclipse.desktop
echo 'Type=Application' >> eclipse.desktop
echo 'Exec=/opt/eclipse/eclipse' >> eclipse.desktop
echo 'Terminal=false' >> eclipse.desktop
echo 'Icon=/opt/eclipse/icon.xpm' >> eclipse.desktop
echo 'Comment=Integrated Development Environment' >> eclipse.desktop
echo 'NoDisplay=false' >> eclipse.desktop
echo 'Categories=Development;IDE' >> eclipse.desktop
echo 'Name[en]=Eclipse' >> eclipse.desktop
sudo mv eclipse.desktop /usr/share/applications/eclipse.desktop
cd /usr/local/bin
sudo ln -s /opt/eclipse/eclipse


