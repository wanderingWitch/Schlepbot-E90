#!/usr/bin/env python

"""
writer.py

Creates a writer node, that handles sending commands to a Sabertooth 2x25
motor controller with a few commands.

Evan Greene and Mollie Wild
2017/03/17
"""
import serial, time
import roslib
import rospy
from geometry_msgs.msg import Twist
class writer(object):

    def __init__(self):
        # create a port.
        self.port = serial.Serial('/dev/ttyUSB0')
        rospy.init_node('writer')
        # initialize values for address, command, and data, and the checksum
        self.address = bytearray([128])
        self.command = bytearray([14])
        self.data = bytearray([2])
        self.checksum = bytearray([0])

        # Write initial data
        self.write()
        # Receives commands from control node or key_teleop node
        rospy.Subscriber('key_vel', Twist, self.update_vel)

    # Just run
    def run(self):
        rospy.spin()

    #  Received a new velocity from the command node
    def update_vel(self, msg):
	   # someone made right turns positive in the key_teleop node, so we need to correct
	   msg.angular.z *= -1
       self.send_linear_vel(int(0.5*127*msg.linear.x))
       rospy.loginfo('Written linear velocity: {}'.format(self.data[0]))
	   print "linear: ",str(self.data[0])
       self.send_angular_vel(int(0.5*127*msg.angular.z))
       rospy.loginfo('Written angular velocity: {}'.format(self.data[0]))
	   print "angular: ", str(self.data[0])

    def write(self):
        """ Computes the checksum then writes the
        current address, command, data, and checksum bytes to the port. """

        self.compute_checksum()

        towrite = bytearray()
        for elt in [self.address, self.command, self.data, \
            self.checksum]:

            towrite.extend(elt)

        self.port.write(towrite)
        print 'wrote a packet: '

    # The checksum helps confirm that no data corruption has occurred
    def compute_checksum(self):
        self.checksum = bytearray([(self.address[0] + self.command[0] +  \
            self.data[0]) & 0b01111111 ])

    def send_linear_vel(self, vel):
        """
        Takes a velocity as a signed integer between -127 and 127.
        Negative values are backwards, zero is stop, and positive values
        are forward.
        """
        # the type checking is somewhat rudimentary.
        try:
            vel = int(vel)
            assert(-128 < vel and 128 > vel)
        except TypeError, AssertionError:
            rospy.logwarn('That is not a valid linear velocity: {}'.format(vel))
            vel = 0
        # Use 0 as forwards case
        if vel == 0:
            self.command[0] = 8
            self.data[0] = 0
        # Forwards case
        elif vel > 0:
            self.command[0] = 8
            self.data[0] = vel

        elif vel < 0: # backwards case
            self.command[0] = 9
            self.data[0] = abs(vel)

        self.write()

    def send_angular_vel(self, vel):
        """
        takes an angular velocity as a signed integer in the range (-127, 127).
        Negative results are right, zero is stop and positive values are
        left turns.
        """
        # the type checking is somewhat rudimentary.
        try:
            vel = int(vel)
            assert(-128 < vel and 128 > vel)
        except TypeError, AssertionError:
            rospy.logwarn('That is not a valid angular velocity: {}'.format(vel))
            vel = 0

        if vel == 0:
            self.command[0] = 11
            self.data[0] = 0

        elif vel > 0:
            self.command[0] = 11
            self.data[0] = vel

        elif vel < 0:
            self.command[0] = 10
            self.data[0] = abs(vel)

        self.write()

    # Stop motors
    def stop(self):
        self.send_linear_vel(0)
        self.send_angular_vel(0)

    def __del__(self):
      	self.stop() # Stop the robot moving
        self.port.close() # Close port

if __name__ == '__main__':
    try:
        controller = writer()
        controller.run()
    except rospy.ROSInterruptException:
        # Any kind of error
        controller.stop()
