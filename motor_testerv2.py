"""
motor_tester.py

Evan Greene
E90 Project.

Sends a sample four-byte code to the serial output.
"""
import serial
import time

def main():

    port = serial.Serial('/dev/cu.usbserial')

    # address = bytearray([128])
    # command = bytearray([1]) # command bytes
    #

    # the bytes 0xFF 0x00 and 0x55
    # HIGH = bytearray([255])
    # LOW = bytearray([0])
    # alternate = bytearray([85])

    """
    List of commands
    0: drive forward motor 1 (data 0-127)
    1: drive backward motor 1 (data 0 - 127)
    2: set min voltage (if the battery drops below this voltage, the driver
        shuts down)
    3: set max voltage (for use with a power supply that can't sink current)
    4: drive forward motor 2 (data 0-127)
    5: drive backward motor 2 (data 0-127)
    6: drive motor 1 (0 for backwards, 64 for stop, 127 for forward)
    7: drive motor 2

    Mixed mode commands (for differential drive vehicles):
    8: Drive forward (data 0-127)
    9: Drive backward (data 0-127)
    10: Turn right
    11: Turn left
    12: Drive forwards / backwards (0 backwards, 64 stop, 127 forward)
    13: Turn right / left (0 left, 64 stop, 127 right)

    There are a few others as well.
    """

    address = bytearray([128])
    command = bytearray([0]) # command bytes

    data = bytearray([0]) # data byte commands the appropriate speed.
    # valid values are between 0 and 127
    checksum = bytearray([(address[0] + command[0] + data[0]) & 0b01111111] )
    # print len(checksum)
    towrite = bytearray()
    for elt in [address, command, data, checksum]:
        towrite.extend(elt)

    # command_turn= bytearray([10])
    #
    # data_turn = bytearray([12])
    # checksum_turn = bytearray([(address[0] + command_turn[0] + data_turn[0]) & 0b01111111] )
    #
    # turn_write = bytearray()
    # for elt in [address, command_turn, data_turn, checksum_turn]:
    #     turn_write.extend(elt)


    # while(1):
    # port.write(address)# Address byte.
    # port.write(command)
    # port.write(data)
    # port.write(checksum)

    print 'about to write', [hex(i) for i in towrite]
    # print 'also about to write', [hex(i) for i in turn_write]
    # print [towrite[i] for i in range(len(towrite))]

    port.write(towrite)
    time.sleep(1)


main()
