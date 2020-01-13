import Foundation

// Address

public extension Phony {

    func zipCode(_ format: String? = nil) -> String {
        let format = format ?? self.definitions.postcode.randomElement()!
        return self.replaceSymbols(string: format)
    }

    func city() -> String {
        let format = Int.random(in: 0...3)

        switch format {
        case 0:
            return "\(self.cityPrefix()) \(self.firstName(for: nil)) \(self.citySuffix())"
        case 1:
            return "\(self.cityPrefix()) \(self.firstName(for: nil))"
        case 2:
            return "\(self.firstName())\(self.citySuffix().lowercased())"
        default:
            return "\(self.lastName())\(self.citySuffix().lowercased())"
        }
    }

    func cityPrefix() -> String {
        return self.definitions.cityPrefix.randomElement()!
    }

    func citySuffix() -> String {
        return self.definitions.citySuffix.randomElement()!
    }

    func streetName() -> String {
        var suffix = self.streetSuffix()
        if suffix.isEmpty {
            suffix = " " + suffix
        }

        return Bool.random() ? self.lastName() + suffix : self.firstName() + suffix
    }

    func streetAddress(useFullAddress: Bool = false) -> String {
        let symbols = Int.random(in: 3...5)
        var string = ""

        for _ in 1...symbols {
            string += "#"
        }

        let address = "\(self.replaceSymbolWithNumber(string: string)) \(self.streetName())"

        return useFullAddress ? "\(address) \(self.secondaryAddress())" : address
    }

    func streetSuffix() -> String {
        return self.definitions.streetSuffix.randomElement()!
    }

    func streetPrefix() -> String {
        return self.definitions.streetPrefix.randomElement()!
    }

    func secondaryAddress() -> String {
        return self.replaceSymbolWithNumber(string: ["Apt. ###", "Suite ###"].randomElement()!)
    }

    func county() -> String {
        return self.definitions.county.randomElement()!
    }

    func country() -> String {
        return self.definitions.country.randomElement()!
    }

    func countryCode() -> String {
        return self.definitions.countryCode.randomElement()!
    }

    func state() -> String {
        return self.definitions.state.randomElement()!
    }

    func stateAbbr() -> String {
        return self.definitions.stateAbbr.randomElement()!
    }

    func latitude(in range: ClosedRange<Float> = -90...90, precision: Int = 4) -> Float {
        return Float.random(in: range).rounded(toPlaces: precision)
    }

    func longitude(in range: ClosedRange<Float> = -180...180, precision: Int = 4) -> Float {
        return Float.random(in: range).rounded(toPlaces: precision)
    }

    func direction(useAbbreviation: Bool = false) -> String {
        if useAbbreviation {
            return self.definitions.direction.randomElement()!
        }
        return self.definitions.directionAbbr.randomElement()!
    }

    func nearbyGPSCoordinate(coordinate: [Float]? = nil, radius: Float? = nil, isMetric: Bool = false) -> [Float] {
        func degreesToRadians(degrees: Float) -> Float {
            return degrees * (Float.pi / 180.0)
        }
        func radiansToDegrees(radians: Float) -> Float {
            return radians * (180.0 / Float.pi)
        }
        func kilometersToMiles(miles: Float) -> Float {
            return miles * 0.621371
        }
        func coordinateWithOffset(coordinate: [Float], bearing: Float, distance: Float, isMetric: Bool = false) -> [Float] {
            let R = 6378.137 as Float // Radius of the Earth (http://nssdc.gsfc.nasa.gov/planetary/factsheet/earthfact.html)
            let d = isMetric ? distance : kilometersToMiles(miles: distance) // Distance in km

            let lat1 = degreesToRadians(degrees: coordinate[0]) // Current lat point converted to radians
            let lon1 = degreesToRadians(degrees: coordinate[1]) // Current long point converted to radians

            let lat2 = asin(sin(lat1) * cos(d / R) +
                cos(lat1) * sin(d / R) * cos(bearing))

            var lon2 = lon1 + atan2(
                sin(bearing) * sin(d / R) * cos(lat1),
                cos(d / R) - sin(lat1) * sin(lat2)
            )

            // Keep longitude in range [-180, 180]
            if lon2 > degreesToRadians(degrees: 180) {
                lon2 = lon2 - degreesToRadians(degrees: 360)
            } else if lon2 < degreesToRadians(degrees: -180) {
                lon2 = lon2 + degreesToRadians(degrees: 360)
            }

            return [radiansToDegrees(radians: lat2).distance(to: 4), radiansToDegrees(radians: lon2).distance(to: 4)]
        }

        guard let coordinate = coordinate else {
            return [self.latitude(), self.longitude()]
        }

        let radius = radius ?? 10.0

        return coordinateWithOffset(coordinate: coordinate, bearing: degreesToRadians(degrees: Float.random(in: 0..<1) * 360.0), distance: radius, isMetric: isMetric)
    }
}
