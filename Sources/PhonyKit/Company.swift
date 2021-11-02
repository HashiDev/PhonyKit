// Company

public extension Phony {
    private func suffixes() -> [String] {
        self.definitions.companySuffix
    }

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

    func companySuffix() -> String {
        self.suffixes().randomElement()!
    }

    func catchPhrase() -> String {
        "\(self.catchPhraseAdjective()) \(self.catchPhraseDescriptor()) \(self.catchPhraseNoun())"
    }

    func bs() -> String {
        "\(self.bsBuzz()) \(self.bsAdjective()) \(self.bsNoun())"
    }

    func catchPhraseAdjective() -> String {
        self.definitions.companyAdjective.randomElement()!
    }

    func catchPhraseDescriptor() -> String {
        self.definitions.companyDescriptor.randomElement()!
    }

    func catchPhraseNoun() -> String {
        self.definitions.companyNoun.randomElement()!
    }

    func bsAdjective() -> String {
        self.definitions.companyBsAdjective.randomElement()!
    }

    func bsBuzz() -> String {
        self.definitions.companyBsVerb.randomElement()!
    }

    func bsNoun() -> String {
        self.definitions.companyBsNoun.randomElement()!
    }
}
