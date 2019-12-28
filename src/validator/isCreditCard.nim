import re
import sugar
import strutils



let patterns = (re"^5[1-5]\d{14}$", re"^3[47][0-9]{13}$", re"^4[0-9]{12}(?:[0-9]{3})?$", re"^65[4-9][0-9]{13}|64[4-9][0-9]{13}|6011[0-9]{12}|(622(?:12[6-9]|1[3-9][0-9]|[2-8][0-9][0-9]|9[01][0-9]|92[0-5])[0-9]{10})$",re"^(?:2131|1800|35[0-9]{3})[0-9]{11}$", re"^3(?:0[0-5]|[68][0-9])[0-9]{11}$", re"^(5018|5081|5044|5020|5038|603845|6304|6759|676[1-3]|6799|6220|504834|504817|504645)[0-9]{8,15}$")
let (mcs, amex, vs, dsc, jc, dns, mst) = patterns



let isMastercard* = (card: string) => card.match(mcs)

let isAmericanExpress* = (card: string) => card.match(amex)

let isVisa* = (card: string) => card.match(vs)

let isDiscover* = (card: string) => card.match(dsc)

let isJCB* = (card: string) => card.match(jc)

let isDiners* = (card: string) => card.match(dns)

let isMaestro* = (card: string) => card.match(mst)



let testCard = (card: string) => card.isMastercard or card.isVisa or card.isAmericanExpress or card.isDiscover or card.isJCB or card.isDiners or card.isMaestro



proc isCreditCard*(card: string): bool = card.testCard()
