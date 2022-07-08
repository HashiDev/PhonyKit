public protocol Definitions {
    var colors: [String] { get }
    var departments: [String] { get }
    var productAdjective: [String] { get }
    var productMaterial: [String] { get }
    var productProduct: [String] { get }
    var femaleFirstName: [String] { get }
    var maleFirstName: [String] { get }
    var lastName: [String] { get }
    var titleDecriptor: [String] { get }
    var titleLevel: [String] { get }
    var titleJob: [String] { get }
    var companyAdjective: [String] { get }
    var companyBsAdjective: [String] { get }
    var companyBsNoun: [String] { get }
    var companyBsVerb: [String] { get }
    var companyDescriptor: [String] { get }
    var companyNoun: [String] { get }
    var hackerAbbreviation: [String] { get }
    var hackerAdjective: [String] { get }
    var hackerIngVerb: [String] { get }
    var hackerNoun: [String] { get }
    var hackerVerb: [String] { get }
    var avatarUri: [String] { get }
    var videoUris: [String] { get }

    var buildingNumber: [String] { get }
    var city: [String] { get }
    var cityPrefix: [String] { get }
    var citySuffix: [String] { get }
    var country: [String] { get }
    var countryCode: [String] { get }
    var county: [String] { get }
    var defaultCountry: [String] { get }
    var direction: [String] { get }
    var directionAbbr: [String] { get }
    var postcode: [String] { get }
    var secondaryAddress: [String] { get }
    var state: [String] { get }
    var stateAbbr: [String] { get }
    var streetAddress: [String] { get }
    var streetName: [String] { get }
    var streetSuffix: [String] { get }
    var streetPrefix: [String] { get }
    var timeZone: [String] { get }
    var name: [String] { get }
    var maleNamePrefix: [String] { get }
    var femaleNamePrefix: [String] { get }
    var maleNameSuffix: [String] { get }
    var femaleNameSuffix: [String] { get }
    var lorem: [String] { get }
    var companySuffix: [String] { get }
    var months: [String] { get }
    var monthsAbbreviated: [String] { get }
    var weekdays: [String] { get }
    var weekdaysAbbreviated: [String] { get }
    var phoneNumberFormats: [String] { get }
    var websites: [String] { get }
}

extension Definitions {
    // This isn't good for performance.
    var firstName: [String] { (self.femaleFirstName + self.maleFirstName).sorted() }
}
