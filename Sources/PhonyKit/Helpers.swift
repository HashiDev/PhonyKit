// Helpers

public extension Phony {
    /// This function returns a given string "slugified", which is having spaces replaced by dashes.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.slugify(str: "slugify this sentence")) // slugify-this-sentence
    /// - Parameter str: The String to "slugify".
    /// - Returns: A "slugified" String.
    func slugify(str: String) -> String {
        str.replacingOccurrences(of: " ", with: "-").trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// This function converts a given string to snake-case.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.slugify(str: "snakify this sentence")) // SNAKIFY_THIS_SENTENCE
    /// - Parameter str: The String to "snakify".
    /// - Returns: A snake-case converted String.
    func snakify(str: String) -> String {
        str.uppercased().replacingOccurrences(of: " ", with: "_").trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// This function converts a given symbol found in a String to a number. The default symbol is "#". Exclamation points are also converted into a number.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.replaceSymbolWithNumber(string: "#####-####")) // 83681-2831
    ///     print(Phony.default.replaceSymbolWithNumber(string: "$$$$$-$$$$", symbol: "$")) // 27502-5029
    /// - Parameters:
    ///     - string: The String to search and replace.
    ///     - symbol: The symbol to search for. Defaults to  "#"
    /// - Returns: A replaced String.
    func replaceSymbolWithNumber(string: String, symbol: String = "#") -> String {
        string.reduce(into: "") { result, char in
            switch char {
            case symbol.first:
                result += String.random(in: "0"..."9")
            case "!":
                result += String.random(in: "2"..."9")
            default:
                result += String(char)
            }
        }
    }

    /// This function converts the ("#", "?", "\*") characters in a given string.
    /// "#" is converted into a number between 0 and 9 (inclusive)
    /// "?" is converted into a capital letter
    /// "\*" is converted into an alphanumeric character.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.replaceSymbolWithNumber(string: "#?#?#?")) // 8G3A6Y
    /// - Parameters:
    ///     - string: The String to search and replace.
    /// - Returns: A replaced String.
    func replaceSymbols(string: String) -> String {
        string.reduce(into: "") { result, char in
            switch char {
            case "#":
                result += String.random(in: "0"..."9")
            case "?":
                result += String.random(in: "A"..."Z")
            case "*":
                result += Bool.random() ? String.random(in: "A"..."Z") : String.random(in: "0"..."9")
            default:
                result += String(char)
            }
        }
    }

    /// This function returns a given string repeated a number of times.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.repeatString(string: "repeat", num: 4)) // repeatrepeatrepeatrepeat
    /// - Parameter string: The String to repeat.
    /// - Returns: A repeated String.
    func repeatString(string: String, num: Int) -> String {
        (0...num).reduce("") { partialResult, _ in "\(partialResult)\(string)" }
    }
}
