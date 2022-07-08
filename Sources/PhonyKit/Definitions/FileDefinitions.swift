import Foundation

public class FileDefinitions: Definitions {
    private lazy var defaultFile: DefinitionsFile? = self.loadDefinitionsFile("DefaultDefinitions")
    private var file: DefinitionsFile?

    init(fileName: String) {
        self.file = self.loadDefinitionsFile(fileName)
    }

    public init(file: URL) {
        self.file = self.loadDefinitionsFile(file)
    }

    private func loadDefinitionsFile(_ name: String) -> DefinitionsFile? {
        guard let url = Bundle.module.url(forResource: name, withExtension: "json") else { return nil }
        return self.loadDefinitionsFile(url)
    }

    private func loadDefinitionsFile(_ url: URL) -> DefinitionsFile? {
        guard let data = try? Data(contentsOf: url),
              let file = try? JSONDecoder().decode(DefinitionsFile.self, from: data) else { return nil }
        return file
    }

    public var colors: [String] { self.file?.colors ?? self.defaultFile?.colors ?? [] }
    public var departments: [String] { self.file?.departments ?? self.defaultFile?.departments ?? [] }
    public var productAdjective: [String] { self.file?.productAdjective ?? self.defaultFile?.productAdjective ?? [] }
    public var productMaterial: [String] { self.file?.productMaterial ?? self.defaultFile?.productMaterial ?? [] }
    public var productProduct: [String] { self.file?.productProduct ?? self.defaultFile?.productProduct ?? [] }
    public var femaleFirstName: [String] { self.file?.femaleFirstName ?? self.defaultFile?.femaleFirstName ?? [] }
    public var maleFirstName: [String] { self.file?.maleFirstName ?? self.defaultFile?.maleFirstName ?? [] }
    public var lastName: [String] { self.file?.lastName ?? self.defaultFile?.lastName ?? [] }
    public var titleDecriptor: [String] { self.file?.titleDecriptor ?? self.defaultFile?.titleDecriptor ?? [] }
    public var titleLevel: [String] { self.file?.titleLevel ?? self.defaultFile?.titleLevel ?? [] }
    public var titleJob: [String] { self.file?.titleJob ?? self.defaultFile?.titleJob ?? [] }
    public var companyAdjective: [String] { self.file?.companyAdjective ?? self.defaultFile?.companyAdjective ?? [] }
    public var companyBsAdjective: [String] { self.file?.companyBsAdjective ?? self.defaultFile?.companyBsAdjective ?? [] }
    public var companyBsNoun: [String] { self.file?.companyBsNoun ?? self.defaultFile?.companyBsNoun ?? [] }
    public var companyBsVerb: [String] { self.file?.companyBsVerb ?? self.defaultFile?.companyBsVerb ?? [] }
    public var companyDescriptor: [String] { self.file?.companyDescriptor ?? self.defaultFile?.companyDescriptor ?? [] }
    public var companyNoun: [String] { self.file?.companyNoun ?? self.defaultFile?.companyNoun ?? [] }
    public var hackerAbbreviation: [String] { self.file?.hackerAbbreviation ?? self.defaultFile?.hackerAbbreviation ?? [] }
    public var hackerAdjective: [String] { self.file?.hackerAdjective ?? self.defaultFile?.hackerAdjective ?? [] }
    public var hackerIngVerb: [String] { self.file?.hackerIngVerb ?? self.defaultFile?.hackerIngVerb ?? [] }
    public var hackerNoun: [String] { self.file?.hackerNoun ?? self.defaultFile?.hackerNoun ?? [] }
    public var hackerVerb: [String] { self.file?.hackerVerb ?? self.defaultFile?.hackerVerb ?? [] }
    public var avatarUri: [String] { self.file?.avatarUri ?? self.defaultFile?.avatarUri ?? [] }
    public var videoUris: [String] { self.file?.videoUris ?? self.defaultFile?.videoUris ?? [] }
    public var buildingNumber: [String] { self.file?.buildingNumber ?? self.defaultFile?.buildingNumber ?? [] }
    public var city: [String] { self.file?.city ?? self.defaultFile?.city ?? [] }
    public var cityPrefix: [String] { self.file?.cityPrefix ?? self.defaultFile?.cityPrefix ?? [] }
    public var citySuffix: [String] { self.file?.citySuffix ?? self.defaultFile?.citySuffix ?? [] }
    public var country: [String] { self.file?.country ?? self.defaultFile?.country ?? [] }
    public var countryCode: [String] { self.file?.countryCode ?? self.defaultFile?.countryCode ?? [] }
    public var county: [String] { self.file?.county ?? self.defaultFile?.county ?? [] }
    public var defaultCountry: [String] { self.file?.defaultCountry ?? self.defaultFile?.defaultCountry ?? [] }
    public var direction: [String] { self.file?.direction ?? self.defaultFile?.direction ?? [] }
    public var directionAbbr: [String] { self.file?.directionAbbr ?? self.defaultFile?.directionAbbr ?? [] }
    public var postcode: [String] { self.file?.postcode ?? self.defaultFile?.postcode ?? [] }
    public var secondaryAddress: [String] { self.file?.secondaryAddress ?? self.defaultFile?.secondaryAddress ?? [] }
    public var state: [String] { self.file?.state ?? self.defaultFile?.state ?? [] }
    public var stateAbbr: [String] { self.file?.stateAbbr ?? self.defaultFile?.stateAbbr ?? [] }
    public var streetAddress: [String] { self.file?.streetAddress ?? self.defaultFile?.streetAddress ?? [] }
    public var streetName: [String] { self.file?.streetName ?? self.defaultFile?.streetName ?? [] }
    public var streetSuffix: [String] { self.file?.streetSuffix ?? self.defaultFile?.streetSuffix ?? [] }
    public var streetPrefix: [String] { self.file?.streetPrefix ?? self.defaultFile?.streetPrefix ?? [] }
    public var timeZone: [String] { self.file?.timeZone ?? self.defaultFile?.timeZone ?? [] }
    public var name: [String] { self.file?.name ?? self.defaultFile?.name ?? [] }
    public var maleNamePrefix: [String] { self.file?.maleNamePrefix ?? self.defaultFile?.maleNamePrefix ?? [] }
    public var femaleNamePrefix: [String] { self.file?.femaleNamePrefix ?? self.defaultFile?.femaleNamePrefix ?? [] }
    public var maleNameSuffix: [String] { self.file?.maleNameSuffix ?? self.defaultFile?.maleNameSuffix ?? [] }
    public var femaleNameSuffix: [String] { self.file?.femaleNameSuffix ?? self.defaultFile?.femaleNameSuffix ?? [] }
    public var lorem: [String] { self.file?.lorem ?? self.defaultFile?.lorem ?? [] }
    public var companySuffix: [String] { self.file?.companySuffix ?? self.defaultFile?.companySuffix ?? [] }
    public var months: [String] { self.file?.months ?? self.defaultFile?.months ?? [] }
    public var monthsAbbreviated: [String] { self.file?.monthsAbbreviated ?? self.defaultFile?.monthsAbbreviated ?? [] }
    public var weekdays: [String] { self.file?.weekdays ?? self.defaultFile?.weekdays ?? [] }
    public var weekdaysAbbreviated: [String] { self.file?.weekdaysAbbreviated ?? self.defaultFile?.weekdaysAbbreviated ?? [] }
    public var phoneNumberFormats: [String] { self.file?.phoneNumberFormats ?? self.defaultFile?.phoneNumberFormats ?? [] }
    public var websites: [String] { self.file?.websites ?? self.defaultFile?.websites ?? [] }
}
