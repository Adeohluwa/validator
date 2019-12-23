import re
import sugar
import strutils




#let isProperEconding

let underMaxLength = (text: string) => text.len() < 255

let noDoubleDots = (text: string) => not text.contains ".."

let noWhiteSpaces = (text: string) => not text.contains Whitespace + Newlines

let username = re"@[A-Za-z][A-Za-z0-9_\.]+"

let display = (text: string) => text.findAll(username)[0]

let hasDisplay = (text: string) => len(display(text)) > 0

let isValidDisplay = (text: string) => true

let domains = re"@[A-Za-z]+\.[A-Za-z]+"

let hasDomain = (text: string) => text.findAll(domains).len() != 0

let hasOneAtSign = (text: string) => text.contains("@") and text.count("@") == 1

let notStartWithNumbers = (text: string) => text[0] notin {'0'..'9'}

let excludeInvalidSymbols = (text: string) => not text.contains {'&','=','\'','+','<','>','-','/','\\',' '}




proc isEmail*(entry: string): bool =
  if entry.hasOneAtSign:
    if entry.hasDomain:
      if entry.hasDisplay:
        if entry.display.isValidDisplay:
          if entry.excludeInvalidSymbols:
            if entry.noWhiteSpaces:
              if entry.noDoubleDots:
                if entry.notStartWithNumbers:
                  if entry.underMaxLength:
                    return true
  return false


when defined(test):
  assert isEmail("adejumoadeoluwa@gmail.com")   == true
  assert isEmail("9adejumoadeoluwa@gmail.com")  == false
  assert isEmail("a.dejumoadeoluwa@gmail.com")  == true
  assert isEmail("adejumoadeoluwagmail.com")    == false
  assert isEmail("adejumoadeoluwa@~~~~.com")    == false
  echo "Tests Successful"
