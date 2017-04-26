#!/bin/bash
#source /opt/ros/kinetic/setup.sh
source ~/project_files/Schlepbot-E90/catkin_ws_new/devel/setup.bash
export ROS_PACKAGE_PATH=~/project_files/Schlepbot-E90/catkin_ws_new/src:$ROS_PACKAGE_PATH
#roscd apriltag_detector
roslaunch line_follower motion_launch.launch
