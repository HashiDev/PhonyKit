
import Foundation

public class Images {
    var phony: Phony!
    
    public enum UnsplashCategory: String, CaseIterable {
        case buildings
        case objects
        case technology
        case food
        case nature
        case people
    }

    public func image(width: Int = 640, height: Int = 480) -> String {
        if Bool.random() {
            return self.unsplash(keyword: nil)
        }
        return self.picsum()
    }

    public func image(width: Int = 640, height: Int = 480) -> URL {
        if Bool.random() {
            return self.unsplash(keyword: nil)
        }
        return self.picsum()
    }

    public func avatar() -> String {
        return self.phony.definitions.avatarUri.randomElement()!
    }

    public func avatar() -> URL {
        return URL(string: self.avatar())!
    }

    public func unsplash(width: Int = 640, height: Int = 480, category: UnsplashCategory = UnsplashCategory.allCases.randomElement()!, keyword: String? = nil) -> String {
        var url = "https://source.unsplash.com/category/\(category)/\(width)x\(height)"

        if keyword?.range(of: "^([A-Za-z0-9].+,[A-Za-z0-9]+)$|^([A-Za-z0-9]+)$", options: .regularExpression) != nil {
            url += "?\(String(describing: keyword))"
        }

        return url
    }

    public func unsplash(width: Int = 640, height: Int = 480, category: UnsplashCategory = UnsplashCategory.allCases.randomElement()!, keyword: String? = nil) -> URL {
        return URL(string: self.unsplash(width: width, height: height, category: category, keyword: keyword))!
    }

    public func picsum(width: Int = 640, height: Int = 480) -> String {
        return "https://picsum.photos/\(width)/\(height)"
    }

    public func picsum(width: Int = 640, height: Int = 480) -> URL {
        return URL(string: self.picsum(width: width, height: height))!
    }

    public func dataUri(width: Int = 640, height: Int = 480, color: String = "grey") -> String {
        let svgString = "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" baseProfile=\"full\" width=\"\(width)\" height=\"\(height)\"><rect width=\"100%\" height=\"100%\" fill=\"\(color)\"/><text x=\"\(width / 2)\" y=\"\(height / 2)\" font-size=\"20\" alignment-baseline=\"middle\" text-anchor=\"middle\" fill=\"white\">\(width)x\(height)</text></svg>"
        let rawPrefix = "data:image/svg+xml;charset=UTF-8,"
        return rawPrefix + (svgString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
    }
}
