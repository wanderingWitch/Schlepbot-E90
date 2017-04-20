;; Auto-generated. Do not edit!


(when (boundp 'blobfinder::BlobInfo)
  (if (not (find-package "BLOBFINDER"))
    (make-package "BLOBFINDER"))
  (shadow 'BlobInfo (find-package "BLOBFINDER")))
(unless (find-package "BLOBFINDER::BLOBINFO")
  (make-package "BLOBFINDER::BLOBINFO"))

(in-package "ROS")
;;//! \htmlinclude BlobInfo.msg.html


(defclass blobfinder::BlobInfo
  :super ros::object
  :slots (_cx _cy _area _ux _uy _vx _vy ))

(defmethod blobfinder::BlobInfo
  (:init
   (&key
    ((:cx __cx) 0.0)
    ((:cy __cy) 0.0)
    ((:area __area) 0.0)
    ((:ux __ux) 0.0)
    ((:uy __uy) 0.0)
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    )
   (send-super :init)
   (setq _cx (float __cx))
   (setq _cy (float __cy))
   (setq _area (float __area))
   (setq _ux (float __ux))
   (setq _uy (float __uy))
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   self)
  (:cx
   (&optional __cx)
   (if __cx (setq _cx __cx)) _cx)
  (:cy
   (&optional __cy)
   (if __cy (setq _cy __cy)) _cy)
  (:area
   (&optional __area)
   (if __area (setq _area __area)) _area)
  (:ux
   (&optional __ux)
   (if __ux (setq _ux __ux)) _ux)
  (:uy
   (&optional __uy)
   (if __uy (setq _uy __uy)) _uy)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:serialization-length
   ()
   (+
    ;; float32 _cx
    4
    ;; float32 _cy
    4
    ;; float32 _area
    4
    ;; float32 _ux
    4
    ;; float32 _uy
    4
    ;; float32 _vx
    4
    ;; float32 _vy
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _cx
       (sys::poke _cx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cy
       (sys::poke _cy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _area
       (sys::poke _area (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ux
       (sys::poke _ux (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _uy
       (sys::poke _uy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _cx
     (setq _cx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cy
     (setq _cy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _area
     (setq _area (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ux
     (setq _ux (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _uy
     (setq _uy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vx
     (setq _vx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vy
     (setq _vy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get blobfinder::BlobInfo :md5sum-) "4fdbf41c5b84fc9a6e64c710c8878cb4")
(setf (get blobfinder::BlobInfo :datatype-) "blobfinder/BlobInfo")
(setf (get blobfinder::BlobInfo :definition-)
      "float32 cx
float32 cy
float32 area
float32 ux
float32 uy
float32 vx
float32 vy

")



(provide :blobfinder/BlobInfo "4fdbf41c5b84fc9a6e64c710c8878cb4")


