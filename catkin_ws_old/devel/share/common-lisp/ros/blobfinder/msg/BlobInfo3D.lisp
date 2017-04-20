; Auto-generated. Do not edit!


(cl:in-package blobfinder-msg)


;//! \htmlinclude BlobInfo3D.msg.html

(cl:defclass <BlobInfo3D> (roslisp-msg-protocol:ros-message)
  ((blob
    :reader blob
    :initarg :blob
    :type blobfinder-msg:BlobInfo
    :initform (cl:make-instance 'blobfinder-msg:BlobInfo))
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point32
    :initform (cl:make-instance 'geometry_msgs-msg:Point32))
   (have_pos
    :reader have_pos
    :initarg :have_pos
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BlobInfo3D (<BlobInfo3D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BlobInfo3D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BlobInfo3D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blobfinder-msg:<BlobInfo3D> is deprecated: use blobfinder-msg:BlobInfo3D instead.")))

(cl:ensure-generic-function 'blob-val :lambda-list '(m))
(cl:defmethod blob-val ((m <BlobInfo3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:blob-val is deprecated.  Use blobfinder-msg:blob instead.")
  (blob m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <BlobInfo3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:position-val is deprecated.  Use blobfinder-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'have_pos-val :lambda-list '(m))
(cl:defmethod have_pos-val ((m <BlobInfo3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:have_pos-val is deprecated.  Use blobfinder-msg:have_pos instead.")
  (have_pos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BlobInfo3D>) ostream)
  "Serializes a message object of type '<BlobInfo3D>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'blob) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'have_pos) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BlobInfo3D>) istream)
  "Deserializes a message object of type '<BlobInfo3D>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'blob) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:setf (cl:slot-value msg 'have_pos) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BlobInfo3D>)))
  "Returns string type for a message object of type '<BlobInfo3D>"
  "blobfinder/BlobInfo3D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BlobInfo3D)))
  "Returns string type for a message object of type 'BlobInfo3D"
  "blobfinder/BlobInfo3D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BlobInfo3D>)))
  "Returns md5sum for a message object of type '<BlobInfo3D>"
  "f3d0e6635e357b0e6fe0e98d803150c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BlobInfo3D)))
  "Returns md5sum for a message object of type 'BlobInfo3D"
  "f3d0e6635e357b0e6fe0e98d803150c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BlobInfo3D>)))
  "Returns full string definition for message of type '<BlobInfo3D>"
  (cl:format cl:nil "BlobInfo blob~%geometry_msgs/Point32 position~%bool have_pos~%~%~%================================================================================~%MSG: blobfinder/BlobInfo~%float32 cx~%float32 cy~%float32 area~%float32 ux~%float32 uy~%float32 vx~%float32 vy~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BlobInfo3D)))
  "Returns full string definition for message of type 'BlobInfo3D"
  (cl:format cl:nil "BlobInfo blob~%geometry_msgs/Point32 position~%bool have_pos~%~%~%================================================================================~%MSG: blobfinder/BlobInfo~%float32 cx~%float32 cy~%float32 area~%float32 ux~%float32 uy~%float32 vx~%float32 vy~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BlobInfo3D>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'blob))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BlobInfo3D>))
  "Converts a ROS message object to a list"
  (cl:list 'BlobInfo3D
    (cl:cons ':blob (blob msg))
    (cl:cons ':position (position msg))
    (cl:cons ':have_pos (have_pos msg))
))
