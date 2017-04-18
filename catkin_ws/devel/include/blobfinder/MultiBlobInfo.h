// Generated by gencpp from file blobfinder/MultiBlobInfo.msg
// DO NOT EDIT!


#ifndef BLOBFINDER_MESSAGE_MULTIBLOBINFO_H
#define BLOBFINDER_MESSAGE_MULTIBLOBINFO_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <blobfinder/BlobInfo.h>

namespace blobfinder
{
template <class ContainerAllocator>
struct MultiBlobInfo_
{
  typedef MultiBlobInfo_<ContainerAllocator> Type;

  MultiBlobInfo_()
    : header()
    , blobs()  {
    }
  MultiBlobInfo_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , blobs(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::blobfinder::BlobInfo_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::blobfinder::BlobInfo_<ContainerAllocator> >::other >  _blobs_type;
  _blobs_type blobs;




  typedef boost::shared_ptr< ::blobfinder::MultiBlobInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::blobfinder::MultiBlobInfo_<ContainerAllocator> const> ConstPtr;

}; // struct MultiBlobInfo_

typedef ::blobfinder::MultiBlobInfo_<std::allocator<void> > MultiBlobInfo;

typedef boost::shared_ptr< ::blobfinder::MultiBlobInfo > MultiBlobInfoPtr;
typedef boost::shared_ptr< ::blobfinder::MultiBlobInfo const> MultiBlobInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::blobfinder::MultiBlobInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::blobfinder::MultiBlobInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace blobfinder

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'blobfinder': ['/home/schleppy/catkin_ws/src/blobfinder/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::blobfinder::MultiBlobInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::blobfinder::MultiBlobInfo_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::blobfinder::MultiBlobInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::blobfinder::MultiBlobInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::blobfinder::MultiBlobInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::blobfinder::MultiBlobInfo_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::blobfinder::MultiBlobInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0ad554d567734dc08d6c7fd37fb32b20";
  }

  static const char* value(const ::blobfinder::MultiBlobInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0ad554d567734dc0ULL;
  static const uint64_t static_value2 = 0x8d6c7fd37fb32b20ULL;
};

template<class ContainerAllocator>
struct DataType< ::blobfinder::MultiBlobInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "blobfinder/MultiBlobInfo";
  }

  static const char* value(const ::blobfinder::MultiBlobInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::blobfinder::MultiBlobInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
BlobInfo[] blobs\n\
\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: blobfinder/BlobInfo\n\
float32 cx\n\
float32 cy\n\
float32 area\n\
float32 ux\n\
float32 uy\n\
float32 vx\n\
float32 vy\n\
";
  }

  static const char* value(const ::blobfinder::MultiBlobInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::blobfinder::MultiBlobInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.blobs);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MultiBlobInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::blobfinder::MultiBlobInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::blobfinder::MultiBlobInfo_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "blobs[]" << std::endl;
    for (size_t i = 0; i < v.blobs.size(); ++i)
    {
      s << indent << "  blobs[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::blobfinder::BlobInfo_<ContainerAllocator> >::stream(s, indent + "    ", v.blobs[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // BLOBFINDER_MESSAGE_MULTIBLOBINFO_H