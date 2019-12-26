# Validator
This library provides several functions to validate real world data types



## Tests
```bash
$ nimble test
```


Validators            |     Description         |     Sub functions
----------------------|-------------------------|------------------------------------------------------------
isEmail(text: **string**): **bool**              | Check if string is an email address. |   gmail,outlook,yahoo,icloud,qq
isCreditCard(text: **string**): **bool**         | Check if string is a valid credit card number.| mastercard,americanExpress,visa,JCB, diners, maestro
