import Foundation
// Internet

public extension Phony {
    /// This function returns a mock email using user provided data, or completely generated.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.email()) // Georgia_Botsford48@gmail.com
    ///     print(Phony.default.email(provider: "hashi.dev")) // Troy5689@hashi.dev
    ///
    /// - Parameters:
    ///     - firstName: The user's first name (if any).
    ///     - lastName: The user's last name (if any).
    ///     - provider: The email provider.
    ///
    /// - Returns: A mock user email string.
    func email(firstName: String? = nil, lastName: String? = nil, provider: String = ["gmail.com", "yahoo.com", "hotmail.com"].randomElement()!) -> String {
        self.slugify(str: self.userName(firstName: firstName, lastName: lastName)) + "@" + provider
    }

    /// This function returns a mock example email using a user provided name, or using generated data.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.exampleEmail()) // Tyrone_Casper54@example.net
    ///
    /// - Parameters:
    ///     - firstName: The user's first name (if any).
    ///     - lastName: The user's last name (if any).
    ///
    /// - Returns: A mock example user email string.
    func exampleEmail(firstName: String? = nil, lastName: String? = nil) -> String {
        let provider = [
            "example.org",
            "example.com",
            "example.net"
        ].randomElement()!
        return self.email(firstName: firstName, lastName: lastName, provider: provider)
    }

    /// This function returns a mock username using a user provided name, or using generated data.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.userName()) // Rudy.Buckridge
    ///
    /// - Parameters:
    ///     - firstName: The user's first name (if any).
    ///     - lastName: The user's last name (if any).
    ///
    /// - Returns: A mock username string.
    func userName(firstName: String? = nil, lastName: String? = nil) -> String {
        let firstName = firstName ?? self.firstName()
        let lastName = lastName ?? self.lastName()
        switch Int.random(in: 0...2) {
        case 0:
            return "\(firstName)\(Int.random(in: 2...10000))".trimmingCharacters(in: .whitespacesAndNewlines)
        case 1:
            return "\(firstName)\([".", "_"].randomElement()!)\(lastName)".trimmingCharacters(in: .whitespacesAndNewlines)
        default:
            return "\(firstName)\([".", "_"].randomElement()!)\(lastName)\(Int.random(in: 2...10000))".trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }

    /// This function returns a http protocol.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.protocol()) // https
    ///
    ///
    /// - Returns: A http protocol string.
    func `protocol`() -> String {
        ["http", "https"].randomElement()!
    }

    /// This function returns a mock website.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.url()) // https://voluptatem-quia.biz
    ///
    ///
    /// - Returns: A mock website string.
    func url() -> String {
        "\(self.protocol())://\(self.domainName())"
    }

    /// This function returns a mock web domain name.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.domainName()) // dignissimosut.org
    ///
    ///
    /// - Returns: A mock web domain string.
    func domainName() -> String {
        "\(self.domainWord()).\(self.domainSuffix())"
    }

    /// This function returns a mock web domain suffix.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.domainName()) // info
    ///
    ///
    /// - Returns: A mock web domain suffix.
    func domainSuffix() -> String {
        return [
            "com",
            "biz",
            "info",
            "name",
            "net",
            "org"
        ].randomElement()!
    }
    /// This function returns a mock web domain word.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.domainWord()) // laboriosam-sint
    ///
    ///
    /// - Returns: A mock web domain word.
    func domainWord() -> String {
        Bool.random() ? (self.loremWord() + self.loremWord()).lowercased() : self.loremSlug(wordCount: 2).lowercased()
    }

    /// This function returns a mock ip address.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.ipAddress()) // 87.176.40.204
    ///
    ///
    /// - Returns: A mock ip address String.
    func ipAddress() -> String {
        "\(Int.random(in: 0...255)).\(Int.random(in: 0...255)).\(Int.random(in: 0...255)).\(Int.random(in: 0...255))"
    }
    /// This function returns a mock ipv6 address.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.ipv6()) // A8F7:F176:40AD:204E:62BF:512A:220D
    ///
    /// - Returns: A mock ipv6 address String.
    func ipv6() -> String {
        "\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4))"
    }

    /// This function returns a random hex color using provided values, or using generated data.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.color(baseRed255: 100, baseGreen255: 100, baseBlue255: 100)) // #45251F
    ///
    /// - Parameters:
    ///     - baseRed255: The starting red value. Defaults to 0.
    ///     - baseGreen255: The starting green value. Defaults to 0.
    ///     - baseBlue255: The starting blue value. Defaults to 0.
    ///
    /// - Returns: A hex color String.
    func color(baseRed255: Int = 0, baseGreen255: Int = 0, baseBlue255: Int = 0) -> String {
        var baseRed = baseRed255
        if abs(baseRed255) > 255 {
            baseRed = 0
        }
        var baseGreen = baseGreen255
        if abs(baseGreen255) > 255 {
            baseGreen = 0
        }
        var baseBlue = baseBlue255
        if abs(baseBlue255) > 255 {
            baseBlue = 0
        }

        let red = (Int.random(in: 0...255) + baseRed) / 2
        let green = (Int.random(in: 0...255) + baseGreen) / 2
        let blue = (Int.random(in: 0...255) + baseBlue) / 2
        var redStr = String(format: "%02X", red)
        var greenStr = String(format: "%02X", green)
        var blueStr = String(format: "%02X", blue)

        if redStr.count == 1 {
            redStr = "0" + redStr
        }
        if greenStr.count == 1 {
            greenStr = "0" + greenStr
        }
        if blueStr.count == 1 {
            blueStr = "0" + blueStr
        }
        return "#\(redStr)\(greenStr)\(blueStr)"
    }

    /// This function returns a mock mac address.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.ipv6()) // A8:F7:F1:76:40:AD
    ///
    /// - Returns: A mock mac address String.
    func macAddress() -> String {
        (0...5).reduce("") { partialResult, index in
            "\(partialResult)\(hexaDecimal(count: 2).lowercased())\(index == 5 ? "" : ":")"
        }
    }

    /// This function returns a real and interesting web address string.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.website()) // https://omfgdogs.com/
    ///
    /// - Returns: A random real website address String.
    func website() -> String {
        self.definitions.websites.randomElement()!
    }

    /// This function returns a real and interesting web address URL.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.website()) // https://superbad.com/
    ///
    /// - Returns: A random real website address URL.
    func website() -> URL {
        URL(string: self.definitions.websites.randomElement()!)!
    }
}
