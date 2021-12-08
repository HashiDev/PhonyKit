
// Lorem

public extension Phony {

    func loremWord() -> String {
        self.definitions.lorem.randomElement()!
    }

    func loremWords(_ num: Int = 3, _ separator: String = " ") -> String {
        (1...num).map { _ in self.loremWord() }.joined(separator: separator).trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func loremSentence() -> String {
        let sentence = self.loremWords(Int.random(in: 3...10))
        return "\(sentence.prefix(1).uppercased())\(sentence.lowercased().dropFirst())."
    }

    func loremSlug(wordCount: Int = 3) -> String {
        self.slugify(str: self.loremWords(wordCount))
    }

    func loremSentences(_ sentenceCount: Int = Int.random(in: 2...6), _ separator: String = " ") -> String {
        (1...sentenceCount).map { _ in self.loremSentence() }.joined(separator: separator).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func loremParagraph(_ sentenceCount: Int = 3, _ separator: String = " ") -> String {
        self.loremSentences(sentenceCount, separator)
    }

    func loremParagraphs(_ paragraphCount: Int = 3, _ separator: String = "\n \r") -> String {
        (1...paragraphCount).map { _ in self.loremParagraph() }.joined(separator: separator).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func loremText() -> String {
        switch Int.random(in: 0...6) {
        case 0:
            return self.loremWord()
        case 1:
            return self.loremWords()
        case 2:
            return self.loremSentence()
        case 3:
            return self.loremSentences()
        case 4:
            return self.loremParagraph()
        case 5:
            return self.loremParagraphs()
        default:
            return self.loremLines()
        }
    }

    func loremLines(_ lineCount: Int = Int.random(in: 1...5), _ separator: String = "\n") -> String {
        self.loremSentences(lineCount, separator)
    }
}
