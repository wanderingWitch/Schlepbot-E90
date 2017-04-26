#!/bin/bash

# Launch roscore in another screen
screen -d -m -S running_roscore ./launch_ros.sh
echo launched roscore
# Launch apriltag detector and camera in another screen
screen -d -m -S camera ./launch_camera.sh
echo launched camera
sleep 2;
screen -d -m -S running ./launch_motors.sh
#screen -d -m -S rosrun line_follower control.py
#screen -d -m -S rosrun line_follower writer.py
#rostopic echo "key_vel"
sleep 60;
