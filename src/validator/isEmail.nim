import re
import sugar
import strutils
import sequtils





let underMaxLength = (text: string) => text.len() < 255

let hasAtSign = (text: string) => text.contains "@"

let excludeInvalidSymbols = (text: string) => not text.contains {'&','=','\'','+','<','>','-','/','\\',' '}

let noWhiteSpaces = (text: string) => not text.contains Whitespace + Newlines

let domains = re"@[A-Za-z]+\.[A-Za-z]+"

let hasDomain = (text: string) => text.findAll(domains).len() != 0

let noDoubleDots = (text: string) => not text.contains ".."

let notStartWithNumbers = (text: string) => text[0] notin {'0'..'9'}





proc isEmail*(entry: string): bool =
  if entry.hasAtSign:
    if entry.hasDomain:
      if entry.excludeInvalidSymbols:
        if entry.noWhiteSpaces:
          if entry.noDoubleDots:
            if entry.notStartWithNumbers:
              if entry.underMaxLength:
                return true
  return false
