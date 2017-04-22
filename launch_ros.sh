#!/bin/bash
source /opt/ros/electric/setup.sh
export ROS_PACKAGE_PATH=~/project_files/Schlepbot-E90/catkin_ws_new/src:$ROS_PACKAGE_PATH
roscore
