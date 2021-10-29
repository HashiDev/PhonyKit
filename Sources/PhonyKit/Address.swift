import Foundation

// Address

public extension Phony {
    func zipCode(_ format: String? = nil) -> String {
        let format = format ?? self.definitions.postcode.randomElement()!
        return self.replaceSymbols(string: format)
    }

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

    func cityPrefix() -> String {
        return self.definitions.cityPrefix.randomElement()!
    }

    func citySuffix() -> String {
        return self.definitions.citySuffix.randomElement()!
    }

    func streetName() -> String {
        var suffix = self.streetSuffix()
        if suffix.isEmpty {
            suffix = " " + suffix
        }

        return Bool.random() ? self.lastName() + suffix : self.firstName() + suffix
    }

    func streetAddress(useFullAddress: Bool = false) -> String {
        let string = (1...Int.random(in: 3...5)).reduce("") { partialResult, _ in "\(partialResult)#" }

        let address = "\(self.replaceSymbolWithNumber(string: string)) \(self.streetName())"

        return useFullAddress ? "\(address) \(self.secondaryAddress())" : address
    }

    func streetSuffix() -> String {
        self.definitions.streetSuffix.randomElement()!
    }

    func streetPrefix() -> String {
        self.definitions.streetPrefix.randomElement()!
    }

    func secondaryAddress() -> String {
        self.replaceSymbolWithNumber(string: ["Apt. ###", "Suite ###"].randomElement()!)
    }

    func county() -> String {
        self.definitions.county.randomElement()!
    }

    func country() -> String {
        self.definitions.country.randomElement()!
    }

    func countryCode() -> String {
        self.definitions.countryCode.randomElement()!
    }

    func state() -> String {
        self.definitions.state.randomElement()!
    }

    func stateAbbr() -> String {
        self.definitions.stateAbbr.randomElement()!
    }

    func direction(useAbbreviation: Bool = false) -> String {
        useAbbreviation ? self.definitions.direction.randomElement()! : self.definitions.directionAbbr.randomElement()!
    }
}
