import re
import sugar
import strutils




# Validation Rules 

let underMaxLength = (mail: string) => mail.len() < 255

let noDoubleDots = (mail: string) => not mail.contains ".."

let noWhiteSpaces = (mail: string) => not mail.contains Whitespace + Newlines

let username = re"@[A-Za-z][A-Za-z0-9_\.]+"

let display = (mail: string) => mail.findAll(username)[0]

let hasDisplay = (mail: string) => len(display(mail)) != 0

let isValidDisplay = (mail: string) => not mail.display.contains {'-'}

let domain = re"@[A-Za-z][A-Za-z0-9\-]+\.[A-Za-z]+"

let hasDomain = (mail: string) => mail.findAll(domain).len() != 0

let getDomain = (mail: string) => mail.findAll(domain)[0]

let hasOneAtSign = (mail: string) => mail.contains("@") and mail.count("@") == 1

let notStartWithNumbers = (mail: string) => mail[0] notin {'0'..'9'}

let excludeInvalidSymbols = (mail: string) => not mail.contains {'&','=','\'','<','>','/','\\'}


# Expose functions to detect Gmail | Outlook | QQ ...
#let isGmail*(mail: string) => mail.isEmail and mail.getDomain.match(re"gmail.com")
#let isOutlook*(mail: string) => mail.isEmail and mail.getDomain.match(re"")
#let isYahoo*(mail: string) => mail.isEmail and mail.getDomain.match(re"@yahoo.com")
#let isiCloud*(mail: string) => mail.isEmail and mail.getDomain.match(re"@icloud.com")
#let isQq* = (mail: string) => mail.isEmail and mail.getDomain.match(re"@qq.com")




proc isEmail*(mail: string): bool = mail.hasOneAtSign and mail.hasDomain and mail.hasDisplay and mail.display.isValidDisplay and mail.excludeInvalidSymbols and mail.noWhiteSpaces and mail.noDoubleDots and mail.notStartWithNumbers and mail.underMaxLength
