#!/bin/bash
# Launch file to launch all program elements
# Launch roscore in another screen
screen -d -m -S running_roscore ./launch_ros.sh
echo launched roscore
# Launch apriltag detector and camera in another screen
screen -d -m -S camera ./launch_camera.sh
echo launched camera
sleep 2;
# Launch motors; meant to launch a little later because the first few values
# sent by the apriltag detector aren't useful.  Were running into some issues with
# topic names, though.
screen -d -m -S running ./launch_motors.sh
#rostopic echo "key_vel"
sleep 60;
