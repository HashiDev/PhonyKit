
// Lorem

public extension Phony {

    /// This function returns a random single lorem ipsum word.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.loremWord()) // dolore
    ///
    /// - Returns: A random single latin word.
    func loremWord() -> String {
        self.definitions.lorem.randomElement()!
    }

    /// This function returns a small lorem ipsum sentence.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.loremWords() // nihil impedit quo
    ///
    /// - Parameters:
    ///     - num: The number of words to make. Defaults to 3.
    ///     - separator: The separating String between words. Defaults to " ".
    ///
    /// - Returns: A latin sentence of 3 words.
    func loremWords(_ num: Int = 3, _ separator: String = " ") -> String {
        (1...num).map { _ in self.loremWord() }.joined(separator: separator).trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// This function returns a medium lorem ipsum sentence between 3 and 10 words inclusive.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.loremSentence() // nihil impedit quo facere officiis vel
    ///
    /// - Returns: A latin sentence of 3-10 words.
    func loremSentence() -> String {
        let sentence = self.loremWords(Int.random(in: 3...10))
        return "\(sentence.prefix(1).uppercased())\(sentence.lowercased().dropFirst())."
    }

    /// This function returns a 'slugified' small lorem ipsum sentence.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.loremWords() // nihil-impedit-quo
    ///
    /// - Parameters:
    ///     - wordCount: The number of words to make. Defaults to 3.
    ///
    /// - Returns: A latin sentence of 3 words.
    func loremSlug(wordCount: Int = 3) -> String {
        self.slugify(str: self.loremWords(wordCount))
    }

    /// This function returns a small paragraph of lorem words.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.loremSentences()) // nulla pariatur at vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae itaque earum rerum hic tenetur a sapiente delectus
    ///
    /// - Parameters:
    ///     - sentenceCount: The number of sentences to include. Defaults to random Int between 2 and 6, inclusive.
    ///     - separator: The String to use between sentences. Defaults to " ".
    ///
    /// - Returns: A String paragraph of lorem words.
    func loremSentences(_ sentenceCount: Int = Int.random(in: 2...6), _ separator: String = " ") -> String {
        (1...sentenceCount).map { _ in self.loremSentence() }.joined(separator: separator).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// This function returns a small paragraph of lorem words.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.loremParagraph()) // nulla pariatur at vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint
    ///
    /// - Parameters:
    ///     - sentenceCount: The number of sentences to include. Defaults to 3.
    ///     - separator: The String to use between sentences. Defaults to " ".
    ///
    /// - Returns: A String paragraph of lorem words.
    func loremParagraph(_ sentenceCount: Int = 3, _ separator: String = " ") -> String {
        self.loremSentences(sentenceCount, separator)
    }

    /// This function returns multiple paragraphs of lorem words.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.loremParagraphs()) // nulla pariatur at vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint \n \r unde omnis iste natus error similique sunt in culpa qui officia deserunt mollitia animi id est \n \r laborum et dolorum fuga et harum quidem rerum facilis est
    ///
    /// - Parameters:
    ///     - sentenceCount: The number of sentences to include. Defaults to 3.
    ///     - separator: The String to use between sentences. Defaults to "\n \r".
    ///
    /// - Returns: A String paragraph of lorem words.
    func loremParagraphs(_ paragraphCount: Int = 3, _ separator: String = "\n \r") -> String {
        (1...paragraphCount).map { _ in self.loremParagraph() }.joined(separator: separator).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// This function returns a random lorem snippet of text.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.loremText()) // at vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet
    ///
    /// - Returns: A random snippet of lorem text.
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

    /// This function returns a random hex color using provided values, or using generated data.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.loremLines()) // at vero eos et accusamus officiis debitis \n aut rerum necessitatibus saepe eveniet
    ///
    /// - Parameters:
    ///     - lineCount: The number of lines to make. Defaults to a random number between 1 and 5, inclusive.
    ///     - separator: The String to use between sentences. Defaults to "\n".
    ///
    /// - Returns: A String with a number of lines of lorem text.
    func loremLines(_ lineCount: Int = Int.random(in: 1...5), _ separator: String = "\n") -> String {
        self.loremSentences(lineCount, separator)
    }
}
