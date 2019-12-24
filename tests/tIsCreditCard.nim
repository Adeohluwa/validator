import unittest
import "../src/validator/isCreditCard.nim"




suite "Credit Card Validation":
  
  test "Mastercard works":
    check isCreditCard("5555444455554444")     == true
  
  test "Amex works":
    check isCreditCard("378282246310005")      == true
  
  test "Visa works":
    check isCreditCard("4242424242424242")     == true
  
  test "Discover card works":
    check isCreditCard("6011111111111117")     == true
