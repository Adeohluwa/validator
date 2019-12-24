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

let getDomain = (text: string) => text.findAll(domains)[0]

let hasOneAtSign = (text: string) => text.contains("@") and text.count("@") == 1

let notStartWithNumbers = (text: string) => text[0] notin {'0'..'9'}

let excludeInvalidSymbols = (text: string) => not text.contains {'&','=','\'','+','<','>','-','/','\\',' '}

let allChecksPassed = (text: string) => text.hasOneAtSign and text.hasDomain and text.hasDisplay and text.display.isValidDisplay and text.excludeInvalidSymbols and text.noWhiteSpaces and text.noDoubleDots and text.notStartWithNumbers and text.underMaxLength




proc isEmail*(entry: string): bool  = entry.allChecksPassed()
