import unittest
import validator/isIP




suite "IP Address Validation":
  
  test "IPv4 works":
    check isIPv4("5555.44445.5554.444")     == false
    check isIPv4("196.0.0.1")               == true
  
  #test "IPv6 works":
  #  check isIPv6("3782.822.4631.0005")      == false