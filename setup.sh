


echo "export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:~/$(rospack find MBZIRC2020Simulation)/gazebo_models" >> ~/.bashrc
echo "export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:~/$(catkin locate)/build/MBZIRC2020Simulation" >> ~/.bashrc
echo "export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:/usr/lib/x86_64-linux-gnu/gazebo-9/plugins/" >> ~/.bashrc
