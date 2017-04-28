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
CORRECTION_FACTOR = -0.08 # This is by how much we adjust the angular velocity to
		       			  # prevent Schleppy from pulling right
LINEAR_SLOPE = 0.25		  # Used with distance to tag to calculate linear velocity
ANGULAR_SLOPE = 0.2		  # Used with angle to tag to calculate angular velocity
MAX_SPEED = 1			  # Maximum linear velocity we can command our motors
						  # Want to avoid blowing out our fuse (see also writer.py)
MAX_TURN_RATE = 0.2		  # Maximum angular velocity we can command our motors

CONTROL_PERIOD = rospy.Duration(0.01) # Control period of 100 Hz
MAX_DIST = 0.75						  # The closest Schlepbot will get to the AprilTag: 0.75m

ACCEL = 0.2 # At 100 Hz, will accelerate to commanded velocity in 5 cycles


class controller(object):

	def __init__(self):
		rospy.init_node('controller')

		# Desired linear and angular velocity; may be different than what's
		# currently being sent to motors
		self.desired_linear = 0
		self.desired_angular = 0

		# linear, angular
		self.cur_vel = [0,0]
		# State: Keeps track of: where is AprilTag?
		self.state = 0	# 0: Cannot find AprilTag. 1: Found AprilTag
		# If there is no AprilTag in the frame
		self.has_not_seen_tag = 0

		# Will publish out velocity to writer node
		# Using topic name "key_vel" so we can easily switch to remote control
		# using the key_teleop node
		self.cmd_vel_pub = rospy.Publisher('key_vel', Twist)

		# Will read April Tag info from camera
		rospy.Subscriber('apriltag', Point, self.update_distance)
		# Timer for updating controller
		rospy.Timer(CONTROL_PERIOD, self.control_callback)

		# Based on pose of AprilTag, choose a desired velocity
	def update_distance(self, msg):

		# Check to see if tag is in frame: all zeros means no tag found
		if (msg.x == 0 and msg.y == 0 and msg.z == 0):
			self.has_not_seen_tag += 1
			if (self.has_not_seen_tag >= 5):
				# We want to account for camera glitches but still be able
				# to stop when there is no tag.
				self.state = 0
		else:
			# Seen tag
			self.has_not_seen_tag = 0
			self.state = 1
			# Convert to polar
			d = np.sqrt(msg.x**2 + msg.z**2)
			angle = np.arctan2(msg.x, msg.z)
			# Stop at 0.5m from target
			if d < MAX_DIST - 0.25:
				linear = 0
			elif d < MAX_DIST:
				linear = 2 * (d - MAX_DIST) + 0.5
			elif d < MAX_DIST + 4:
				linear = LINEAR_SLOPE * (d - MAX_DIST) + 0.5
			elif d > MAX_DIST + 4:
				linear = MAX_SPEED

			# Make sure linear velocity does not exceed maximum
			linear = min(linear, MAX_SPEED)
			# Angular velocity is based off of angle but must also not exceed
			# maximum turn rate
			angular = min(abs(ANGULAR_SLOPE*angle), MAX_TURN_RATE)*np.sign(angle)

			rospy.loginfo('Angle = {}'.format(angle))
			if(linear!=0):
				# Add correction factor to correct for mechanical issues
				angular += max(CORRECTION_FACTOR / msg.z, CORRECTION_FACTOR)

			# Update desired velocities
			self.desired_linear = linear
			self.desired_angular = angular

	# Update written velocity every control period
	def control_callback(self, timer_event=None):
		cmd_vel = Twist()
		if (self.state == 0):
			rospy.loginfo('No tag detected: braking')
			cmd_vel.linear.x = (1-ACCEL)*self.cur_vel[0]
			cmd_vel.angular.z = (1-ACCEL)*self.cur_vel[1]
		else:
			# Approach desired velocities
			cmd_vel.linear.x = self.desired_linear*ACCEL + (1-ACCEL)*self.cur_vel[0]
			cmd_vel.angular.z = self.desired_angular*ACCEL + (1-ACCEL)*self.cur_vel[1]
		rospy.loginfo('Linear velocity: {}'.format(cmd_vel.linear.x))
		rospy.loginfo('Angular velocity: {}'.format(cmd_vel.angular.z))
		# Update saved current velocities
		self.cur_vel[0] = cmd_vel.linear.x
		self.cur_vel[1] = cmd_vel.angular.z
		# Send new commanded velocities to the writer
		self.cmd_vel_pub.publish(cmd_vel)

	def run(self):
		rospy.spin()

if __name__ == '__main__':
	try:
		ctrl = controller()
		ctrl.run()
	except rospy.ROSInterruptException:
		pass
# It's over!
