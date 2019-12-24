import unittest
import "../src/validator/isEmail.nim"



suite "Email validation rules":

  test "Must not start with number":
    check isEmail("9adejumoadeoluwa@gmail.com")   == false

  test "Email has domain":
    check isEmail("adejumoadeoluwagmail.com")     == false

  test "Email domain must be 7bit Ascii":
    check isEmail("adejumoadeoluwa@~~~~.com")     == false

  test "Include dot character":
    check isEmail("a.dejumoadeoluwa@gmail.com")   == true
  
  test "Exclude double dots":
    check isEmail("adejumoa..deoluwa@gmail.com")  == false

  test "Exclude Whitespaces":
    check isEmail("a dejumoadeoluwa@gmail.com")   == false
    check isEmail("a\ndejumoadeoluwa@gmail.com")  == false
    check isEmail("a\tdejumoadeoluwa@gmail.com")  == false

