"""
picture_tester.py

Determines if pictures are any good for camera Calibration
"""
import sys
import cv2

def main():
    if len(sys.argv) < 2:
        print 'USAGE: python picture_tester.py [IMAGE_FILES]'
        sys.exit()

    criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)

    for filename in sys.argv[1:]:
        img = cv2.imread(filename)
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

            corners2 = cv2.cornerSubPix(gray,corners,(11,11),(-1,-1),criteria)
            # imgpoints.append(corners)

            # Draw and display the corners
            img = cv2.drawChessboardCorners(img, (10,6), corners2,ret)
            cv2.imshow('img',img)
            k = cv2.waitKey()
            # print k
            if k ==113:
                print '{} is garbage'.format(filename)

        else:
            print 'couldn\'t even find the corners on {}, so trash that sucker'.format(filename)

main()
