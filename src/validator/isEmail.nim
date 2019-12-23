import re
import sugar
import strutils
import sequtils





#let underMaxLength = 64
let hasAtSign = (text: string) => text.contains "@"

let excludeInvalidSymbols = (text: string) => not text.contains {'&','=','\'','+','<','>','-','/','\\',' '}

let domains = re"@[A-Za-z]+\.[A-Za-z]+"

let hasDomain = (text: string) => text.findAll(domains).len() != 0

let noDoubleDots = (text: string) => not text.contains ".."

let notStartWithNumbers = (text: string) => text[0] notin {'0'..'9'}





proc isEmail*(entry: string): bool =
  if entry.hasAtSign:
    if entry.hasDomain:
      if entry.excludeInvalidSymbols:
        if entry.noDoubleDots:
          if entry.notStartWithNumbers:
            return true
  return false
