import Foundation

/// Helpers
public extension Phony {
    func slugify(str: String) -> String {
        str.replacingOccurrences(of: " ", with: "-").trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func snakify(str: String) -> String {
        str.uppercased().replacingOccurrences(of: " ", with: "_").trimmingCharacters(in: .whitespacesAndNewlines)
    }

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

    func repeatString(string: String, num: Int) -> String {
        (0...num).reduce("") { partialResult, _ in "\(partialResult)\(string)" }
    }
}
