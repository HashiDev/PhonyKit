import Foundation

/// Address
public extension Phony {
    /// This function returns a zip code string for a given format. If no format is given, one is chosen from the selected definitions file.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.zipCode()) // 82729 or 84721-1234
    ///     print(Phony.default.zipCode("#######")) // 4727154
    ///
    /// - Parameter format: The format of the zip code desired.
    ///
    /// - Returns: A mock zip code string.
    func zipCode(_ format: String? = nil) -> String {
        let format = format ?? self.definitions.postcode.randomElement()!
        return self.replaceSymbols(string: format)
    }

    /// This function returns a fake city made from concatenated strings.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.city()) // North Jermaine town
    ///
    /// - Returns: A mock city name string.
    func city() -> String {
        switch Int.random(in: 0...3) {
        case 0:
            return "\(self.cityPrefix()) \(self.firstName(for: nil)) \(self.citySuffix())"
        case 1:
            return "\(self.cityPrefix()) \(self.firstName(for: nil))"
        case 2:
            return "\(self.firstName())\(self.citySuffix().lowercased())"
        default:
            return "\(self.lastName())\(self.citySuffix().lowercased())"
        }
    }

    /// This function returns a city prefix.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.cityPrefix()) // North
    ///
    /// - Returns: A mock city prefix string.
    func cityPrefix() -> String {
        return self.definitions.cityPrefix.randomElement()!
    }

    /// This function returns a city suffix.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.citySuffix()) // shire
    ///
    /// - Returns: A mock city suffix string.
    func citySuffix() -> String {
        return self.definitions.citySuffix.randomElement()!
    }

    /// This function returns a mock street name.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.streetName()) // Lingwall Square
    ///
    /// - Returns: A mock street name string.
    func streetName() -> String {
        var suffix = self.streetSuffix()
        if suffix.isEmpty {
            suffix = " " + suffix
        }

        return Bool.random() ? self.lastName() + suffix : self.firstName() + suffix
    }

    /// This function returns a mock street address with numbers.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.streetAddress(useFullAddress: true)) // 3575 Bruce Alley Apt. 781
    ///     print(Phony.default.streetAddress(useFullAddress: false)) // 3575 Clifton Road
    ///
    /// - Parameter useFullAddress: A Bool that signals whether or not an apartment or suite number should be added.
    ///
    /// - Returns: A mock full street address string.
    func streetAddress(useFullAddress: Bool = false) -> String {
        let string = (1...Int.random(in: 3...5)).reduce("") { partialResult, _ in "\(partialResult)#" }

        let address = "\(self.replaceSymbolWithNumber(string: string)) \(self.streetName())"

        return useFullAddress ? "\(address) \(self.secondaryAddress())" : address
    }

    /// This function returns a mock street suffix.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.streetSuffix()) // Manor
    ///
    /// - Returns: A mock street suffix string.
    func streetSuffix() -> String {
        self.definitions.streetSuffix.randomElement()!
    }

    /// This function returns a mock street prefix.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.streetPrefix()) // New
    ///
    /// - Returns: A mock street prefix string.
    func streetPrefix() -> String {
        self.definitions.streetPrefix.randomElement()!
    }

    /// This function returns a mock secondary address.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.secondaryAddress()) // Suite 391
    ///
    /// - Returns: A mock secondary address string.
    func secondaryAddress() -> String {
        self.replaceSymbolWithNumber(string: ["Apt. ###", "Suite ###"].randomElement()!)
    }

    /// This function returns a mock county.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.county()) // Buckinghamshire
    ///
    /// - Returns: A mock county string.
    func county() -> String {
        self.definitions.county.randomElement()!
    }

    /// This function returns a country.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.country()) // Western Sahara
    ///
    /// - Returns: A country string.
    func country() -> String {
        self.definitions.country.randomElement()!
    }

    /// This function returns a two letter country code.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.countryCode()) // GA
    ///
    /// - Returns: A two letter country code string.
    func countryCode() -> String {
        self.definitions.countryCode.randomElement()!
    }

    /// This function returns a random state name from the United States.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.state()) // Utah
    ///
    /// - Returns: A state name string.
    func state() -> String {
        self.definitions.state.randomElement()!
    }

    /// This function returns a random state abbreviation from the United States.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.state()) // UT
    ///
    /// - Returns: An abbreviated state name string.
    func stateAbbr() -> String {
        self.definitions.stateAbbr.randomElement()!
    }

    /// This function returns a direction.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.direction(useAbbreviation: true)) // NW
    ///     print(Phony.default.direction(useAbbreviation: false)) // Northwest
    ///
    /// - Parameter useAbbreviation: A Bool that signals whether or not an abbreviation should be used.
    ///
    /// - Returns: A direction string.
    func direction(useAbbreviation: Bool = false) -> String {
        useAbbreviation ? self.definitions.direction.randomElement()! : self.definitions.directionAbbr.randomElement()!
    }
}
