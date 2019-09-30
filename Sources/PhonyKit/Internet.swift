import Foundation

public class Internet {
    var phony: Phony!

    public func avatar() -> String {
        return self.phony.definitions.avatarUri.randomElement()!
    }

    public func email(firstName: String? = nil, lastName: String? = nil, provider: String = ["gmail.com", "yahoo.com", "hotmail.com"].randomElement()!) -> String {
        return self.phony.helpers.slugify(str: self.userName(firstName: firstName, lastName: lastName)) + "@" + provider
    }

    public func exampleEmail(firstName: String? = nil, lastName: String? = nil) -> String {
        let provider = [
            "example.org",
            "example.com",
            "example.net"
        ].randomElement()!
        return self.email(firstName: firstName, lastName: lastName, provider: provider)
    }

    public func userName(firstName: String? = nil, lastName: String? = nil) -> String {
        let firstName = firstName ?? self.phony.name.firstName()
        let lastName = lastName ?? self.phony.name.lastName()
        switch Int.random(in: 0...2) {
        case 0:
            return "\(firstName)\(Int.random(in: 2...10000))".trimmingCharacters(in: .whitespacesAndNewlines)
        case 1:
            return "\(firstName)\([".", "_"].randomElement()!)\(lastName)".trimmingCharacters(in: .whitespacesAndNewlines)
        default:
            return "\(firstName)\([".", "_"].randomElement()!)\(lastName)\(Int.random(in: 2...10000))".trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }

    public func `protocol`() -> String {
        return ["http", "https"].randomElement()!
    }

    public func url() -> String {
        return self.protocol() + "://" + self.domainName()
    }

    public func domainName() -> String {
        return self.domainWord() + "." + self.domainSuffix()
    }

    public func domainSuffix() -> String {
        return [
            "com",
            "biz",
            "info",
            "name",
            "net",
            "org"
        ].randomElement()!
    }

    public func domainWord() -> String {
        if Bool.random() {
            return (self.phony.random.word() + self.phony.random.word()).lowercased()
        } else {
            return self.phony.lorem.slug(wordCount: 2).lowercased()
        }
    }

    public func ipAddress() -> String {
        return "\(Int.random(in: 0...255)).\(Int.random(in: 0...255)).\(Int.random(in: 0...255)).\(Int.random(in: 0...255))"
    }

    public func ipv6() -> String {
        let hexa = self.phony.random.hexaDecimal
        return "\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4))"
    }

    public func color(baseRed255: Int = 0, baseGreen255: Int = 0, baseBlue255: Int = 0) -> String {
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

    public func macAddress() -> String {
        let hexa = self.phony.random.hexaDecimal
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
