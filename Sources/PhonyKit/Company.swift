import Foundation

/// Company
public extension Phony {
    private func companySuffixes() -> [String] {
        self.definitions.companySuffix
    }

    /// This function returns a random company name.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.companyName()) // Farrell and Sons
    ///
    /// - Returns: A company name string.
    func companyName() -> String {
        switch Int.random(in: 0...3) {
        case 0:
            return "\(self.lastName()) \(self.companySuffix())"
        case 1:
            return "\(self.lastName()) - \(self.lastName())"
        case 2:
            return "\(self.lastName()) and \(self.lastName())"
        default:
            return "\(self.lastName()), \(self.lastName()) and \(self.lastName())"
        }
    }

    /// This function returns a random company name suffix.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.companySuffix()) // Inc
    ///
    /// - Returns: A company suffix string.
    func companySuffix() -> String {
        self.companySuffixes().randomElement()!
    }

    /// This function returns a company catch phrase by grabbing two different adjectives and a noun.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.catchPhrase()) // Configurable coherent implementation
    ///
    /// - Returns: A company catch phrase name string.
    func catchPhrase() -> String {
        "\(self.catchPhraseAdjective()) \(self.catchPhraseDescriptor()) \(self.catchPhraseNoun())"
    }

    /// This function returns a random company bs phrase.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.bs()) // generate e-business supply-chains
    ///
    /// - Returns: A company bs string.
    func bs() -> String {
        "\(self.bsBuzz()) \(self.bsAdjective()) \(self.bsNoun())"
    }

    /// This function returns a random company adjective.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.catchPhraseAdjective()) // Assimilated
    ///
    /// - Returns: A company adjective string.
    func catchPhraseAdjective() -> String {
        self.definitions.companyAdjective.randomElement()!
    }

    /// This function returns a random company catch phrase descriptor.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.catchPhraseDescriptor()) // actuating
    ///
    /// - Returns: A company catch phrase descriptor string.
    func catchPhraseDescriptor() -> String {
        self.definitions.companyDescriptor.randomElement()!
    }

    /// This function returns a random company catch phrase noun.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.catchPhraseNoun()) // framework
    ///
    /// - Returns: A company catch phrase noun string.
    func catchPhraseNoun() -> String {
        self.definitions.companyNoun.randomElement()!
    }

    /// This function returns a bs company adjective.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.bsAdjective()) // proactive
    ///
    /// - Returns: A bs company adjective string.
    func bsAdjective() -> String {
        self.definitions.companyBsAdjective.randomElement()!
    }

    /// This function returns a bs company buzzword.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.bsBuzz()) // expedite
    ///
    /// - Returns: A bs company buzzword string.
    func bsBuzz() -> String {
        self.definitions.companyBsVerb.randomElement()!
    }

    /// This function returns a bs company noun.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.bsNoun()) // partnerships
    ///
    /// - Returns: A bs company noun string
    func bsNoun() -> String {
        self.definitions.companyBsNoun.randomElement()!
    }
}
