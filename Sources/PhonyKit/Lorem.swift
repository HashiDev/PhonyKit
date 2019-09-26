
public class Lorem {
    var phony: Phony!

    public func word() -> String {
        return self.phony.definitions.lorem.randomElement()!
    }

    public func words(_ num: Int = 3, _ separator: String = " ") -> String {
        var words = ""
        for _ in 1...num {
            words += "\(self.word())\(separator)"
        }
        return words.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public func sentence() -> String {
        let sentence = self.words(Int.random(in: 3...10))
        return "\(sentence.prefix(1).uppercased())\(sentence.lowercased().dropFirst())."
    }

    public func slug(wordCount: Int = 3) -> String {
        return self.phony.helpers.slugify(str: self.words(wordCount))
    }

    public func sentences(_ sentenceCount: Int = Int.random(in: 2...6), _ separator: String = " ") -> String {
        var sentences = ""

        for _ in 1...sentenceCount {
            sentences += "\(self.sentence())\(separator)"
        }

        return sentences.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public func paragraph(_ sentenceCount: Int = 3, _ separator: String = " ") -> String {
        return self.sentences(sentenceCount, separator)
    }

    public func paragraphs(_ paragraphCount: Int = 3, _ separator: String = "\n \r") -> String {
        var paragraphs = ""

        for _ in 1...paragraphCount {
            paragraphs += "\(self.paragraph())\(separator)"
        }

        return paragraphs.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public func text() -> String {
        switch Int.random(in: 0...6) {
        case 0:
            return self.word()
        case 1:
            return self.words()
        case 2:
            return self.sentence()
        case 3:
            return self.sentences()
        case 4:
            return self.paragraph()
        case 5:
            return self.paragraphs()
        default:
            return self.lines()
        }
    }

    public func lines(_ lineCount: Int = Int.random(in: 1...5), _ separator: String = "\n") -> String {
        return self.sentences(lineCount, separator)
    }
}
