# PhonyKit

## A port of [Faker.js](https://github.com/marak/Faker.js/) to Swift

## Usage

```
    import PhonyKit
    
    ...

    var randomName = Phony.default.fullName(); // Rowan Nikolaus
    var randomEmail = Phony.default.email(); // Kassandra.Haley@gmail.com
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
