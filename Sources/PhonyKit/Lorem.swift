
// Lorem

public extension Phony {
    @available(*, deprecated, message: "Use 'loremWord()' instead.")
    func word() -> String {
        self.loremWord()
    }

    func loremWord() -> String {
        self.definitions.lorem.randomElement()!
    }

    @available(*, deprecated, message: "Use 'loremWords()' instead.")
    func words(_ num: Int = 3, _ separator: String = " ") -> String {
        self.loremWords(num, separator)
    }

    func loremWords(_ num: Int = 3, _ separator: String = " ") -> String {
        (1...num).map { _ in self.loremWord() }.joined(separator: separator).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    @available(*, deprecated, message: "Use 'loremSentence()' instead.")
    func sentence() -> String {
        let sentence = self.words(Int.random(in: 3...10))
        return "\(sentence.prefix(1).uppercased())\(sentence.lowercased().dropFirst())."
    }
    
    func loremSentence() -> String {
        let sentence = self.loremWords(Int.random(in: 3...10))
        return "\(sentence.prefix(1).uppercased())\(sentence.lowercased().dropFirst())."
    }

    @available(*, deprecated, message: "Use 'loremSlug()' instead.")
    func slug(wordCount: Int = 3) -> String {
        self.loremSlug(wordCount: wordCount)
    }

    func loremSlug(wordCount: Int = 3) -> String {
        self.slugify(str: self.loremWords(wordCount))
    }

    @available(*, deprecated, message: "Use 'loremSentences()' instead.")
    func sentences(_ sentenceCount: Int = Int.random(in: 2...6), _ separator: String = " ") -> String {
        self.loremSentences(sentenceCount, separator)
    }

    func loremSentences(_ sentenceCount: Int = Int.random(in: 2...6), _ separator: String = " ") -> String {
        (1...sentenceCount).map { _ in self.loremSentence() }.joined(separator: separator).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    @available(*, deprecated, message: "Use 'loremParagraph()' instead.")
    func paragraph(_ sentenceCount: Int = 3, _ separator: String = " ") -> String {
        self.loremParagraph(sentenceCount, separator)
    }

    func loremParagraph(_ sentenceCount: Int = 3, _ separator: String = " ") -> String {
        self.loremSentences(sentenceCount, separator)
    }

    @available(*, deprecated, message: "Use 'loremParagraphs()' instead.")
    func paragraphs(_ paragraphCount: Int = 3, _ separator: String = "\n \r") -> String {
        self.loremParagraphs(paragraphCount, separator)
    }

    func loremParagraphs(_ paragraphCount: Int = 3, _ separator: String = "\n \r") -> String {
        (1...paragraphCount).map { _ in self.loremParagraph() }.joined(separator: separator).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    @available(*, deprecated, message: "Use 'loremText()' instead.")
    func text() -> String {
        self.loremText()
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

    @available(*, deprecated, message: "Use 'loremLines()' instead.")
    func lines(_ lineCount: Int = Int.random(in: 1...5), _ separator: String = "\n") -> String {
        self.loremLines(lineCount, separator)
    }

    func loremLines(_ lineCount: Int = Int.random(in: 1...5), _ separator: String = "\n") -> String {
        self.loremSentences(lineCount, separator)
    }
}
