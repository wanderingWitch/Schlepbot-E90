execute_process(COMMAND "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/vision_opencv/cv_bridge/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/vision_opencv/cv_bridge/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
