
public class Company {
    var phony: Phony!

    private func suffixes() -> [String] {
        return self.phony.definitions.companySuffix
    }

    private func firstName() -> String {
        return self.phony.name.firstName()
    }

    private func lastName() -> String {
        return self.phony.name.lastName()
    }

    public func companyName() -> String {
        switch Int.random(in: 0...2) {
        case 0:
            return "\(self.lastName()) \(self.companySuffix())"
        case 1:
            return "\(self.lastName()) - \(self.lastName())"
        default:
            return "\(self.lastName()), \(self.lastName()) and \(self.lastName())"
        }
    }

    public func companySuffix() -> String {
        return self.suffixes().randomElement()!
    }

    public func catchPhrase() -> String {
        return "\(self.catchPhraseAdjective()) \(self.catchPhraseDescriptor()) \(self.catchPhraseNoun())"
    }

    public func bs() -> String {
        return "\(self.bsBuzz()) \(self.bsAdjective()) \(self.bsNoun())"
    }

    public func catchPhraseAdjective() -> String {
        return self.phony.definitions.companyAdjective.randomElement()!
    }

    public func catchPhraseDescriptor() -> String {
        return self.phony.definitions.companyDescriptor.randomElement()!
    }

    public func catchPhraseNoun() -> String {
        return self.phony.definitions.companyNoun.randomElement()!
    }

    public func bsAdjective() -> String {
        return self.phony.definitions.companyBsAdjective.randomElement()!
    }

    public func bsBuzz() -> String {
        return self.phony.definitions.companyBsVerb.randomElement()!
    }

    public func bsNoun() -> String {
        return self.phony.definitions.companyBsNoun.randomElement()!
    }
}
