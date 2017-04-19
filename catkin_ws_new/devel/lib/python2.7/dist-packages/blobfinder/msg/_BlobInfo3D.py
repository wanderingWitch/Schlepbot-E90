# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from blobfinder/BlobInfo3D.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import blobfinder.msg
import geometry_msgs.msg

class BlobInfo3D(genpy.Message):
  _md5sum = "f3d0e6635e357b0e6fe0e98d803150c5"
  _type = "blobfinder/BlobInfo3D"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """BlobInfo blob
geometry_msgs/Point32 position
bool have_pos


================================================================================
MSG: blobfinder/BlobInfo
float32 cx
float32 cy
float32 area
float32 ux
float32 uy
float32 vx
float32 vy

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z"""
  __slots__ = ['blob','position','have_pos']
  _slot_types = ['blobfinder/BlobInfo','geometry_msgs/Point32','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       blob,position,have_pos

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(BlobInfo3D, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.blob is None:
        self.blob = blobfinder.msg.BlobInfo()
      if self.position is None:
        self.position = geometry_msgs.msg.Point32()
      if self.have_pos is None:
        self.have_pos = False
    else:
      self.blob = blobfinder.msg.BlobInfo()
      self.position = geometry_msgs.msg.Point32()
      self.have_pos = False

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_10fB().pack(_x.blob.cx, _x.blob.cy, _x.blob.area, _x.blob.ux, _x.blob.uy, _x.blob.vx, _x.blob.vy, _x.position.x, _x.position.y, _x.position.z, _x.have_pos))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.blob is None:
        self.blob = blobfinder.msg.BlobInfo()
      if self.position is None:
        self.position = geometry_msgs.msg.Point32()
      end = 0
      _x = self
      start = end
      end += 41
      (_x.blob.cx, _x.blob.cy, _x.blob.area, _x.blob.ux, _x.blob.uy, _x.blob.vx, _x.blob.vy, _x.position.x, _x.position.y, _x.position.z, _x.have_pos,) = _get_struct_10fB().unpack(str[start:end])
      self.have_pos = bool(self.have_pos)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_10fB().pack(_x.blob.cx, _x.blob.cy, _x.blob.area, _x.blob.ux, _x.blob.uy, _x.blob.vx, _x.blob.vy, _x.position.x, _x.position.y, _x.position.z, _x.have_pos))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.blob is None:
        self.blob = blobfinder.msg.BlobInfo()
      if self.position is None:
        self.position = geometry_msgs.msg.Point32()
      end = 0
      _x = self
      start = end
      end += 41
      (_x.blob.cx, _x.blob.cy, _x.blob.area, _x.blob.ux, _x.blob.uy, _x.blob.vx, _x.blob.vy, _x.position.x, _x.position.y, _x.position.z, _x.have_pos,) = _get_struct_10fB().unpack(str[start:end])
      self.have_pos = bool(self.have_pos)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_10fB = None
def _get_struct_10fB():
    global _struct_10fB
    if _struct_10fB is None:
        _struct_10fB = struct.Struct("<10fB")
    return _struct_10fB
