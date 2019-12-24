import re
import sugar
import strutils



let patterns = @[""]

let mastercard = (text: string) => true and text.len == 16

let visa = (text: string) => true and text.len == 16

let americanExpress = (text: string) => true and text.len == 15

let discover = (text: string) => true and text.len == 16

let JCB = (text: string) => true and text.len == 16

let diners = (text: string) => true and text.len == 14

let maestro = (text: string) => true and text.len >= 13 and text.len <= 19

let allChecksPassed = (text: string) => text.mastercard or text.visa or text.americanExpress or
text.discover or text.JCB or text.diners or text.maestro




proc isCreditCard*(entry: string): bool = entry.allChecksPassed()



when defined(test):
  assert isCreditCard("5555555555555555")
  echo "Tests Successful"
