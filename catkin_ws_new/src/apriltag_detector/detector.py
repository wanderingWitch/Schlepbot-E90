#!/usr/bin/env python

"""
A ROS node that subscribes to a ROS publisher and outputs a list of all
the apriltags found in the image.

Written by Evan Greene 2017/04/12.
with code cribbed from Isaac Dulin
github.com/swatbotics/apriltag
"""

from argparse import ArgumentParser

import cv2
from cv_bridge import CvBridge, CvBridgeError
import apriltag
import numpy as np

# for ROS stuff
import rospy
import roslib;

from geometry_msgs.msg import Point
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

# for some reason pylint complains about members being undefined :(
# pylint: disable=E1101

class apriltag_detector(object):
    """
    A class that subscribes to a ROS image and outputs a list of all the
    apriltags found in the image
    """

    def __init__(self):
        rospy.init_node('apriltag_detector')
        # rospy.Subscriber('image_topic', Image, self.image_callback)

        # HACK: rather than subscribing to an image topic and then using that
        # data, just capture the node with cv2.VideoCapture every set length
        # of time.

        # Will let us convert from cv image to ros image and back
        self.bridge = CvBridge()

        # UNHACK: subscribe to the image publisher and create an image_callback
        self.sub = rospy.Subscriber("camera_raw", Image, self.image_callback )
        # set up parameters for the apriltag detector
        aprilsize = 0.08 #  half the side length of the apriltag in meters; changed from 0.05 4/20/17
        self.opts = np.array([[aprilsize, -aprilsize, 0.],
                    [-aprilsize, -aprilsize, 0.],
                    [-aprilsize, aprilsize, 0.],
                    [aprilsize, aprilsize, 0.]])
        # From camera calibration
        self.cmatrix = np.loadtxt("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/src/apriltag_detector/CameraMatrix.txt")
        self.dists = np.loadtxt("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/src/apriltag_detector/Distortion.txt")

        self.pub = rospy.Publisher('apriltag', Point, queue_size = 10)

        # set up the detector
        parser = ArgumentParser(
            description='test apriltag Python bindings')

        parser.add_argument('device_or_movie', metavar='INPUT', nargs='?', default=0,
                            help='Movie to load or integer ID of camera device')

        apriltag.add_arguments(parser)

        options = parser.parse_args(rospy.myargv()[1:])

        # create an apriltag detector
        self.detector = apriltag.Detector(options)

        # Moving average of translation vectors.
        self.tvec_avg = np.array([[0], [0], [0]])

    def image_callback(self, data):
        """ At a specified rate (determined by frame rate in the image_mod node),
        it will call this method, which will the raw image then analyze it
         to see if it has any apriltags in it.
        If it does, then it will publish the center of the image to the
        topic. If it does not, then it will do nothing.
        """

        # Import raw image and convert to cv2 format
        frame = self.bridge.imgmsg_to_cv2(data, "bgr8")
        # Convert to grayscale (AprilTag detector prefers this)
        gray = cv2.cvtColor(frame, cv2.COLOR_RGB2GRAY)
        detections = self.detector.detect(gray, return_image = False)

        num_detections = len(detections)
        rospy.loginfo('Detected {} tags'.format(num_detections))
        # Check to see if any detections
        if (not detections):
		          self.pub.publish(None,None, None)
		          return

	    detection = detections[0]
        retval, rvec, tvec = cv2.solvePnP(self.opts, detection.corners,
            self.cmatrix, self.dists)
        # Update moving average with 60% old, 40% new
        self.tvec_avg = 0.6 * self.tvec_avg + 0.4 * tvec
         # publish the center of the tag.
        self.pub.publish(self.tvec_avg[0], self.tvec_avg[1], self.tvec_avg[2])

    # Running is just rospy.spin()
    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        det = apriltag_detector()
        det.run()
    except rospy.ROSInterruptException:
	pass
# It's over!
