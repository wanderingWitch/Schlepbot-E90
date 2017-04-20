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
import roslib; roslib.load_manifest('apriltag_detector')

# from rospy_tutorials.msg import Floats
from geometry_msgs.msg import Point
# from std_msgs.msg import String
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
        self.bridge = CvBridge()
        self.camera = cv2.VideoCapture(0)

        # print self.camera

        # fps = 50 # frames per second
        # rate = rospy.Duration(1.0 / fps)
        # rospy.Timer(rate, self.image_callback)

        # UNHACK: subscribe to the image publisher and create an image_callback
        self.sub = rospy.Subscriber("camera_raw", Image, self.image_callback )
        # set up parameters for the apriltag detector
        aprilsize = 0.04 #  half the side length of the apriltag in meters; changed from 0.05 4/20/17
        self.opts = np.array([[aprilsize, -aprilsize, 0.],
                    [-aprilsize, -aprilsize, 0.],
                    [-aprilsize, aprilsize, 0.],
                    [aprilsize, aprilsize, 0.]])
        self.cmatrix = np.loadtxt("CameraMatrix.txt")
        self.dists = np.loadtxt("Distortion.txt")

        self.pub = rospy.Publisher('apriltag', Point, queue_size = 10)
        # self.pub = rospy.Publisher('apriltag', String, queue_size = 10)
        # self.bridge = CvBridge()

        # set upt the detector
        parser = ArgumentParser(
            description='test apriltag Python bindings')

        parser.add_argument('device_or_movie', metavar='INPUT', nargs='?', default=0,
                            help='Movie to load or integer ID of camera device')

        apriltag.add_arguments(parser)

        options = parser.parse_args()

        # create an apriltag detector
        self.detector = apriltag.Detector(options)
        print self.detector
        # print 'created a detector'
        # some parameters for calculating the moving average of vectors.
        # We will store each tvec computed data. Each row of the tvec_list
        # will be a value of the tvec
        # self.tvec_list = np.empty([10, 3])
        # self.tvec_list[:] = np.nan
        # self.tvec_list_index = 0
        self.tvec_avg = np.array([[0], [0], [0]])
        # print self.tvec_avg.shape

    def image_callback(self, data):
        """ At a specified rate (determined by fps variable in __init__),
        it will call this method, which will grab a frame, then analyze the
        image to see if it has any apriltags in it.
        If it does, then it will publish the center of the image to the
        topic. If it does not, then it will do nothing.
        """

        # success, data = self.camera.read()
        # if not success:
            # print 'failed to read'
            # rospy.loginfo('failed to read camera')
            # return
        # rospy.loginfo('found an image')
        # bridgedata = self.bridge.imgmsg_to_cv2(data, "bgr8")
        frame = self.bridge.imgmsg_to_cv2(data, "bgr8")
        gray = cv2.cvtColor(frame, cv2.COLOR_RGB2GRAY)
        detections = self.detector.detect(gray, return_image = False)

        if not detections:
			# self.pub.publish(None,None, None)
			return
        num_detections = len(detections)
        rospy.loginfo('Detected {} tags'.format(num_detections))

        for i, detection in enumerate(detections):
            retval, rvec, tvec = cv2.solvePnP(self.opts, detection.corners,
                self.cmatrix, self.dists)
            print self.tvec_avg.shape
            print tvec
            # tvec = tvec.flatten()
            # self.tvec_list[self.tvec_list_index, :] = tvec.flatten()
            # self.tvec_list_index = (self.tvec_list_index + 1) % 10
            # print "un-averaged list", self.tvec_list
            # self.tvec = np.mean(modified_list, axis=0)
            # modified_list = self.tvec_list[~(np.isnan(self.tvec_list[:]).any(axis=1)),:]
            # print "tvec is ", self.tvec
            self.tvec_avg = 0.8 * self.tvec_avg + 0.2 * tvec
            # print self.tvec_avg
            self.pub.publish(self.tvec_avg[0], self.tvec_avg[1], self.tvec_avg[2]) # publish the center of the tag.

    # Running is just rospy.spin()
    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        det = apriltag_detector()
        det.run()
    except rospy.ROSInterruptException:
		pass
