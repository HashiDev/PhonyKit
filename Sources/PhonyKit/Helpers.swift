// Helpers

public extension Phony {

    func slugify(str: String) -> String {
        return str.replacingOccurrences(of: " ", with: "-").trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func snakify(str: String) -> String {
        return str.uppercased().replacingOccurrences(of: " ", with: "_").trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func replaceSymbolWithNumber(string: String, symbol: String = "#") -> String {
        return string.reduce(into: "") { result, char in
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
        return string.reduce(into: "") { result, char in
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
        var text = ""

        for _ in 0...num {
            text += string
        }

        return text
    }
}
