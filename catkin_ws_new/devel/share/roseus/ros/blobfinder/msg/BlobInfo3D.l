;; Auto-generated. Do not edit!


(when (boundp 'blobfinder::BlobInfo3D)
  (if (not (find-package "BLOBFINDER"))
    (make-package "BLOBFINDER"))
  (shadow 'BlobInfo3D (find-package "BLOBFINDER")))
(unless (find-package "BLOBFINDER::BLOBINFO3D")
  (make-package "BLOBFINDER::BLOBINFO3D"))

(in-package "ROS")
;;//! \htmlinclude BlobInfo3D.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass blobfinder::BlobInfo3D
  :super ros::object
  :slots (_blob _position _have_pos ))

(defmethod blobfinder::BlobInfo3D
  (:init
   (&key
    ((:blob __blob) (instance blobfinder::BlobInfo :init))
    ((:position __position) (instance geometry_msgs::Point32 :init))
    ((:have_pos __have_pos) nil)
    )
   (send-super :init)
   (setq _blob __blob)
   (setq _position __position)
   (setq _have_pos __have_pos)
   self)
  (:blob
   (&rest __blob)
   (if (keywordp (car __blob))
       (send* _blob __blob)
     (progn
       (if __blob (setq _blob (car __blob)))
       _blob)))
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:have_pos
   (&optional __have_pos)
   (if __have_pos (setq _have_pos __have_pos)) _have_pos)
  (:serialization-length
   ()
   (+
    ;; blobfinder/BlobInfo _blob
    (send _blob :serialization-length)
    ;; geometry_msgs/Point32 _position
    (send _position :serialization-length)
    ;; bool _have_pos
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; blobfinder/BlobInfo _blob
       (send _blob :serialize s)
     ;; geometry_msgs/Point32 _position
       (send _position :serialize s)
     ;; bool _have_pos
       (if _have_pos (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; blobfinder/BlobInfo _blob
     (send _blob :deserialize buf ptr-) (incf ptr- (send _blob :serialization-length))
   ;; geometry_msgs/Point32 _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; bool _have_pos
     (setq _have_pos (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get blobfinder::BlobInfo3D :md5sum-) "f3d0e6635e357b0e6fe0e98d803150c5")
(setf (get blobfinder::BlobInfo3D :datatype-) "blobfinder/BlobInfo3D")
(setf (get blobfinder::BlobInfo3D :definition-)
      "BlobInfo blob
geometry_msgs/Point32 position
bool have_pos


================================================================================
MSG: blobfinder/BlobInfo
float32 cx
float32 cy
float32 area
float32 ux
float32 uy
float32 vx
float32 vy

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
")



(provide :blobfinder/BlobInfo3D "f3d0e6635e357b0e6fe0e98d803150c5")


