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
CORRECTION_FACTOR = -0.08 # .005 # This is by how much we adjust the angular velocity to
		       			# prevent Schleppy from pulling left
LINEAR_SLOPE = 0.25
ANGULAR_SLOPE = 0.2
MAX_SPEED = 1
MAX_TURN = 0.1
CONTROL_PERIOD = rospy.Duration(0.01)
MAX_DIST = 0.75
MAX_TURN_RATE = 0.2
# Will take 5 cycles to accelerate to commanded
ACCEL = 0.2
class controller(object):

	def __init__(self):
		# We will want to track desired angular and linear velocity:
		# This way, if we are moving too slowly, we can attempt to increase.
		rospy.init_node('controller')
		self.desired_linear = 0
		self.desired_angular = 0
		# linear, angular
		self.cur_vel = [0,0]
		# State: Keeps track of: where is April Tag?
		self.state = 0
		# After 100 Hz not having seen a tag, will search
		self.has_not_seen_tag = 0
		# Will publish out velocity to writer
		self.cmd_vel_pub = rospy.Publisher('key_vel', Twist)
		# Will read April Tag info from camera
		rospy.Subscriber('apriltag', Point, self.update_distance)
		#rospy.Subscriber('vision/apriltag', Point, self.update_distance)
		rospy.Timer(CONTROL_PERIOD, self.control_callback)
		# Based on distance, write a velocity.
	def update_distance(self, msg):
		if (msg.x == 0 and msg.y == 0 and msg.z == 0):
			self.has_not_seen_tag += 1
			if (self.has_not_seen_tag >= 5):
				self.state = 0
		else:
			self.has_not_seen_tag = 0
			self.state = 1
			d = np.sqrt(msg.x**2 + msg.z**2)
			angle = np.arctan2(msg.x, msg.z)
			if d < MAX_DIST - 0.25: 
				linear = 0
			elif d < MAX_DIST:
				linear = 2 * (d - MAX_DIST) + 0.5
			elif d < MAX_DIST + 4: 
				linear = LINEAR_SLOPE * (d - MAX_DIST) + 0.5
			elif d > MAX_DIST + 4: 
				linear = MAX_SPEED 
			
			linear = min(linear, MAX_SPEED)
			angular = min(abs(ANGULAR_SLOPE*angle), MAX_TURN_RATE)*np.sign(angle)
			rospy.loginfo('Angle = {}'.format(angle))
			if(linear!=0):
				# angular += CORRECTION_FACTOR
				angular += max(CORRECTION_FACTOR / msg.z, CORRECTION_FACTOR)

			#if (np.abs(self.desired_linear - new_linear) > 0.02):
			self.desired_linear = linear

			#if (np.abs(self.desired_angular - new_angular) > 0.02):
			self.desired_angular = angular

	def control_callback(self, timer_event=None):
		cmd_vel = Twist()
		if (self.state == 0):
			print "No tag detected: braking"
			cmd_vel.linear.x = (1-ACCEL)*self.cur_vel[0]
			cmd_vel.angular.z = (1-ACCEL)*self.cur_vel[1]
			#cmd_vel.angular.z = 0.4*ACCEL + (1-ACCEL)*self.cur_vel[1]
		else:
			cmd_vel.linear.x = self.desired_linear*ACCEL + (1-ACCEL)*self.cur_vel[0]
			cmd_vel.angular.z = self.desired_angular*ACCEL + (1-ACCEL)*self.cur_vel[1]
		# rospy.loginfo('Linear velocity: {}'.format(cmd_vel.linear.x))
		# rospy.loginfo('Angular velocity: {}'.format(cmd_vel.angular.z))
		self.cur_vel[0] = cmd_vel.linear.x
		self.cur_vel[1] = cmd_vel.angular.z

		self.cmd_vel_pub.publish(cmd_vel)

	def run(self):
		rospy.spin()

if __name__ == '__main__':
	try:
		ctrl = controller()
		ctrl.run()
	except rospy.ROSInterruptException:
		pass
