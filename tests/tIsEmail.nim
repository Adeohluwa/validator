import unittest
import validator/isEmail



suite "Email validation rules":

  test "Must not start with number":
    check isEmail("9adejumoadeoluwa@gmail.com")         == false

  test "Email has domain":
    check isEmail("adejumoadeoluwagmail.com")           == false

  test "Email domain must be 7bit Ascii":
    check isEmail("adejumoadeoluwa@~~~~.com")           == false

  test "Allow dot character":
    check isEmail("a.dejumoadeoluwa@gmail.com")         == true
  
  test "Exclude double dots":
    check isEmail("adejumoa..deoluwa@gmail.com")        == false

  test "Allow + character":
    check isEmail("adejumoadeoluwa+alerts@gmail.com")   == true

  test "Allow dash in domain":
    check isEmail("adejumoadeoluwa@gmail-test.com")     == true

  test "Allow numbers in domain":
    check isEmail("adejumoadeoluwa@gmail3.com")         == true

  test "Exclude Whitespaces":
    check isEmail("a dejumoadeoluwa@gmail.com")         == false
    check isEmail("a\ndejumoadeoluwa@gmail.com")        == false
    check isEmail("a\tdejumoadeoluwa@gmail.com")        == false


  test "Detect several email providers":
    check isGmail("adejumoadeoluwa@gmail.com")          == true
    check isYahoo("adejumoadeoluwa@yahoo.com")          == true
    check isOutlook("adejumoadeoluwa@outlook.com")      == true
    check isIcloud("adejumoadeoluwa@icloud.com")        == true
    check isQQ("adejumoadeoluwa@qq.com")                == true
