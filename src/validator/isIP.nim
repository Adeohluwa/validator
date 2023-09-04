import re
import sugar
import strutils




# Validation Rules 
let v4 = re"^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$"
let v6 = re"^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$"


# Functions to detect IPv4 | IPv6 | ...
let isIPv4* = (ip: string) => ip.match(v4)
let isIPv6* = (ip: string) => ip.match(v6)




proc isIP*(ip: string): bool = ip.match(v4) or ip.match(v6)