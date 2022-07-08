# PhonyKit

## A port of [Faker.js](https://github.com/marak/Faker.js/) to Swift

## Usage

```Swift
    import PhonyKit
    
    ...

    var randomName = Phony.default.fullName() // Henrietta Cremin
    var randomEmail = Phony.default.email() // Ben.Grady@gmail.com
```

## Types of available data
- Address
    - zipCode
    - city
    - cityPrefix
    - citySuffix
    - streetName
    - streetAddress
    - streetSuffix
    - streetPrefix
    - secondaryAddress
    - county
    - country
    - countryCode
    - state
    - stateAbbr
    - direction
- Commerce
    - productColor
    - department
    - productName
    - productAdjective
    - productMaterial
    - product
- Company
    - companyName
    - companySuffix
    - catchPhrase
    - bs
    - catchPhraseAdjective
    - catchPhraseDescriptor
    - catchPhraseNoun
    - bsAdjective
    - bsBuzz
    - bsNoun
- Dates
    - past
    - future
    - between
    - recent
    - soon
    - month
    - weekday
- Hacker
    - hackerAbbreviation
    - hackerAdjective
    - hackerNoun
    - hackerVerb
    - hackerIngVerb
    - hackerPhrase
- Helpers
    - slugify
    - snakify
    - replaceSymbolWithNumber
    - replaceSymbols
    - repeatString
- Images
    - image
    - avatar
    - unsplash
    - picsum
    - dataUri
- Internet
    - email
    - exampleEmail
    - userName
    - protocol
    - url
    - domainName
    - domainSuffix
    - domainWord
    - ipAddress
    - ipv6
    - color
    - macAddress
    - website
- Lorem
    - loremWord
    - loremWords
    - loremSentence
    - loremSlug
    - loremSentences
    - loremParagraph
    - loremParagraphs
    - loremText
    - loremLines
- Name
    - firstName
    - lastName
    - fullName
    - findName
    - jobTitle
    - gender
    - prefix
    - suffix
    - jobDescriptor
    - jobArea
    - jobType
- PhoneNumber
    - phoneNumber
    - phoneFormat
- Random
    - dictionaryElement
    - realWord
    - realWords
    - alpha
    - alphaNumeric
    - hexaDecimal
- Video
    - video

## License

PhonyKit - Copyright (c) 2021 HashiDev https://www.hashi.dev/

faker.js - Copyright (c) 2020 Marak Squires www.marak.com http://github.com/marak/faker.js/

faker.js was inspired by and has used data definitions from:

https://github.com/stympy/faker/ - Copyright (c) 2007-2010 Benjamin Curtis
http://search.cpan.org/~jasonk/Data-Faker-0.07/ - Copyright 2004-2005 by Jason Kohles

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
