
import Foundation

internal extension Character {
    static func random(in range: ClosedRange<Character>) -> Character {
        let lowerAsciiValue = Int(range.lowerBound.asciiValue ?? 65)
        let upperAsciiValue = Int(range.upperBound.asciiValue ?? 90)

        let randomAsciiValue = Int.random(in: lowerAsciiValue...upperAsciiValue)

        return Character(Unicode.Scalar(randomAsciiValue) ?? Unicode.Scalar(65)!)
    }
}

internal extension String {
    static func random(in range: ClosedRange<Character>) -> String {
        let lowerAsciiValue = Int(range.lowerBound.asciiValue ?? 65)
        let upperAsciiValue = Int(range.upperBound.asciiValue ?? 90)

        let randomAsciiValue = Int.random(in: lowerAsciiValue...upperAsciiValue)

        return String(Unicode.Scalar(randomAsciiValue) ?? Unicode.Scalar(65)!)
    }
}

internal extension Float {
    /// Rounds the float to decimal places value
    func rounded(toPlaces places: Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
