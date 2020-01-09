import Foundation

// Internet

public extension Phony {

    func email(firstName: String? = nil, lastName: String? = nil, provider: String = ["gmail.com", "yahoo.com", "hotmail.com"].randomElement()!) -> String {
        return self.slugify(str: self.userName(firstName: firstName, lastName: lastName)) + "@" + provider
    }

    func exampleEmail(firstName: String? = nil, lastName: String? = nil) -> String {
        let provider = [
            "example.org",
            "example.com",
            "example.net"
        ].randomElement()!
        return self.email(firstName: firstName, lastName: lastName, provider: provider)
    }

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

    func `protocol`() -> String {
        return ["http", "https"].randomElement()!
    }

    func url() -> String {
        return self.protocol() + "://" + self.domainName()
    }

    func domainName() -> String {
        return self.domainWord() + "." + self.domainSuffix()
    }

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

    func domainWord() -> String {
        if Bool.random() {
            return (self.word() + self.word()).lowercased()
        } else {
            return self.slug(wordCount: 2).lowercased()
        }
    }

    func ipAddress() -> String {
        return "\(Int.random(in: 0...255)).\(Int.random(in: 0...255)).\(Int.random(in: 0...255)).\(Int.random(in: 0...255))"
    }

    func ipv6() -> String {
        let hexa = self.hexaDecimal
        return "\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4))"
    }

    func color(baseRed255: Int = 0, baseGreen255: Int = 0, baseBlue255: Int = 0) -> String {
        let red = (Int.random(in: 0...256) + baseRed255) / 2
        let green = (Int.random(in: 0...256) + baseGreen255) / 2
        let blue = (Int.random(in: 0...256) + baseBlue255) / 2
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

    func macAddress() -> String {
        let hexa = self.hexaDecimal
        var mac = ""

        for i in 0..<12 {
            if i == 11 {
                mac += hexa(2).lowercased()
            } else {
                mac += hexa(2).lowercased() + ":"
            }
            
        }
        return mac
    }
}
