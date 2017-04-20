; Auto-generated. Do not edit!


(cl:in-package blobfinder-msg)


;//! \htmlinclude MultiBlobInfo3D.msg.html

(cl:defclass <MultiBlobInfo3D> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (blobs
    :reader blobs
    :initarg :blobs
    :type (cl:vector blobfinder-msg:BlobInfo3D)
   :initform (cl:make-array 0 :element-type 'blobfinder-msg:BlobInfo3D :initial-element (cl:make-instance 'blobfinder-msg:BlobInfo3D))))
)

(cl:defclass MultiBlobInfo3D (<MultiBlobInfo3D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultiBlobInfo3D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultiBlobInfo3D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blobfinder-msg:<MultiBlobInfo3D> is deprecated: use blobfinder-msg:MultiBlobInfo3D instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MultiBlobInfo3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:header-val is deprecated.  Use blobfinder-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'blobs-val :lambda-list '(m))
(cl:defmethod blobs-val ((m <MultiBlobInfo3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:blobs-val is deprecated.  Use blobfinder-msg:blobs instead.")
  (blobs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultiBlobInfo3D>) ostream)
  "Serializes a message object of type '<MultiBlobInfo3D>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'blobs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'blobs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultiBlobInfo3D>) istream)
  "Deserializes a message object of type '<MultiBlobInfo3D>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'blobs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'blobs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'blobfinder-msg:BlobInfo3D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultiBlobInfo3D>)))
  "Returns string type for a message object of type '<MultiBlobInfo3D>"
  "blobfinder/MultiBlobInfo3D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultiBlobInfo3D)))
  "Returns string type for a message object of type 'MultiBlobInfo3D"
  "blobfinder/MultiBlobInfo3D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultiBlobInfo3D>)))
  "Returns md5sum for a message object of type '<MultiBlobInfo3D>"
  "ad81f6155f05d3496d2b636a8a776843")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultiBlobInfo3D)))
  "Returns md5sum for a message object of type 'MultiBlobInfo3D"
  "ad81f6155f05d3496d2b636a8a776843")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultiBlobInfo3D>)))
  "Returns full string definition for message of type '<MultiBlobInfo3D>"
  (cl:format cl:nil "Header header~%BlobInfo3D[] blobs~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: blobfinder/BlobInfo3D~%BlobInfo blob~%geometry_msgs/Point32 position~%bool have_pos~%~%~%================================================================================~%MSG: blobfinder/BlobInfo~%float32 cx~%float32 cy~%float32 area~%float32 ux~%float32 uy~%float32 vx~%float32 vy~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultiBlobInfo3D)))
  "Returns full string definition for message of type 'MultiBlobInfo3D"
  (cl:format cl:nil "Header header~%BlobInfo3D[] blobs~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: blobfinder/BlobInfo3D~%BlobInfo blob~%geometry_msgs/Point32 position~%bool have_pos~%~%~%================================================================================~%MSG: blobfinder/BlobInfo~%float32 cx~%float32 cy~%float32 area~%float32 ux~%float32 uy~%float32 vx~%float32 vy~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultiBlobInfo3D>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'blobs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultiBlobInfo3D>))
  "Converts a ROS message object to a list"
  (cl:list 'MultiBlobInfo3D
    (cl:cons ':header (header msg))
    (cl:cons ':blobs (blobs msg))
))
