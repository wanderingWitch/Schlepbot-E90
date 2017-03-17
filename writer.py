"""
writer.py

Creates a writer class, that handles sending commands to a Sabertooth 2x25
motor controller with a few commands.

Evan Greene
2017/03/17
"""
import serial

class writer(object):

    def __init__(self):
        # create a port.
        self.port = serial.Serial('/dev/cu.usbserial')

        # initialize values for address, command, and data, and compute
        # the checksum
        self.address = bytearray([128])
        self.command = bytearray([0])
        self.data = bytearray([0])
        self.compute_checksum()

    def write(self):
        """ Computes the checksum then writes the
        current address, command, data, and checksum bytes to the port. """

        self.compute_checksum()

        towrite = bytearray()
        for elt in [self.address[0], self.command[0], self.data[0], \
            self.checksum[0]]:

            towrite.extend(elt)

        self.port.write(towrite)

    def compute_checksum(self):
        self.checksum = bytearray([(self.address[0] + self.command[0], \
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
            self.data[0] = abs(data)

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

if __name__ == '__main__':
    controller = writer()
    controller.send_linear_vel(50)
    controller.send_angular_vel(20)
