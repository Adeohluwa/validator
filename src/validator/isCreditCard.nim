import re
import sugar
import strutils



let patterns = @[re"^5[1-5]\d{14}$", re"^3[47][0-9]{13}$", re"^4[0-9]{12}(?:[0-9]{3})?$", re"^65[4-9][0-9]{13}|64[4-9][0-9]{13}|6011[0-9]{12}|(622(?:12[6-9]|1[3-9][0-9]|[2-8][0-9][0-9]|9[01][0-9]|92[0-5])[0-9]{10})$",re"^(?:2131|1800|35[0-9]{3})[0-9]{11}$", re"^3(?:0[0-5]|[68][0-9])[0-9]{11}$", re"^(5018|5081|5044|5020|5038|603845|6304|6759|676[1-3]|6799|6220|504834|504817|504645)[0-9]{8,15}$"]



let exists = (text: seq[string]) => text.len() != 0

let mastercard = (text: string) => text.findAll(patterns[0]).exists

let americanExpress = (text: string) => text.findAll(patterns[1]).exists

let visa = (text: string) => text.findAll(patterns[2]).exists

let discover = (text: string) => text.findAll(patterns[3]).exists

let JCB = (text: string) => text.findAll(patterns[4]).exists

let diners = (text: string) => text.findAll(patterns[5]).exists

let maestro = (text: string) => text.findAll(patterns[6]).exists

let testCard = (text: string) => text.mastercard or text.visa or text.americanExpress or text.discover or text.JCB or text.diners or text.maestro




proc isCreditCard*(entry: string): bool = entry.testCard()



when defined(test):
  assert isCreditCard("5555444455554444") == true
  assert isCreditCard("378282246310005")  == true
  assert isCreditCard("4242424242424242") == true
  assert isCreditCard("6011111111111117") == true
  echo "Tests Successful"
