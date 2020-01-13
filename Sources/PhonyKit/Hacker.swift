
//Hacker

public extension Phony {
    func abbreviation() -> String {
        return self.definitions.hackerAbbreviation.randomElement()!
    }

    func adjective() -> String {
        return self.definitions.hackerAdjective.randomElement()!
    }

    func noun() -> String {
        return self.definitions.hackerNoun.randomElement()!
    }

    func verb() -> String {
        return self.definitions.hackerVerb.randomElement()!
    }

    func ingverb() -> String {
        return self.definitions.hackerIngVerb.randomElement()!
    }

    func phrase() -> String {
        let abbreviation = self.abbreviation()
        let adjective = self.adjective()
        let ingverb = self.ingverb()
        let noun = self.noun()
        let verb = self.verb()

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
