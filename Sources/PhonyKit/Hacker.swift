
// Hacker

public extension Phony {

    func hackerAbbreviation() -> String {
        self.definitions.hackerAbbreviation.randomElement()!
    }
    
    func hackerAdjective() -> String {
        self.definitions.hackerAdjective.randomElement()!
    }
    
    func hackerNoun() -> String {
        self.definitions.hackerNoun.randomElement()!
    }

    func hackerVerb() -> String {
         self.definitions.hackerVerb.randomElement()!
    }

    func hackerIngVerb() -> String {
        self.definitions.hackerIngVerb.randomElement()!
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
