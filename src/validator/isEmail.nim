import re
import sugar
import strutils




# Validation Rules 
# More coming...

let underMaxLength = (text: string) => text.len() < 255

let noDoubleDots = (text: string) => not text.contains ".."

let noWhiteSpaces = (text: string) => not text.contains Whitespace + Newlines

let username = re"@[A-Za-z][A-Za-z0-9_\.]+"

let display = (text: string) => text.findAll(username)[0]

let hasDisplay = (text: string) => len(display(text)) != 0

let isValidDisplay = (text: string) => not text.display.contains {'-'}

let domain = re"@[A-Za-z][A-Za-z0-9\-]+\.[A-Za-z]+"

let hasDomain = (text: string) => text.findAll(domain).len() != 0

let getDomain = (text: string) => text.findAll(domain)[0]

let hasOneAtSign = (text: string) => text.contains("@") and text.count("@") == 1

let notStartWithNumbers = (text: string) => text[0] notin {'0'..'9'}

let excludeInvalidSymbols = (text: string) => not text.contains {'&','=','\'','<','>','/','\\'}


# Expose functions to detect Gmail | Outlook | QQ ...
#let gmail* = (mail: string) => isEmail(mail) and mail.getDomain.match()
#let outlook*
#let yahoo*
#let icloud*
#let qq*
#let neatease*
#let sina*






let allChecksPassed = (text: string) => text.hasOneAtSign and text.hasDomain and text.hasDisplay and text.display.isValidDisplay and text.excludeInvalidSymbols and text.noWhiteSpaces and text.noDoubleDots and text.notStartWithNumbers and text.underMaxLength




proc isEmail*(entry: string): bool  = entry.allChecksPassed()
