// Generated by gencpp from file blobfinder/MultiBlobInfo3D.msg
// DO NOT EDIT!


#ifndef BLOBFINDER_MESSAGE_MULTIBLOBINFO3D_H
#define BLOBFINDER_MESSAGE_MULTIBLOBINFO3D_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <blobfinder/BlobInfo3D.h>

namespace blobfinder
{
template <class ContainerAllocator>
struct MultiBlobInfo3D_
{
  typedef MultiBlobInfo3D_<ContainerAllocator> Type;

  MultiBlobInfo3D_()
    : header()
    , blobs()  {
    }
  MultiBlobInfo3D_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , blobs(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::blobfinder::BlobInfo3D_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::blobfinder::BlobInfo3D_<ContainerAllocator> >::other >  _blobs_type;
  _blobs_type blobs;




  typedef boost::shared_ptr< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> const> ConstPtr;

}; // struct MultiBlobInfo3D_

typedef ::blobfinder::MultiBlobInfo3D_<std::allocator<void> > MultiBlobInfo3D;

typedef boost::shared_ptr< ::blobfinder::MultiBlobInfo3D > MultiBlobInfo3DPtr;
typedef boost::shared_ptr< ::blobfinder::MultiBlobInfo3D const> MultiBlobInfo3DConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ad81f6155f05d3496d2b636a8a776843";
  }

  static const char* value(const ::blobfinder::MultiBlobInfo3D_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xad81f6155f05d349ULL;
  static const uint64_t static_value2 = 0x6d2b636a8a776843ULL;
};

template<class ContainerAllocator>
struct DataType< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "blobfinder/MultiBlobInfo3D";
  }

  static const char* value(const ::blobfinder::MultiBlobInfo3D_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
BlobInfo3D[] blobs\n\
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
MSG: blobfinder/BlobInfo3D\n\
BlobInfo blob\n\
geometry_msgs/Point32 position\n\
bool have_pos\n\
\n\
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
\n\
================================================================================\n\
MSG: geometry_msgs/Point32\n\
# This contains the position of a point in free space(with 32 bits of precision).\n\
# It is recommeded to use Point wherever possible instead of Point32.  \n\
# \n\
# This recommendation is to promote interoperability.  \n\
#\n\
# This message is designed to take up less space when sending\n\
# lots of points at once, as in the case of a PointCloud.  \n\
\n\
float32 x\n\
float32 y\n\
float32 z\n\
";
  }

  static const char* value(const ::blobfinder::MultiBlobInfo3D_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.blobs);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MultiBlobInfo3D_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::blobfinder::MultiBlobInfo3D_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::blobfinder::MultiBlobInfo3D_<ContainerAllocator>& v)
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
      Printer< ::blobfinder::BlobInfo3D_<ContainerAllocator> >::stream(s, indent + "    ", v.blobs[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // BLOBFINDER_MESSAGE_MULTIBLOBINFO3D_H