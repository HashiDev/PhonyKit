import Foundation

/// Images
public extension Phony {
    enum UnsplashCategory: String, CaseIterable {
        case buildings
        case objects
        case technology
        case food
        case nature
        case people
    }

    /// This function returns a random image (picsum or unsplash) in String format.
    ///
    /// - Parameters:
    ///     - width: An Int representing the desired width of the image
    ///     - height: An Int representing the desired height of the image
    /// - Returns: An image url String.
    func image(width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000)) -> String {
        Bool.random() ? self.unsplash(width: width, height: height, keyword: nil) : self.picsum(width: width, height: height)
    }

    /// This function returns a random image (picsum or unsplash) URL.
    ///
    /// - Parameters:
    ///     - width: An Int representing the desired width of the image
    ///     - height: An Int representing the desired height of the image
    /// - Returns: An image URL.
    func image(width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000)) -> URL {
        Bool.random() ? self.unsplash(width: width, height: height, keyword: nil) : self.picsum(width: width, height: height)
    }

    /// This function returns a random avatar image String.
    ///
    /// - Returns: An avatar image String.
    func avatar() -> String {
        self.definitions.avatarUri.randomElement()!
    }

    /// This function returns a random avatar image URL.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.avatar()) // https://s3.amazonaws.com/uifaces/faces/twitter/blakesimkins/128.jpg
    ///
    /// - Returns: An avatar image URL.
    func avatar() -> URL {
        URL(string: self.avatar())!
    }

    /// This function returns a random unsplash image string.
    ///
    /// - Parameters:
    ///     - width: An Int representing the desired width of the image
    ///     - height: An Int representing the desired height of the image
    ///     - category: An enum for the type of image requested
    ///     - keyword: A keyword appended to the url String
    /// - Returns: An image url String.
    func unsplash(width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000), category: UnsplashCategory = UnsplashCategory.allCases.randomElement()!, keyword: String? = nil) -> String {
        var url = "https://source.unsplash.com/category/\(category)/\(width)x\(height)"

        if keyword?.range(of: "^([A-Za-z0-9].+,[A-Za-z0-9]+)$|^([A-Za-z0-9]+)$", options: .regularExpression) != nil {
            url += "?\(String(describing: keyword))"
        }

        return url
    }

    /// This function returns a random unsplash image URL.
    ///
    /// - Parameters:
    ///     - width: An Int representing the desired width of the image
    ///     - height: An Int representing the desired height of the image
    ///     - category: An enum for the type of image requested
    ///     - keyword: A keyword appended to the url String
    /// - Returns: An image URL.
    func unsplash(width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000), category: UnsplashCategory = UnsplashCategory.allCases.randomElement()!, keyword: String? = nil) -> URL {
        URL(string: self.unsplash(width: width, height: height, category: category, keyword: keyword))!
    }

    /// This function returns a random picsum image in String format.
    ///
    /// - Parameters:
    ///     - seed: UUID That holds the image uniqueness.
    ///     - width: An Int representing the desired width of the image
    ///     - height: An Int representing the desired height of the image
    /// - Returns: An image url String.
    func picsum(seed: String = UUID().uuidString, width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000)) -> String {
        "https://picsum.photos/seed/\(seed)/\(width)/\(height)"
    }

    /// This function returns a random picsum image URL.
    ///
    /// - Parameters:
    ///     - seed: UUID That holds the image uniqueness.
    ///     - width: An Int representing the desired width of the image
    ///     - height: An Int representing the desired height of the image
    /// - Returns: An image URL.
    func picsum(seed: String = UUID().uuidString, width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000)) -> URL {
        URL(string: self.picsum(seed: seed, width: width, height: height))!
    }

    /// This function returns an svg String data uri.
    ///
    /// - Parameters:
    ///     - width: An Int representing the desired width of the image
    ///     - height: An Int representing the desired height of the image
    ///     - color: String color name.
    /// - Returns: A String data uri.
    func dataUri(width: Int = .random(in: 100..<3000), height: Int = .random(in: 100..<3000), color: String = "grey") -> String {
        let svgString = "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" baseProfile=\"full\" width=\"\(width)\" height=\"\(height)\"><rect width=\"100%\" height=\"100%\" fill=\"\(color)\"/><text x=\"\(width / 2)\" y=\"\(height / 2)\" font-size=\"20\" alignment-baseline=\"middle\" text-anchor=\"middle\" fill=\"white\">\(width)x\(height)</text></svg>"
        let rawPrefix = "data:image/svg+xml;charset=UTF-8,"
        return rawPrefix + (svgString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
    }
}
