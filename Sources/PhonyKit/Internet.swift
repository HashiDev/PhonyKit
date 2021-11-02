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
        "\(self.protocol())://\(self.domainName())"
    }

    func domainName() -> String {
        "\(self.domainWord()).\(self.domainSuffix())"
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
        Bool.random() ? (self.loremWord() + self.loremWord()).lowercased() : self.loremSlug(wordCount: 2).lowercased()
    }

    func ipAddress() -> String {
        "\(Int.random(in: 0...255)).\(Int.random(in: 0...255)).\(Int.random(in: 0...255)).\(Int.random(in: 0...255))"
    }

    func ipv6() -> String {
        "\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4)):\(self.hexaDecimal(count: 4))"
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
    func color(redOffset: Int = 0, greenOffset: Int = 0, blueOffset: Int = 0, alpha: Double = 1.0) -> UIColor {
            let color: ColorDoubles = self.color(redOffset: redOffset, greenOffset: greenOffset, blueOffset: blueOffset)
            return UIColor(red: color.red, green: color.green, blue: color.blue, alpha: alpha)
        }
    #endif

    #if canImport(SwiftUI)
    @available(iOS 13.0, *)
    @available(macOS 10.15, *)
    func color(redOffset: Int = 0, greenOffset: Int = 0, blueOffset: Int = 0, alpha: Double = 1.0) -> Color {
            let color: ColorDoubles = self.color(redOffset: redOffset, greenOffset: greenOffset, blueOffset: blueOffset)
            return Color(red: color.red, green: color.green, blue: color.blue, opacity: alpha)
        }
    #endif

    private func color(redOffset: Int = 0, greenOffset: Int = 0, blueOffset: Int = 0) -> ColorDoubles {
        var baseRed = redOffset
        if abs(redOffset) > 255 {
            baseRed = 0
        }
        var baseGreen = greenOffset
        if abs(greenOffset) > 255 {
            baseGreen = 0
        }
        var baseBlue = blueOffset
        if abs(blueOffset) > 255 {
            baseBlue = 0
        }
        let red = CGFloat((Int.random(in: 0...255) + baseRed) / 2) / 255.0
        let green = CGFloat((Int.random(in: 0...255) + baseGreen) / 2) / 255.0
        let blue = CGFloat((Int.random(in: 0...255) + baseBlue) / 2) / 255.0
        return ColorDoubles(red: red, green: green, blue: blue)
    }

    func macAddress() -> String {
        (0...5).reduce("") { partialResult, index in
            "\(partialResult)\(hexaDecimal(count: 2).lowercased())\(index == 5 ? "" : ":")"
        }
    }

    func website() -> String {
        self.definitions.websites.randomElement()!
    }

    func website() -> URL {
        URL(string: self.definitions.websites.randomElement()!)!
    }
}

private struct ColorDoubles {
    let red: Double
    let green: Double
    let blue: Double
}
