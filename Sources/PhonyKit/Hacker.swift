import Foundation

/// Hacker
public extension Phony {
    /// This function returns a random hacker abbreviation.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.hackerAbbreviation()) // TCP
    ///
    /// - Returns: An abbreviated hacker string.
    func hackerAbbreviation() -> String {
        self.definitions.hackerAbbreviation.randomElement()!
    }

    /// This function returns a random hacker adjective.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.hackerAdjective()) // redundant
    ///
    /// - Returns: An adjective hacker string.
    func hackerAdjective() -> String {
        self.definitions.hackerAdjective.randomElement()!
    }

    /// This function returns a random hacker noun.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.hackerNoun()) // monitor
    ///
    /// - Returns: A hacker noun string.
    func hackerNoun() -> String {
        self.definitions.hackerNoun.randomElement()!
    }

    /// This function returns a random hacker verb.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.hackerVerb()) // quantify
    ///
    /// - Returns: A hacker verb string.
    func hackerVerb() -> String {
        self.definitions.hackerVerb.randomElement()!
    }

    /// This function returns a random hacker verb that ends in "ing".
    ///
    /// Usage:
    ///
    ///     print(Phony.default.hackerIngVerb()) // connecting
    ///
    /// - Returns: A hacker verb string that ends in "ing".
    func hackerIngVerb() -> String {
        self.definitions.hackerIngVerb.randomElement()!
    }

    /// This function returns a random hacker phrase using concatenation.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.hackerPhrase()) // We need to compress the auxiliary USB transmitter!
    ///
    /// - Returns: A random hacker phrase string.
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
            return "I'll \(self.hackerVerb()) the \(self.hackerAdjective()) \(self.hackerAbbreviation()) \(self.hackerNoun()), that should \(self.hackerNoun()) the \(self.hackerAbbreviation()) \(self.hackerNoun())!"
        }
    }
}

public extension Phony {
    @available(*, unavailable, renamed: "hackerAbbreviation()")
    func abbreviation() -> String {
        self.hackerAbbreviation()
    }

    @available(*, unavailable, renamed: "hackerAdjective()")
    func adjective() -> String {
        self.hackerAdjective()
    }

    @available(*, unavailable, renamed: "hackerNoun()")
    func noun() -> String {
        self.hackerNoun()
    }

    @available(*, unavailable, renamed: "hackerVerb()")
    func verb() -> String {
        self.hackerVerb()
    }

    @available(*, unavailable, renamed: "hackerIngVerb()")
    func ingverb() -> String {
        self.hackerIngVerb()
    }

    @available(*, unavailable, renamed: "hackerPhrase()")
    func phrase() -> String {
        self.hackerPhrase()
    }
}
