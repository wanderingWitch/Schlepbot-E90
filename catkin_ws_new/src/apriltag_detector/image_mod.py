#! /usr/bin/env python
import cv2
import sys
import roslib
import rospy
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from geometry_msgs.msg import Point

FRAME_RATE = rospy.Duration(1.0/50)

class getImage(object):

def __init__(self):
    # Set up image capture
    rospy.init_node('image_capture')
    self.camera = cv2.VideoCapture(0)
    self.image_pub = rospy.Publisher("camera_raw", Image, latch=True)
    self.bridge = CvBridge()
    rospy.Timer(FRAME_RATE, self.image_callback)

def image_callback(self, timer_event=None):
    success, data = self.camera.read()
    if not success:
        # print 'failed to read'
        rospy.loginfo('failed to read camera')
        return
    try:
        self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
    except CvBridgeError as e:
        print(e)
def run(self):
