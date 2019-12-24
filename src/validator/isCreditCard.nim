import re
import sugar
import strutils
#import unpack


let patterns = (re"^5[1-5]\d{14}$", re"^3[47][0-9]{13}$", re"^4[0-9]{12}(?:[0-9]{3})?$", re"^65[4-9][0-9]{13}|64[4-9][0-9]{13}|6011[0-9]{12}|(622(?:12[6-9]|1[3-9][0-9]|[2-8][0-9][0-9]|9[01][0-9]|92[0-5])[0-9]{10})$",re"^(?:2131|1800|35[0-9]{3})[0-9]{11}$", re"^3(?:0[0-5]|[68][0-9])[0-9]{11}$", re"^(5018|5081|5044|5020|5038|603845|6304|6759|676[1-3]|6799|6220|504834|504817|504645)[0-9]{8,15}$")
let (mcs, amex, vs, dsc, jc, dns, mst) = patterns



let exists = (matches: seq[string]) => matches.len() != 0

let mastercard = (card: string) => card.findAll(mcs).exists

let americanExpress = (card: string) => card.findAll(amex).exists

let visa = (card: string) => card.findAll(vs).exists

let discover = (card: string) => card.findAll(dsc).exists

let JCB = (card: string) => card.findAll(jc).exists

let diners = (card: string) => card.findAll(dns).exists

let maestro = (card: string) => card.findAll(mst).exists

let testCard = (card: string) => card.mastercard or card.visa or card.americanExpress or
card.discover or card.JCB or card.diners or card.maestro



proc isCreditCard*(card: string): bool = card.testCard()
