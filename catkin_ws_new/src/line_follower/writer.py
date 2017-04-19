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
CONTROL_PERIOD = rospy.Duration(0.01)
class writer(object):

    def __init__(self):
        # create a port.
        # some robustness, so it can run on both mac and linux
        # try: # should work on linux
        #     # self.port = serial.Serial('/dev/cu.usbserial')
        #     self.port = serial.Serial('/dev/ttyUSB0')
        # except serial.serialutil.SerialException: # should work on mac
        #     self.port = serial.Serial('/dev/cu.usbserial')

        self.port = serial.Serial('/dev/ttyUSB0')

        rospy.init_node('writer')
        # initialize values for address, command, and data, and the checksum
        self.address = bytearray([128])
        self.command = bytearray([14])
        self.data = bytearray([100])
        self.checksum = bytearray([0])

        # set up a timeout, where the motor will time out after not
        # recieving a command for five seconds.
        self.write()
        rospy.Subscriber('key_vel', Twist, self.update_vel)

    # Just run
    def run(self):
        rospy.spin()


    def update_vel(self, msg):
        # Set forward velocity
	print msg.linear.x
	print msg.angular.z	
		# someone made right turns positive in the msg finle, so we need to correct
	msg.angular.z *= -1
        self.send_linear_vel(int(0.5*127*msg.linear.x))
        self.send_angular_vel(int(0.5*127*msg.angular.z))

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
            print 'That is not a valid input'
        if vel == 0:
            self.command[0] = 8
            self.data[0] = 0

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
            print 'That is not a valid input'

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

    def stop(self):
        self.send_linear_vel(0)
        self.send_angular_vel(0)

    # this seems to be causing some bugs, so it's disabled.
    # def __del__(self):
        # self.stop() # Not necessary because of the timeout.
        # self.port.close()

if __name__ == '__main__':
    controller = writer()
    try:
        controller.run()
    except rospy.ROSInterruptException:
        # Some sort of error
        controller.stop()
#    time.sleep(10)

    # controller.stop()
