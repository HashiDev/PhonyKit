
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
        switch Int.random(in: 0...7) {
        case 0:
            return "If we \(self.hackerVerb()) the \(self.hackerNoun()), we can get to the \(self.hackerAbbreviation()) \(self.hackerNoun()) through the \(self.hackerAdjective()) \(self.hackerAbbreviation()) \(self.hackerNoun())!"
        case 1:
            return "We need to \(self.hackerVerb()) the \(self.hackerAdjective()) \(self.hackerAbbreviation()) \(self.hackerNoun())!"
        case 2:
            return "Try to \(self.hackerVerb()) the \(self.hackerAbbreviation()) \(self.hackerNoun()), maybe it will \(self.hackerVerb()) the \(self.hackerAdjective()) \(self.hackerNoun())!"
        case 3:
            return "You can't \(self.hackerVerb()) the \(self.hackerNoun()) without \(self.hackerIngVerb()) the \(self.hackerAdjective()) \(self.hackerAbbreviation()) \(self.hackerNoun())!"
        case 4:
            return "Use the \(self.hackerAdjective()) \(self.hackerAbbreviation()) \(self.hackerNoun()), then you can \(self.hackerVerb()) the \(self.hackerAdjective()) \(self.hackerNoun())!"
        case 5:
            return "The \(self.hackerAbbreviation()) \(self.hackerNoun()) is down, \(self.hackerVerb()) the \(self.hackerAdjective()) \(self.hackerNoun()) so we can \(self.hackerVerb()) the \(self.hackerAbbreviation()) \(self.hackerNoun())!"
        case 6:
            return "\(self.hackerIngVerb()) the \(self.hackerNoun()) won't do anything, we need to \(self.hackerVerb()) the \(self.hackerAdjective()) \(self.hackerAbbreviation()) \(self.hackerNoun())!"
        default:
            return  "I'll \(self.hackerVerb()) the \(self.hackerAdjective()) \(self.hackerAbbreviation()) \(self.hackerNoun()), that should \(self.hackerNoun()) the \(self.hackerAbbreviation()) \(self.hackerNoun())!"
        }
    }
}
