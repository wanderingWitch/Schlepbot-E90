// Generated by gencpp from file teleop_tools_msgs/IncrementResult.msg
// DO NOT EDIT!


#ifndef TELEOP_TOOLS_MSGS_MESSAGE_INCREMENTRESULT_H
#define TELEOP_TOOLS_MSGS_MESSAGE_INCREMENTRESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace teleop_tools_msgs
{
template <class ContainerAllocator>
struct IncrementResult_
{
  typedef IncrementResult_<ContainerAllocator> Type;

  IncrementResult_()
    {
    }
  IncrementResult_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }






  typedef boost::shared_ptr< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> const> ConstPtr;

}; // struct IncrementResult_

typedef ::teleop_tools_msgs::IncrementResult_<std::allocator<void> > IncrementResult;

typedef boost::shared_ptr< ::teleop_tools_msgs::IncrementResult > IncrementResultPtr;
typedef boost::shared_ptr< ::teleop_tools_msgs::IncrementResult const> IncrementResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace teleop_tools_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'teleop_tools_msgs': ['/home/schleppy/catkin_ws/devel/share/teleop_tools_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::teleop_tools_msgs::IncrementResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "teleop_tools_msgs/IncrementResult";
  }

  static const char* value(const ::teleop_tools_msgs::IncrementResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
";
  }

  static const char* value(const ::teleop_tools_msgs::IncrementResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct IncrementResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::teleop_tools_msgs::IncrementResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::teleop_tools_msgs::IncrementResult_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // TELEOP_TOOLS_MSGS_MESSAGE_INCREMENTRESULT_H