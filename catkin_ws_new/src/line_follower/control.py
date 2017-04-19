#! /usr/bin/env python
"""
control.py

Creates a control node which, based on visual location such as April tag 
position and path location, sends a forward and turning velocity to Schleppy.

Evan Greene and Mollie Wild
2017/04/18
"""
import roslib
import rospy
from geometry_msgs.msg import Twist, Point
import numpy as np
CORRECTION_FACTOR = .10 # This is by how much we adjust the angular velocity to
		       # prevent Schleppy from pulling left
LINEAR_SLOPE = 0.15
ANGULAR_SLOPE = 0.15

CONTROL_PERIOD = rospy.Duration(0.01)
class controller(object):
	
	def __init__(self):	
	# We will want to track desired angular and linear velocity:
	# This way, if we are moving too slowly, we can attempt to increase.
	   rospy.init_node('controller')
	   self.desired_linear = 0
	   self.desired_angular = 0
	# Will publish out velocity to writer
	   self.cmd_vel_pub = rospy.Publisher('key_vel', Twist, latch=True)
	# Will read April Tag info from camera
	   rospy.Subscriber('apriltag', Point, self.update_distance)
	   rospy.Timer(CONTROL_PERIOD, self.control_callback)
	# Based on distance, write a velocity.
	def update_distance(self, msg):
	   if (msg == None):
		pass
	   d = np.sqrt(msg.x**2 + msg.z**2)
	   angle = np.arctan2(msg.x, msg.z)
	   
	   linear = max(LINEAR_SLOPE*(d-1), 0)
	   angular = ANGULAR_SLOPE*angle 

	   if(linear!=0):
	     angular += CORRECTION_FACTOR
	   new_linear = min(linear, 1)
           new_angular = min(angular, 1)

	   if (np.abs(self.desired_linear - new_linear) > 0.02):
		self.desired_linear = new_linear

	   if (np.abs(self.desired_angular - new_angular) > 0.02):
		self.desired_angular = new_angular

        def control_callback(self, timer_event=None):
	   cmd_vel = Twist()
	   
	   cmd_vel.linear.x = self.desired_linear
           cmd_vel.angular.z = self.desired_angular
           print 'Linear velocity: ', cmd_vel.linear.x
	   print 'Angular velocity: ', cmd_vel.angular.z
           self.cmd_vel_pub.publish(cmd_vel)

	def run(self):
	   rospy.spin()

if __name__ == '__main__':
	try:
	   ctrl = controller()	
	   ctrl.run()
	except rospy.ROSInterruptException:
	   pass
