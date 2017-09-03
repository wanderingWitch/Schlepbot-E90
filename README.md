# Schlepbot-E90
Engineering Capstone project for Mollie Wild and Evan Greene
Spring 2017
Demo available at https://www.youtube.com/watch?v=o86y688Y1Jw

Relevant files:

ROS nodes:
PACKAGE:          FILENAME:                 DESCRIPTION:
line_follower     control.py                determines necessary new velocity based on      
                                            sensor info
line_follower     writer.py                 outputs velocity to USB port in a serial packet
key_teleop        key_teleop.py             allows teleoperation of the robot via keyboard
apriltag_detector image_mod.py              reads from USB camera
apriltag_detector detector.py               detects an apriltag and the distance to its center

ROS launch files:
PACKAGE:          FILENAME:                 DESCRIPTION:
apriltag_detector camera_launch.launch      launches apriltag_detector package nodes
line_follower     motion_launch.launch      launches control and writer nodes
line_follower     writer_launch.launch      main launch file, launches all nodes

Other useful files:
PACKAGE:          FILENAME:                 DESCRIPTION:
apriltag_detector camera_calibration.py     calibrate cameras with chessboard
None              cvk2.py                   additional opencv functionality
None              motor_modeling_plotter.py test motor specs
None              launch_camera.sh          bash file to launch apriltag_detector nodes
None              launch_motors.sh          bash file to launch line_follower nodes
None              launch_ros.sh             bash file to launch roscore
None              launch.sh                 bash file to launch ROS and all nodes;
                                            not complete but intended to allow launch on startup            
