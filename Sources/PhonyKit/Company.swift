// Company

public extension Phony {
    
    private func suffixes() -> [String] {
        return self.definitions.companySuffix
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
        return self.suffixes().randomElement()!
    }

    func catchPhrase() -> String {
        return "\(self.catchPhraseAdjective()) \(self.catchPhraseDescriptor()) \(self.catchPhraseNoun())"
    }

    func bs() -> String {
        return "\(self.bsBuzz()) \(self.bsAdjective()) \(self.bsNoun())"
    }

    func catchPhraseAdjective() -> String {
        return self.definitions.companyAdjective.randomElement()!
    }

    func catchPhraseDescriptor() -> String {
        return self.definitions.companyDescriptor.randomElement()!
    }

    func catchPhraseNoun() -> String {
        return self.definitions.companyNoun.randomElement()!
    }

    func bsAdjective() -> String {
        return self.definitions.companyBsAdjective.randomElement()!
    }

    func bsBuzz() -> String {
        return self.definitions.companyBsVerb.randomElement()!
    }

    func bsNoun() -> String {
        return self.definitions.companyBsNoun.randomElement()!
    }
}
