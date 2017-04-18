// Auto-generated. Do not edit!

// (in-package blobfinder.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BlobInfo3D = require('./BlobInfo3D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MultiBlobInfo3D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.blobs = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('blobs')) {
        this.blobs = initObj.blobs
      }
      else {
        this.blobs = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MultiBlobInfo3D
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [blobs]
    // Serialize the length for message field [blobs]
    bufferOffset = _serializer.uint32(obj.blobs.length, buffer, bufferOffset);
    obj.blobs.forEach((val) => {
      bufferOffset = BlobInfo3D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MultiBlobInfo3D
    let len;
    let data = new MultiBlobInfo3D(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [blobs]
    // Deserialize array length for message field [blobs]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.blobs = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.blobs[i] = BlobInfo3D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 41 * object.blobs.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blobfinder/MultiBlobInfo3D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ad81f6155f05d3496d2b636a8a776843';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    BlobInfo3D[] blobs
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: blobfinder/BlobInfo3D
    BlobInfo blob
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
    float32 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MultiBlobInfo3D(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.blobs !== undefined) {
      resolved.blobs = new Array(msg.blobs.length);
      for (let i = 0; i < resolved.blobs.length; ++i) {
        resolved.blobs[i] = BlobInfo3D.Resolve(msg.blobs[i]);
      }
    }
    else {
      resolved.blobs = []
    }

    return resolved;
    }
};

module.exports = MultiBlobInfo3D;
