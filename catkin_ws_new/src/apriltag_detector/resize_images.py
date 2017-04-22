"""
a script to resize every image in a specific directory and output the files to a different directory"""
import cv2
import sys

def main(): 
	filenames = sys.argv[1:]
	for i, filename in enumerate(filenames): 
		img = cv2.imread(filename)
		print 'read file {}'.format(filename)
		img_resized = cv2.resize(img, (640, 480))
		new_filename = 'resized_images/calibration{}.jpg'.format(i)
		success = cv2.imwrite(new_filename, img_resized)
		if success: 
			print 'wrote file /resized_images/calibration{}.jpg'.format(i)
main()
