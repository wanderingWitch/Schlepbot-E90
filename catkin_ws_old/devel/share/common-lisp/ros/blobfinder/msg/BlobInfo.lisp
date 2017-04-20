; Auto-generated. Do not edit!


(cl:in-package blobfinder-msg)


;//! \htmlinclude BlobInfo.msg.html

(cl:defclass <BlobInfo> (roslisp-msg-protocol:ros-message)
  ((cx
    :reader cx
    :initarg :cx
    :type cl:float
    :initform 0.0)
   (cy
    :reader cy
    :initarg :cy
    :type cl:float
    :initform 0.0)
   (area
    :reader area
    :initarg :area
    :type cl:float
    :initform 0.0)
   (ux
    :reader ux
    :initarg :ux
    :type cl:float
    :initform 0.0)
   (uy
    :reader uy
    :initarg :uy
    :type cl:float
    :initform 0.0)
   (vx
    :reader vx
    :initarg :vx
    :type cl:float
    :initform 0.0)
   (vy
    :reader vy
    :initarg :vy
    :type cl:float
    :initform 0.0))
)

(cl:defclass BlobInfo (<BlobInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BlobInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BlobInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blobfinder-msg:<BlobInfo> is deprecated: use blobfinder-msg:BlobInfo instead.")))

(cl:ensure-generic-function 'cx-val :lambda-list '(m))
(cl:defmethod cx-val ((m <BlobInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:cx-val is deprecated.  Use blobfinder-msg:cx instead.")
  (cx m))

(cl:ensure-generic-function 'cy-val :lambda-list '(m))
(cl:defmethod cy-val ((m <BlobInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:cy-val is deprecated.  Use blobfinder-msg:cy instead.")
  (cy m))

(cl:ensure-generic-function 'area-val :lambda-list '(m))
(cl:defmethod area-val ((m <BlobInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:area-val is deprecated.  Use blobfinder-msg:area instead.")
  (area m))

(cl:ensure-generic-function 'ux-val :lambda-list '(m))
(cl:defmethod ux-val ((m <BlobInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:ux-val is deprecated.  Use blobfinder-msg:ux instead.")
  (ux m))

(cl:ensure-generic-function 'uy-val :lambda-list '(m))
(cl:defmethod uy-val ((m <BlobInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:uy-val is deprecated.  Use blobfinder-msg:uy instead.")
  (uy m))

(cl:ensure-generic-function 'vx-val :lambda-list '(m))
(cl:defmethod vx-val ((m <BlobInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:vx-val is deprecated.  Use blobfinder-msg:vx instead.")
  (vx m))

(cl:ensure-generic-function 'vy-val :lambda-list '(m))
(cl:defmethod vy-val ((m <BlobInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blobfinder-msg:vy-val is deprecated.  Use blobfinder-msg:vy instead.")
  (vy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BlobInfo>) ostream)
  "Serializes a message object of type '<BlobInfo>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'area))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ux))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'uy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BlobInfo>) istream)
  "Deserializes a message object of type '<BlobInfo>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'area) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ux) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'uy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vy) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BlobInfo>)))
  "Returns string type for a message object of type '<BlobInfo>"
  "blobfinder/BlobInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BlobInfo)))
  "Returns string type for a message object of type 'BlobInfo"
  "blobfinder/BlobInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BlobInfo>)))
  "Returns md5sum for a message object of type '<BlobInfo>"
  "4fdbf41c5b84fc9a6e64c710c8878cb4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BlobInfo)))
  "Returns md5sum for a message object of type 'BlobInfo"
  "4fdbf41c5b84fc9a6e64c710c8878cb4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BlobInfo>)))
  "Returns full string definition for message of type '<BlobInfo>"
  (cl:format cl:nil "float32 cx~%float32 cy~%float32 area~%float32 ux~%float32 uy~%float32 vx~%float32 vy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BlobInfo)))
  "Returns full string definition for message of type 'BlobInfo"
  (cl:format cl:nil "float32 cx~%float32 cy~%float32 area~%float32 ux~%float32 uy~%float32 vx~%float32 vy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BlobInfo>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BlobInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'BlobInfo
    (cl:cons ':cx (cx msg))
    (cl:cons ':cy (cy msg))
    (cl:cons ':area (area msg))
    (cl:cons ':ux (ux msg))
    (cl:cons ':uy (uy msg))
    (cl:cons ':vx (vx msg))
    (cl:cons ':vy (vy msg))
))
