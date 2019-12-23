import sugar
import strutils
import sequtils





#let underMaxLength = 64
let hasAtSign = (text: string) => text.contains "@"

let excludeInvalidSymbols = (text: string) => not text.contains {'&','=','\'','+','<','>','-','/','\\',' '}

#lethasDotmain = (text: string) => text notin {".com"}

let noDoubleDots = (text: string) => not text.contains ".."

let notStartWithNumbers = (text: string) => text[0] notin {'0'..'9'}





proc isEmail*(text: string): bool =
  if text.hasAtSign:
    if text.excludeInvalidSymbols:
      if text.noDoubleDots:
        if text.notStartWithNumbers:
          return true
  return false
