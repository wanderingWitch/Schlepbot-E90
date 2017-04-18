#!/usr/bin/env python
"""
This code was adapted by Evan Greene and Darbus Oldham from code provided by
Prof. Mattew Zucker. It was used for project 1 of E28, Mobile Robotics, for
the Fall 2016 Semester.

It's now been used again by Evan Greene and Mollie Wild for their E90 project.
"""

import roslib; roslib.load_manifest('project1')
import rospy
import random

from geometry_msgs.msg import Twist
from kobuki_msgs.msg import SensorState
from blobfinder.msg import MultiBlobInfo

# control at 100Hz
CONTROL_PERIOD = rospy.Duration(0.01)

# react to bumpers for 1 second
BUMPER_DURATION = rospy.Duration(1.0)

# random actions should last 0.5 second
RANDOM_ACTION_DURATION = rospy.Duration(0.5)

# when the robot turns around, it goes at 1.5 rad/s for 4.2 s
# to get one full revolution
TURN_AROUND_DURATION = rospy.Duration(4.2)

# our controller class
class Controller:

    # called when an object of type Controller is created
    def __init__(self):
	self.thetadotr = 0

	print 'initializing... '
        # initialize rospy
        rospy.init_node('starter')

        # set up publisher for commanded velocity
        self.cmd_vel_pub = rospy.Publisher('/mobile_base/commands/velocity',Twist)

        # start out in wandering state
        self.state = 'wander'

        # pick out a random action to do when we start driving
        self.pick_random_action()
	print "Picked an action"

        # we will stop driving if picked up or about to drive off edge
        # of something
        self.cliff_alert = 0

        # set up subscriber for sensor state for bumpers/cliffs
        rospy.Subscriber('/mobile_base/sensors/core',
                         SensorState, self.sensor_callback)

        # subscriber for blob info
	rospy.Subscriber('/blobfinder/blue_tape/blobs',
		MultiBlobInfo, self.blob_callback)

        # set up control timer at 100 Hz
        rospy.Timer(CONTROL_PERIOD, self.control_callback)
# set up timer for random actions at 2 hz rospy.Timer(RANDOM_ACTION_DURATION, self.pick_random_action)
    # called whenever sensor messages are received
    def sensor_callback(self, msg):
	print self.state
        # set cliff alert
        self.cliff_alert = msg.cliff
	if self.cliff_alert:
	    print 'detected cliff'

        # ignore bumper if we are already reacting to it
        if self.state in ['backward', 'turn_left', 'turn_right']:
            return

        # see what we should do next
        next_state = None

        if msg.bumper & SensorState.BUMPER_CENTRE:
            next_state = 'backward'
        elif msg.bumper & SensorState.BUMPER_LEFT:
            next_state = 'turn_right'
        elif msg.bumper & SensorState.BUMPER_RIGHT:
            next_state = 'turn_left'

        # if bumped, go to next state
        if next_state is not None:

            self.state = next_state

            # in 1 second, finish this state
            rospy.Timer(BUMPER_DURATION, self.bumper_done, oneshot=True)


    def blob_callback(self, msg):
	kp = 0.0025
	if self.state in ['backward', 'turn_left', 'turn_right'] :
	    return
	#If it sees at least one blob, continue
	if len(msg.blobs) > 0:
	    # go through all the blobs, biggest first, to see if they're suitable to follow. If they are, follow them.
	    for blob in msg.blobs:
	        if blob.area > 100 and blob.cy > 250:
	            bx = blob.cx
		    #Set the new thetadot
		    self.thetadotr = kp*(320-bx)
		    self.state = 'track'
		    break
	    # this is the chair-avoider code
	    # if we see a blob that's high and large, it's probably a chair.
	    # turn around to avoid it.
	    if self.state == 'wander':
		for blob in msg.blobs:
		    if blob.area > 300:
		        self.state = 'turn_around'
        else:
	    # 'turn_around' is just like 'turn_left' except that it doesn't
	    # take precedence over 'track'
	    self.state = 'turn_around'

    # called when we are done with a bumper reaction
    def bumper_done(self, timer_event=None):

        # if we just backed up, time to turn
        if self.state == 'backward':

            # go to turning state
            self.state = 'turn_left'
            # reset again in a second
            rospy.Timer(BUMPER_DURATION, self.bumper_done, oneshot=True)

        else: # we just turned, so go return to wandering
            self.state = 'wander'

    # for when the robot turns around. Imitates the method for bumper_done
    def turn_around_done(self, timer_event= None):
	# if we're turning around, time to wander
	if self.state == 'turn_around':
	    self.state = 'wander'
	    # set a timer to reset again in 4.2 s (one revolution)
	    rospy.Timer(TURN_AROUND_DURATION, self.turn_around_done, oneshot=True)
	else:
	    self.state = 'wander'
    # called when it's time to choose a new random wander direction
    def pick_random_action(self, timer_event=None):
   	self.wander_action = Twist()
	self.wander_action.linear.x = random.uniform(0.2,0.3)
	self.wander_action.angular.z = random.uniform(-1.0,1.0)

    # called 100 times per second
    def control_callback(self, timer_event=None):

        # initialize commanded vel to 0, 0
        cmd_vel = Twist()

        # only set commanded velocity to non-zero if not picked up:
        if not self.cliff_alert:
            # state maps straightforwardly to command
            if self.state == 'backward':
                cmd_vel.linear.x = -0.3
            elif self.state == 'turn_left':
                cmd_vel.angular.z = 1.5
            elif self.state == 'turn_right':
                cmd_vel.angular.z = -1.5
	    elif self.state == 'track':
		cmd_vel.angular.z = self.thetadotr
		cmd_vel.linear.x = 0.2
            elif self.state == 'turn_around':
		cmd_vel.angular.z = 0.3
	    else: # Go in the random direction
                cmd_vel = self.wander_action
        self.cmd_vel_pub.publish(cmd_vel)

    # called by main function below (after init)
    def run(self):

        # timers and callbacks are already set up, so just spin.
        # if spin returns we were interrupted by Ctrl+C or shutdown
	# print cmd_vel
        rospy.spin()

# main function
if __name__ == '__main__':
    try:
        ctrl = Controller()
	ctrl.run()
    except rospy.ROSInterruptException:
pass
