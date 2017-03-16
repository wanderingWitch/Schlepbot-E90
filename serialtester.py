"""
serialtester.py

tests to see if I can get serial communications from my macbook
"""
import serial

def main():

    port = serial.Serial('/dev/cu.usbserial')

    # the bytes 0xFF 0x00 and 0x55
    HIGH = bytearray([255])
    LOW = bytearray([0])
    # alternate = bytearray([85])
    alternate = bytearray([HIGH[0], LOW[0]])
    # print len(alternate)
    # print alternate[0], alternate[1]

    while(1):
        port.write(alternate)

main()
