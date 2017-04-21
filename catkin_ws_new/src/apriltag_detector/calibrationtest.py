"""
test the apriltag detector's calibration
"""
import cv2
import numpy as np
from argparse import ArgumentParser
import apriltag

def main():
    cam = cv2.VideoCapture(1)
    success, frame = cam.read()
    if not success:
        print 'failed to read camera'
        return
    display = frame.copy()
    frame = cv2.cvtColor(frame, cv2.COLOR_RGB2GRAY)
    # cv2.imshow('win', frame)
    # cv2.waitKey()
    aprilsize = 0.04
    opts = np.array([[aprilsize, -aprilsize, 0.],
                        [-aprilsize, -aprilsize, 0.],
                        [-aprilsize, aprilsize, 0.],
                        [aprilsize, aprilsize, 0.]])

    cmat = np.loadtxt('CameraMatrix.txt')
    dmat = np.loadtxt('Distortion.txt')

    # set upt the detector
    parser = ArgumentParser(
        description='test apriltag Python bindings')

    parser.add_argument('device_or_movie', metavar='INPUT', nargs='?', default=0,
                        help='Movie to load or integer ID of camera device')

    apriltag.add_arguments(parser)

    options = parser.parse_args()

    # create an apriltag detector
    detector = apriltag.Detector(options)
    tags = detector.detect(frame, return_image= False)
    print 'found {} tags'.format(len(tags))


    print
    for tag in tags:
        print 'tag has corners \n{} \n'.format(tag.corners)
        print tag.corners.shape, tag.corners.dtype

        cv2.polylines(display, [tag.corners.astype(int)], True, (255,255,0), 1, 16)

        # corners_adj = tag.corners - np.array([frame.shape[1]/2, 0])
        # print 'adjusted corners \n{} \n'.format(corners_adj)
        retval, rvec, tvec = cv2.solvePnP(opts, tag.corners,
            cmat, dmat)

        print 'tag has tvec \n{}'.format(tvec)
        # print 'tag has rvec \n{}'.format(rvec)

    cv2.imshow('win', display)
    while cv2.waitKey(5) not in range(127): pass

if __name__== '__main__':
    main()
