
import Foundation

// Images

public extension Phony {
    enum UnsplashCategory: String, CaseIterable {
        case buildings
        case objects
        case technology
        case food
        case nature
        case people
    }

    func image(width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000)) -> String {
        Bool.random() ? self.unsplash(width: width, height: height, keyword: nil) : self.picsum(width: width, height: height)
    }

    func image(width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000)) -> URL {
        Bool.random() ? self.unsplash(width: width, height: height, keyword: nil) : self.picsum(width: width, height: height)
    }

    func avatar() -> String {
        return self.definitions.avatarUri.randomElement()!
    }

    func avatar() -> URL {
        return URL(string: self.avatar())!
    }

    func unsplash(width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000), category: UnsplashCategory = UnsplashCategory.allCases.randomElement()!, keyword: String? = nil) -> String {
        var url = "https://source.unsplash.com/category/\(category)/\(width)x\(height)"

        if keyword?.range(of: "^([A-Za-z0-9].+,[A-Za-z0-9]+)$|^([A-Za-z0-9]+)$", options: .regularExpression) != nil {
            url += "?\(String(describing: keyword))"
        }

        return url
    }

    func unsplash(width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000), category: UnsplashCategory = UnsplashCategory.allCases.randomElement()!, keyword: String? = nil) -> URL {
        return URL(string: self.unsplash(width: width, height: height, category: category, keyword: keyword))!
    }

    func picsum(seed: String = UUID().uuidString, width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000)) -> String {
        return "https://picsum.photos/seed/\(seed)/\(width)/\(height)"
    }

    func picsum(seed: String = UUID().uuidString, width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000)) -> URL {
        return URL(string: self.picsum(seed: seed, width: width, height: height))!
    }

    func dataUri(width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000), color: String = "grey") -> String {
        let svgString = "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" baseProfile=\"full\" width=\"\(width)\" height=\"\(height)\"><rect width=\"100%\" height=\"100%\" fill=\"\(color)\"/><text x=\"\(width / 2)\" y=\"\(height / 2)\" font-size=\"20\" alignment-baseline=\"middle\" text-anchor=\"middle\" fill=\"white\">\(width)x\(height)</text></svg>"
        let rawPrefix = "data:image/svg+xml;charset=UTF-8,"
        return rawPrefix + (svgString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
    }
}
