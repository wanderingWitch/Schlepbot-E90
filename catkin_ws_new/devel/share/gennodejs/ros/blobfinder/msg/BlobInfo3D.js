// Auto-generated. Do not edit!

// (in-package blobfinder.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BlobInfo = require('./BlobInfo.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class BlobInfo3D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.blob = null;
      this.position = null;
      this.have_pos = null;
    }
    else {
      if (initObj.hasOwnProperty('blob')) {
        this.blob = initObj.blob
      }
      else {
        this.blob = new BlobInfo();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new geometry_msgs.msg.Point32();
      }
      if (initObj.hasOwnProperty('have_pos')) {
        this.have_pos = initObj.have_pos
      }
      else {
        this.have_pos = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BlobInfo3D
    // Serialize message field [blob]
    bufferOffset = BlobInfo.serialize(obj.blob, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = geometry_msgs.msg.Point32.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [have_pos]
    bufferOffset = _serializer.bool(obj.have_pos, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BlobInfo3D
    let len;
    let data = new BlobInfo3D(null);
    // Deserialize message field [blob]
    data.blob = BlobInfo.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = geometry_msgs.msg.Point32.deserialize(buffer, bufferOffset);
    // Deserialize message field [have_pos]
    data.have_pos = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 41;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blobfinder/BlobInfo3D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f3d0e6635e357b0e6fe0e98d803150c5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new BlobInfo3D(null);
    if (msg.blob !== undefined) {
      resolved.blob = BlobInfo.Resolve(msg.blob)
    }
    else {
      resolved.blob = new BlobInfo()
    }

    if (msg.position !== undefined) {
      resolved.position = geometry_msgs.msg.Point32.Resolve(msg.position)
    }
    else {
      resolved.position = new geometry_msgs.msg.Point32()
    }

    if (msg.have_pos !== undefined) {
      resolved.have_pos = msg.have_pos;
    }
    else {
      resolved.have_pos = false
    }

    return resolved;
    }
};

module.exports = BlobInfo3D;
