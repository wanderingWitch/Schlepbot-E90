#!/bin/bash
source /opt/ros/kinetic/setup.sh
export ROS_PACKAGE_PATH=~/project_files/Schlepbot-E90/catkin_ws_new/src:$ROS_PACKAGE_PATH
screen -d -m -S running_roscore roscore
echo launched roscore
# screen -d -m -S raw rosrun apriltag_detector image_mod.py
# echo launched raw camera
#screen -d -m -S detect rosrun apriltag_detector detector.py
screen -d -m -S camera roslaunch apriltag_detector camera_launch.launch
echo launched camera things
sleep 30;
#screen -d -m -S rosrun line_follower control.py
#screen -d -m -S rosrun line_follower writer.py
#rostopic echo "key_vel"
