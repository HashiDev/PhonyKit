import Foundation
#if canImport(SwiftUI)
    import SwiftUI
#endif
#if canImport(UIKit)
    import UIKit
#endif
// Internet

public extension Phony {
    func email(firstName: String? = nil, lastName: String? = nil, provider: String = ["gmail.com", "yahoo.com", "hotmail.com"].randomElement()!) -> String {
        self.slugify(str: self.userName(firstName: firstName, lastName: lastName)) + "@" + provider
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
        ["http", "https"].randomElement()!
    }

    func url() -> String {
        self.protocol() + "://" + self.domainName()
    }

    func domainName() -> String {
        self.domainWord() + "." + self.domainSuffix()
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
            return (self.loremWord() + self.loremWord()).lowercased()
        } else {
            return self.loremSlug(wordCount: 2).lowercased()
        }
    }

    func ipAddress() -> String {
        "\(Int.random(in: 0...255)).\(Int.random(in: 0...255)).\(Int.random(in: 0...255)).\(Int.random(in: 0...255))"
    }

    func ipv6() -> String {
        let hexa = self.hexaDecimal
        return "\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4)):\(hexa(4))"
    }

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

    #if canImport(UIKit)
        func color(baseRed255: Int = 0, baseGreen255: Int = 0, baseBlue255: Int = 0) -> UIColor {
            let color: ColorFloats = self.color()
            return UIColor(red: color.red, green: color.green, blue: color.blue, alpha: 1.0)
        }
    #endif

    #if canImport(SwiftUI)
        func color(baseRed255: Int = 0, baseGreen255: Int = 0, baseBlue255: Int = 0) -> Color {
            let color: ColorFloats = self.color()
            return Color(red: color.red, green: color.green, blue: color.blue, opacity: 1.0)
        }
    #endif

    private func color(baseRed255: Int = 0, baseGreen255: Int = 0, baseBlue255: Int = 0) -> ColorFloats {
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
        let red = CGFloat((Int.random(in: 0...255) + baseRed) / 2) / 255.0
        let green = CGFloat((Int.random(in: 0...255) + baseGreen) / 2) / 255.0
        let blue = CGFloat((Int.random(in: 0...255) + baseBlue) / 2) / 255.0
        return ColorFloats(red: red, green: green, blue: blue)
    }

    private struct ColorFloats {
        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
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

    func website() -> String {
        self.definitions.websites.randomElement()!
    }

    func website() -> URL {
        URL(string: self.definitions.websites.randomElement()!)!
    }
}
