import Foundation

// Random

public extension Phony {
    func dictionaryElement<T>(dictionary: [String: T]) -> T? {
        let key = dictionary.keys.sorted().randomElement() ?? ""
        return dictionary[key]
    }

    func realWord() -> String {
        switch Int.random(in: 0...23) {
        case 0:
            return self.department()
        case 1:
            return self.productName()
        case 2:
            return self.productAdjective()
        case 3:
            return self.productMaterial()
        case 4:
            return self.product()
        case 5:
            return self.productColor()
        case 6:
            return self.catchPhraseAdjective()
        case 7:
            return self.catchPhraseDescriptor()
        case 8:
            return self.catchPhraseNoun()
        case 9:
            return self.bsAdjective()
        case 10:
            return self.bsBuzz()
        case 11:
            return self.bsNoun()
        case 12:
            return self.streetSuffix()
        case 13:
            return self.county()
        case 14:
            return self.country()
        case 15:
            return self.state()
        case 16:
            return self.hackerNoun()
        case 17:
            return self.hackerVerb()
        case 18:
            return self.hackerAdjective()
        case 19:
            return self.hackerIngVerb()
        case 20:
            return self.hackerAbbreviation()
        case 21:
            return self.jobDescriptor()
        case 22:
            return self.jobArea()
        default:
            return self.jobType()
        }
    }

    func realWords(toReturn count: Int = Int.random(in: 1...3)) -> String {
        (1...count).map { _ in self.realWord() }.joined(separator: "")
    }

    func alpha(count: Int = 5, upperCased: Bool = false) -> String {
        let wholeString = (1...count).reduce("") { partialResult, _ in "\(partialResult)\(String.random(in: "a"..."z"))" }
        if upperCased {
            return wholeString.uppercased()
        }
        return wholeString
    }

    func alphaNumeric(count: Int = 5) -> String {
        (1...count).map { _ in Bool.random() ? String.random(in: "0"..."9") : String.random(in: "a"..."z") }.joined(separator: "")
    }

    func hexaDecimal(count: Int = 6) -> String {
        var wholeString = ""
        for _ in 1...count {
            wholeString += Bool.random() ? String.random(in: "0"..."9") : String.random(in: "A"..."F")
        }
        return wholeString
    }
}
