
(cl:in-package :asdf)

(defsystem "blobfinder-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BlobInfo" :depends-on ("_package_BlobInfo"))
    (:file "_package_BlobInfo" :depends-on ("_package"))
    (:file "BlobInfo3D" :depends-on ("_package_BlobInfo3D"))
    (:file "_package_BlobInfo3D" :depends-on ("_package"))
    (:file "MultiBlobInfo" :depends-on ("_package_MultiBlobInfo"))
    (:file "_package_MultiBlobInfo" :depends-on ("_package"))
    (:file "MultiBlobInfo3D" :depends-on ("_package_MultiBlobInfo3D"))
    (:file "_package_MultiBlobInfo3D" :depends-on ("_package"))
  ))