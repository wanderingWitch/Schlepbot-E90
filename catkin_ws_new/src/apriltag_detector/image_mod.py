#! /usr/bin/env python
import cv2
import roslib; roslib.load_manifest('apriltag_detector')
import rospy
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from geometry_msgs.msg import Point

fps = 30
FRAME_RATE = rospy.Duration(1.0/fps)

class getImage(object):

    def __init__(self):
        # Set up image capture
        rospy.init_node('image_capture')
        self.camera = cv2.VideoCapture(0)
        # set the camera to produce 1280 x 720 images
        self.camera.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
        self.camera.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)
        # create an image publisher and a CvBridge
        self.image_pub = rospy.Publisher("camera_raw", Image, queue_size = 5)
        self.bridge = CvBridge()
        # finally, set the timer to collect and publish images.
        rospy.Timer(FRAME_RATE, self.image_callback)

    def image_callback(self, timer_event=None):
        # Get the frame from the camera
        success, data = self.camera.read()
        if not success:
            # This means that there was some sort of failure to read the camera
            rospy.loginfo('failed to read camera')
            return
        try:
            # convert the image to a ROS topic and publish it to camera_raw
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(data, "bgr8"))
        except CvBridgeError as e:
            rospy.loginfo(e)
    def run(self):
        rospy.spin()

if __name__== '__main__':
    try:
        imager = getImage()
        imager.run()
    except rospy.ROSInterruptException:
        pass
