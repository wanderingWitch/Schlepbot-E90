;; Auto-generated. Do not edit!


(when (boundp 'blobfinder::MultiBlobInfo)
  (if (not (find-package "BLOBFINDER"))
    (make-package "BLOBFINDER"))
  (shadow 'MultiBlobInfo (find-package "BLOBFINDER")))
(unless (find-package "BLOBFINDER::MULTIBLOBINFO")
  (make-package "BLOBFINDER::MULTIBLOBINFO"))

(in-package "ROS")
;;//! \htmlinclude MultiBlobInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass blobfinder::MultiBlobInfo
  :super ros::object
  :slots (_header _blobs ))

(defmethod blobfinder::MultiBlobInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:blobs __blobs) (let (r) (dotimes (i 0) (push (instance blobfinder::BlobInfo :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _blobs __blobs)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:blobs
   (&rest __blobs)
   (if (keywordp (car __blobs))
       (send* _blobs __blobs)
     (progn
       (if __blobs (setq _blobs (car __blobs)))
       _blobs)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; blobfinder/BlobInfo[] _blobs
    (apply #'+ (send-all _blobs :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; blobfinder/BlobInfo[] _blobs
     (write-long (length _blobs) s)
     (dolist (elem _blobs)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; blobfinder/BlobInfo[] _blobs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _blobs (let (r) (dotimes (i n) (push (instance blobfinder::BlobInfo :init) r)) r))
     (dolist (elem- _blobs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get blobfinder::MultiBlobInfo :md5sum-) "0ad554d567734dc08d6c7fd37fb32b20")
(setf (get blobfinder::MultiBlobInfo :datatype-) "blobfinder/MultiBlobInfo")
(setf (get blobfinder::MultiBlobInfo :definition-)
      "Header header
BlobInfo[] blobs


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: blobfinder/BlobInfo
float32 cx
float32 cy
float32 area
float32 ux
float32 uy
float32 vx
float32 vy

")



(provide :blobfinder/MultiBlobInfo "0ad554d567734dc08d6c7fd37fb32b20")


