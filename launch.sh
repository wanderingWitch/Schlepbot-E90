#!/bin/bash
`roscore`
`rosrun apriltag_detector image_mod.py`
`rosrun apriltag_detector`
sleep 4;
echo `rosrun line_follower control.py`
`rosrun line_follower writer.py`