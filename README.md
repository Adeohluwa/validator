# Validator

[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](./LICENSE)
[![Build Status](https://travis-ci.org/Adeohluwa/validator.svg?branch=master)](https://travis-ci.org/Adeohluwa/validator)
![Build Status](https://img.shields.io/github/last-commit/adeohluwa/validator?style=flat-square)

This library provides several functions to validate real world data types

## Installation
```bash
$ nimble install validator
```

## Tests
```bash
$ nimble test
```


Validators            |     Description         |     Sub functions
----------------------|-------------------------|------------------------------------------------------------
isEmail(text: **string**): **bool**              | Check if string is an email address. |   [isGmail](https://github.com/Adeohluwa/validator/blob/e9111bd100deed419936a85abb448c16530ff1bb/src/validator/isEmail.nim#L43),isOutlook,isYahoo,isiCloud,isQq
isCreditCard(text: **string**): **bool** | Check if string is a valid credit card number.| [isMastercard](https://github.com/Adeohluwa/validator/blob/e9111bd100deed419936a85abb448c16530ff1bb/src/validator/isCreditCard.nim#L12),isAmericanExpress,isVisa,isJCB, isDiners, isMaestro
isIP(text: **string**): **bool** | Check if string is an IP address.| [isIPv4](https://github.com/Adeohluwa/validator/blob/893c315e47e48b2d7b29a5807efbbf2b7444a30e/src/validator/isIP.nim#L14),isIPv6
