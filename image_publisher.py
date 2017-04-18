"""
A node that takes an image from a camera and publishes the frame to a ROS topic
"""
import rospy
import cv2

class image_publisher(object):
    """ a node that takes frames and publishes them to a ROS publisher called
    image_topic_gray. As the name implies, the image is first converted to
    grayscale to reduce the volume of data being passed around.
    """

    def __init__(self): 
