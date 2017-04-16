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
import apriltag

# for ROS stuff
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Image

# for some reason pylint complains about members being undefined :(
# pylint: disable=E1101

class apriltag_detector(object):
    """
    A class that subscribes to a ROS image and outputs a list of all the
    apriltags found in the image
    """

    def __init__(self):
        rospy.init_node('apriltag_detector')
        rospy.Subscriber('image_topic_gray', Image)
        self.pub = rospy.Publisher('apriltag', Image, self.image_callback)
        self.bridge = CvBridge()

        # set upt the detector
        parser = ArgumentParser(
            description='test apriltag Python bindings')

        parser.add_argument('device_or_movie', metavar='INPUT', nargs='?', default=0,
                            help='Movie to load or integer ID of camera device')

        apriltag.add_arguments(parser)

        options = parser.parse_args()

        # create an apriltag detector
        self.detector = apriltag.Detector(options)

    def image_callback(self, data):
        """ When the publisher sees an image, it will call this method, which
        will analyze the image to see if it has any apriltags in it.
        If it does, then it will publish the center of the image to the
        topic. If it does not, then it will do nothing.
        """
        bridgedata = self.bridge.imgmsg_to_cv2(data, "bgr8")
        gray = cv2.cvtColor(data, cv2.COLOR_RBG2GRAY)
        detections, dimg = self.detector.detect(gray, return_image = False)

        if not detections:
            return
        num_detections = len(detections)
        rospy.loginfo('Detected {} tags'.format(num_detections))

        for i, detection in enumerate(detections):
            self.pub.publish(detection[4]) # publish the center of the tag.
            # TODO figure out how to estimate pose and publish that too.

    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        det = apriltag_detector()
        det.run()
    except rospy.ROSInterruptException:
		pass
