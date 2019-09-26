
public class Random {
    var phony: Phony!

    public func dictionaryElement<T>(dictionary: [String: T]) -> T? {
        let key = dictionary.keys.sorted().randomElement() ?? ""
        return dictionary[key]
    }

    private func commerce() -> Commerce {
        return self.phony.commerce
    }

    private func company() -> Company {
        return self.phony.company
    }

    private func address() -> Address {
        return self.phony.address
    }

    private func hacker() -> Hacker {
        return self.phony.hacker
    }

    private func name() -> Name {
        return self.phony.name
    }

    public func word() -> String {
        switch Int.random(in: 0...23) {
        case 0:
            return self.commerce().department()
        case 1:
            return self.commerce().productName()
        case 2:
            return self.commerce().productAdjective()
        case 3:
            return self.commerce().productMaterial()
        case 4:
            return self.commerce().product()
        case 5:
            return self.commerce().color()
        case 6:
            return self.company().catchPhraseAdjective()
        case 7:
            return self.company().catchPhraseDescriptor()
        case 8:
            return self.company().catchPhraseNoun()
        case 9:
            return self.company().bsAdjective()
        case 10:
            return self.company().bsBuzz()
        case 11:
            return self.company().bsNoun()
        case 12:
            return self.address().streetSuffix()
        case 13:
            return self.address().county()
        case 14:
            return self.address().country()
        case 15:
            return self.address().state()
        case 16:
            return self.hacker().noun()
        case 17:
            return self.hacker().verb()
        case 18:
            return self.hacker().adjective()
        case 19:
            return self.hacker().ingverb()
        case 20:
            return self.hacker().abbreviation()
        case 21:
            return self.name().jobDescriptor()
        case 22:
            return self.name().jobArea()
        default:
            return self.name().jobType()
        }
    }

    public func words(toReturn count: Int = Int.random(in: 1...3)) -> String {
        var words = ""
        for _ in 1...count {
            words += "\(self.word()) "
        }

        return words.trimmingCharacters(in: .whitespaces)
    }

    public func image() -> String {
        return self.phony.image.image()
    }

    public func image() -> URL {
        return self.phony.image.image()
    }

    public func alpha(count: Int = 5, upperCased: Bool = false) -> String {
        var wholeString = ""
        for _ in 1...count {
            wholeString += String.random(in: "a"..."z")
        }
        if upperCased {
            return wholeString.uppercased()
        }

        return wholeString
    }

    public func alphaNumeric(count: Int = 5) -> String {
        var wholeString = ""
        for _ in 1...count {
            wholeString += Bool.random() ? String.random(in: "0"..."9") : String.random(in: "a"..."z")
        }
        return wholeString
    }

    public func hexaDecimal(count: Int = 6) -> String {
        var wholeString = ""
        for _ in 1...count {
            wholeString += Bool.random() ? String.random(in: "0"..."9") : String.random(in: "A"..."F")
        }
        return wholeString
    }
}
