import numpy as np
import cv2
import numpy
# import cvk2
import sys
import os

#code modified from OpenCV Camera Calibration python tutorial
#http://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_calib3d/py_calibration/py_calibration.html

# termination criteria
criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)

# prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(6,5,0)
objp = np.zeros((10*6,3), np.float32)

square_size = 0.025 # meters

objp[:,:2] = np.mgrid[0:10,0:6].T.reshape(-1,2) * square_size

# Arrays to store object points and image points from all the images.
objpoints = [] # 3d point in real world space
imgpoints = [] # 2d points in image plane.
images = []

for filename in sys.argv[1:]:

    image = cv2.imread(filename)
    basename = os.path.basename(filename)
    prefix, _ = os.path.splitext(basename)

    if image is None:
        print('error loading image {}'.format(filename))
        sys.exit(1)

    images.append(image)


i = 0
for img in images:
    print i
    i = i + 1


    gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)

    #cv2.imshow('img',gray)
    #cv2.waitKey(0)
    # Find the chess board corners
    #print "before findcorners"
    ret, corners = cv2.findChessboardCorners(gray, (10,6),None)
    #print "after findcorners"
    # If found, add object points, image points (after refining them)
    if ret == True:
        #print corners
        sys.stdout.flush()
        objpoints.append(objp)

        corners2 = cv2.cornerSubPix(gray,corners,(11,11),(-1,-1),criteria)
        imgpoints.append(corners)

        # Draw and display the corners
        img = cv2.drawChessboardCorners(img, (10,6), corners2,ret)
        cv2.imshow('img',img)
        while cv2.waitKey(5) not in range(128): pass


ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, gray.shape[::-1], None, None)

numpy.savetxt("CameraMatrix.txt",mtx)
numpy.savetxt("Distortion.txt",dist)
print ret
print mtx
print dist
