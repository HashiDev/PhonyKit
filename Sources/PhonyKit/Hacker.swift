import Foundation

/// Hacker
public extension Phony {
    @available(*, deprecated, renamed: "hackerAbbreviation()", message: "Will be removed in v3.0.0.")
    func abbreviation() -> String {
        self.hackerAbbreviation()
    }

    func hackerAbbreviation() -> String {
        self.definitions.hackerAbbreviation.randomElement()!
    }

    @available(*, deprecated, renamed: "hackerAdjective()", message: "Will be removed in v3.0.0.")
    func adjective() -> String {
        self.hackerAdjective()
    }

    func hackerAdjective() -> String {
        self.definitions.hackerAdjective.randomElement()!
    }

    @available(*, deprecated, renamed: "hackerNoun()", message: "Will be removed in v3.0.0.")
    func noun() -> String {
        self.hackerNoun()
    }

    func hackerNoun() -> String {
        self.definitions.hackerNoun.randomElement()!
    }

    @available(*, deprecated, renamed: "hackerVerb()", message: "Will be removed in v3.0.0.")
    func verb() -> String {
        self.hackerVerb()
    }

    func hackerVerb() -> String {
        self.definitions.hackerVerb.randomElement()!
    }

    @available(*, deprecated, renamed: "hackerIngVerb()", message: "Will be removed in v3.0.0.")
    func ingverb() -> String {
        self.hackerIngVerb()
    }

    func hackerIngVerb() -> String {
        self.definitions.hackerIngVerb.randomElement()!
    }

    @available(*, deprecated, renamed: "hackerPhrase()", message: "Will be removed in v3.0.0.")
    func phrase() -> String {
        self.hackerPhrase()
    }

    func hackerPhrase() -> String {
        let abbreviation = self.hackerAbbreviation()
        let adjective = self.hackerAdjective()
        let ingverb = self.hackerIngVerb()
        let noun = self.hackerNoun()
        let verb = self.hackerVerb()

        let phrases = [
            "If we \(verb) the \(noun), we can get to the \(abbreviation) \(noun) through the \(adjective) \(abbreviation) \(noun)!",
            "We need to \(verb) the \(adjective) \(abbreviation) \(noun)!",
            "Try to \(verb) the \(abbreviation) \(noun), maybe it will \(verb) the \(adjective) \(noun)!",
            "You can't \(verb) the \(noun) without \(ingverb) the \(adjective) \(abbreviation) \(noun)!",
            "Use the \(adjective) \(abbreviation) \(noun), then you can \(verb) the \(adjective) \(noun)!",
            "The \(abbreviation) \(noun) is down, \(verb) the \(adjective) \(noun) so we can \(verb) the \(abbreviation) \(noun)!",
            "\(ingverb) the \(noun) won't do anything, we need to \(verb) the \(adjective) \(abbreviation) \(noun)!",
            "I'll \(verb) the \(adjective) \(abbreviation) \(noun), that should \(noun) the \(abbreviation) \(noun)!"
        ]

        return phrases.randomElement()!
    }
}
