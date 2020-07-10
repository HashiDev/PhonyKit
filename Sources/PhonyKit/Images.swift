
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
    
    private extension Int {
        static func random() -> Int {
            Int.random(in: 100..<3000)
        }
    }

    func image(width: Int = .random(), height: Int = .random()) -> String {
        if Bool.random() {
            return self.unsplash(keyword: nil)
        }
        return self.picsum()
    }

    func image(width: Int = .random(), height: Int = .random()) -> URL {
        if Bool.random() {
            return self.unsplash(keyword: nil)
        }
        return self.picsum()
    }

    func avatar() -> String {
        return self.definitions.avatarUri.randomElement()!
    }

    func avatar() -> URL {
        return URL(string: self.avatar())!
    }

    func unsplash(width: Int = .random(), height: Int = .random(), category: UnsplashCategory = UnsplashCategory.allCases.randomElement()!, keyword: String? = nil) -> String {
        var url = "https://source.unsplash.com/category/\(category)/\(width)x\(height)"

        if keyword?.range(of: "^([A-Za-z0-9].+,[A-Za-z0-9]+)$|^([A-Za-z0-9]+)$", options: .regularExpression) != nil {
            url += "?\(String(describing: keyword))"
        }

        return url
    }

    func unsplash(width: Int = .random(), height: Int = .random(), category: UnsplashCategory = UnsplashCategory.allCases.randomElement()!, keyword: String? = nil) -> URL {
        return URL(string: self.unsplash(width: width, height: height, category: category, keyword: keyword))!
    }

    func picsum(seed: String = UUID().uuidString, width: Int = .random(), height: Int = .random()) -> String {
        return "https://picsum.photos/seed/\(seed)/\(width)/\(height)"
    }

    func picsum(seed: String = UUID().uuidString, width: Int = .random(), height: Int = .random()) -> URL {
        return URL(string: self.picsum(seed: seed, width: width, height: height))!
    }

    func dataUri(width: Int = .random(), height: Int = .random(), color: String = "grey") -> String {
        let svgString = "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" baseProfile=\"full\" width=\"\(width)\" height=\"\(height)\"><rect width=\"100%\" height=\"100%\" fill=\"\(color)\"/><text x=\"\(width / 2)\" y=\"\(height / 2)\" font-size=\"20\" alignment-baseline=\"middle\" text-anchor=\"middle\" fill=\"white\">\(width)x\(height)</text></svg>"
        let rawPrefix = "data:image/svg+xml;charset=UTF-8,"
        return rawPrefix + (svgString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
    }
}
