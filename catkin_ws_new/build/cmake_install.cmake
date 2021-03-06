# Install script for directory: /home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install" TYPE PROGRAM FILES "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/catkin_generated/installspace/_setup_util.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install" TYPE PROGRAM FILES "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/catkin_generated/installspace/env.sh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install/setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install" TYPE FILE FILES "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/catkin_generated/installspace/setup.bash")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install/setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install" TYPE FILE FILES "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/catkin_generated/installspace/setup.sh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install/setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install" TYPE FILE FILES "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/catkin_generated/installspace/setup.zsh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/install" TYPE FILE FILES "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/gtest/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/teleop_tools/joy_teleop/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/teleop_tools/key_teleop/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/line_follower/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/teleop_tools/mouse_teleop/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/vision_opencv/opencv_tests/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/vision_opencv/image_geometry/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/teleop_tools/teleop_tools/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/teleop_tools/teleop_tools_msgs/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/vision_opencv/vision_opencv/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/vision_opencv/cv_bridge/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/apriltag_detector/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/cv_camera/cmake_install.cmake")
  include("/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/blobfinder/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/schleppy/project_files/Schlepbot-E90/catkin_ws_new/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
