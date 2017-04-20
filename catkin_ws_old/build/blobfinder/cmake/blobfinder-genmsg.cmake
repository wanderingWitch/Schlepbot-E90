# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "blobfinder: 4 messages, 0 services")

set(MSG_I_FLAGS "-Iblobfinder:/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(blobfinder_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg" NAME_WE)
add_custom_target(_blobfinder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "blobfinder" "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg" ""
)

get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg" NAME_WE)
add_custom_target(_blobfinder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "blobfinder" "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg" "blobfinder/BlobInfo:geometry_msgs/Point32"
)

get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg" NAME_WE)
add_custom_target(_blobfinder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "blobfinder" "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg" "blobfinder/BlobInfo:geometry_msgs/Point32:blobfinder/BlobInfo3D:std_msgs/Header"
)

get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg" NAME_WE)
add_custom_target(_blobfinder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "blobfinder" "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg" "blobfinder/BlobInfo:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/blobfinder
)
_generate_msg_cpp(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/blobfinder
)
_generate_msg_cpp(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/blobfinder
)
_generate_msg_cpp(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/blobfinder
)

### Generating Services

### Generating Module File
_generate_module_cpp(blobfinder
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/blobfinder
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(blobfinder_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(blobfinder_generate_messages blobfinder_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_cpp _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_cpp _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_cpp _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_cpp _blobfinder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(blobfinder_gencpp)
add_dependencies(blobfinder_gencpp blobfinder_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS blobfinder_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/blobfinder
)
_generate_msg_eus(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/blobfinder
)
_generate_msg_eus(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/blobfinder
)
_generate_msg_eus(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/blobfinder
)

### Generating Services

### Generating Module File
_generate_module_eus(blobfinder
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/blobfinder
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(blobfinder_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(blobfinder_generate_messages blobfinder_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_eus _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_eus _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_eus _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_eus _blobfinder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(blobfinder_geneus)
add_dependencies(blobfinder_geneus blobfinder_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS blobfinder_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/blobfinder
)
_generate_msg_lisp(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/blobfinder
)
_generate_msg_lisp(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/blobfinder
)
_generate_msg_lisp(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/blobfinder
)

### Generating Services

### Generating Module File
_generate_module_lisp(blobfinder
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/blobfinder
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(blobfinder_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(blobfinder_generate_messages blobfinder_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_lisp _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_lisp _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_lisp _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_lisp _blobfinder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(blobfinder_genlisp)
add_dependencies(blobfinder_genlisp blobfinder_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS blobfinder_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/blobfinder
)
_generate_msg_nodejs(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/blobfinder
)
_generate_msg_nodejs(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/blobfinder
)
_generate_msg_nodejs(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/blobfinder
)

### Generating Services

### Generating Module File
_generate_module_nodejs(blobfinder
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/blobfinder
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(blobfinder_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(blobfinder_generate_messages blobfinder_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_nodejs _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_nodejs _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_nodejs _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_nodejs _blobfinder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(blobfinder_gennodejs)
add_dependencies(blobfinder_gennodejs blobfinder_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS blobfinder_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/blobfinder
)
_generate_msg_py(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/blobfinder
)
_generate_msg_py(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/blobfinder
)
_generate_msg_py(blobfinder
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/blobfinder
)

### Generating Services

### Generating Module File
_generate_module_py(blobfinder
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/blobfinder
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(blobfinder_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(blobfinder_generate_messages blobfinder_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_py _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/BlobInfo3D.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_py _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo3D.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_py _blobfinder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/schleppy/project_files/Schlepbot-E90/catkin_ws/src/blobfinder/msg/MultiBlobInfo.msg" NAME_WE)
add_dependencies(blobfinder_generate_messages_py _blobfinder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(blobfinder_genpy)
add_dependencies(blobfinder_genpy blobfinder_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS blobfinder_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/blobfinder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/blobfinder
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(blobfinder_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(blobfinder_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(blobfinder_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/blobfinder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/blobfinder
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(blobfinder_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(blobfinder_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(blobfinder_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/blobfinder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/blobfinder
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(blobfinder_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(blobfinder_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(blobfinder_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/blobfinder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/blobfinder
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(blobfinder_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(blobfinder_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(blobfinder_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/blobfinder)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/blobfinder\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/blobfinder
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(blobfinder_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(blobfinder_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(blobfinder_generate_messages_py std_msgs_generate_messages_py)
endif()
