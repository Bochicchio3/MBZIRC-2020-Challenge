# MBZIRC2020Simulation

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update
sudo apt-get install ros-melodic-desktop-full ros-melodic-joy ros-melodic-octomap-ros python-wstool python-catkin-tools protobuf-compiler libgoogle-glog-dev
sudo apt-get install geographiclib-tools 
sudo apt-get install libgeographic-dev
sudo apt-get install ros-melodic-opencv-apps
sudo rosdep init
rosdep
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt-get update
sudo apt-get install git
sudo apt-get install gitk git-gui
sudo apt-get update
sudo apt-get install build-essential cmake git libboost-all-dev mercurial libcegui-mk2-dev libopenal-dev libswscale-dev libavformat-dev libavcodec-dev  libltdl3-dev libqwt-dev ruby libusb-1.0-0-dev libbullet-dev libhdf5-dev libgraphviz-dev libgdal-dev
```
-------------------------------------------------
Install Ardupilot + SITL:

STEP 1:CLONE ARDUPILOT REPOSITORY
```
cd ~
git clone https://github.com/ArduPilot/ardupilot
cd ardupilot
git submodule update --init --recursive
```

STEP 2:
```
Tools/scripts/install-prereqs-ubuntu.sh -y 
. ~/.profile  
 ```
STEP 2 ALTERNATIVE- ONLY if you didn’t run the install-prereqs script from previous step. 

Add the following lines to the end of your “.bashrc” in your home directory
(notice the . on the start of that filename. Also, this is a hidden file,
 so if you’re using a file manager, make sure to turn on “show hidden files”).
```
export PATH=$PATH:$HOME/ardupilot/Tools/autotest
export PATH=/usr/lib/ccache:$PATH

```
Then reload your PATH by using the “dot” command in a terminal, oppure anche solo chiudete il terminale e riapritelo
```
. ~/.bashrc
```
Reference:
http://ardupilot.org/dev/docs/setting-up-sitl-on-linux.html
http://ardupilot.org/dev/docs/building-setup-linux.html#building-setup-linux


Verify if it is working
```
cd ardupilot/ArduCopter
sim_vehicle.py -j4 --map --console
```
And in the terminal
```
mode GUIDED
arm throttle
takeoff 100 
```
Eventually right click in the Mavlink console and use the fly to function

----------------------------------------------------------------------------------
ONLY FOR THOSE WHO DID NOT INSTALLED ROS FULL

Install GAZEBO:
```
curl -sSL http://get.gazebosim.org | sh
```
For reference:
http://gazebosim.org/tutorials?tut=install_ubuntu&cat=install
-----------------------------------------------------------------------------------

OPTIONAL STEP: Gazebo Models Download for GAZEBO with SITL

Reference:
https://web.archive.org/web/20180503141535/http://ardupilot.org/dev/docs/using-gazebo-simulator-with-sitl.html

Download Gazebo Models
```
cd ~
mkdir ~/gazebo_ws
cd ~/gazebo_ws/
hg clone https://bitbucket.org/osrf/gazebo_models ~/gazebo_ws/gazebo_models
cd ~/gazebo_ws/gazebo_models
hg checkout zephyr_demos
echo 'export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:~/gazebo_ws/gazebo_models' >> ~/.bashrc
source ~/.bashrc
```
--------------------------------------------------------------------------------
Start the Simulator

In one terminal, enter the ArduCopter directory and start the SITL simulation:
```
cd ~/ardupilot/ArduCopter
sim_vehicle.py -f gazebo-iris -D --console --map
```
In another terminal start Gazebo:
```
cd ~/gazebo
gazebo --verbose worlds/iris_arducopter_demo.world
```
WARNING: This command works only if you downloaded gazebo models in the previous optional step.
------------------------------------------------------------
TO CREATE A NEW ROS WORKSPACE WITH REQUIRED PACKAGES
```
mkdir -p catkin_ws/src
cd catkin_ws/src
catkin_init_workspace
cd ..
rm -r src
git clone https://github.com/Bochicchio3/src.git
git checkout Newsrc
cd ..
catkin build
source devel/setup.bash
```

```

echo 'export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:~/$(rospack find mbzirc_SITL)/gazebo_models' >> ~/.bashrc
echo 'export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:~/$(catkin locate)/build/mbzirc_SITL' >> ~/.bashrc
echo 'export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:/usr/lib/x86_64-linux-gnu/gazebo-9/plugins/' >> ~/.bashrc
```
USEFUL HINTS:
IF YOU ARE RUNNING ON VIRTUAL MACHINE RUN
``` 
echo `export SVGA_VGPU10=0`>> ~/.bashrc
```
IF YOU DON'T WANT TO SOURCE YOUR WORKSPACE EVERY TIME
```
echo 'source $(catkin locate)/devel/setup.bash'>> ~/.bashrc
```
