import Foundation

public class Address {
    var phony: Phony!

    public func zipCode(_ format: String? = nil) -> String {
        let format = format ?? self.phony.definitions.postcode.randomElement()!
        return self.phony.helpers.replaceSymbols(string: format)
    }

    public func city() -> String {
        let format = Int.random(in: 0...3)

        switch format {
        case 0:
            return "\(self.cityPrefix()) \(self.phony.name.firstName()) \(self.citySuffix())"
        case 1:
            return "\(self.cityPrefix()) \(self.phony.name.firstName())"
        case 2:
            return "\(self.phony.name.firstName())\(self.citySuffix())"
        default:
            return "\(self.phony.name.lastName())\(self.citySuffix())"
        }
    }

    public func cityPrefix() -> String {
        return self.phony.definitions.cityPrefix.randomElement()!
    }

    public func citySuffix() -> String {
        return self.phony.definitions.citySuffix.randomElement()!
    }

    public func streetName() -> String {
        var suffix = self.streetSuffix()
        if suffix.isEmpty {
            suffix = " " + suffix
        }

        return Bool.random() ? self.phony.name.lastName() + suffix : self.phony.name.firstName() + suffix
    }

    public func streetAddress(useFullAddress: Bool = false) -> String {
        let symbols = Int.random(in: 3...5)
        var string = ""

        for _ in 1...symbols {
            string += "#"
        }

        let address = "\(self.phony.helpers.replaceSymbolWithNumber(string: string)) \(self.streetName())"

        return useFullAddress ? "\(address) \(self.secondaryAddress())" : address
    }

    public func streetSuffix() -> String {
        return self.phony.definitions.streetSuffix.randomElement()!
    }

    public func streetPrefix() -> String {
        return self.phony.definitions.streetPrefix.randomElement()!
    }

    public func secondaryAddress() -> String {
        return self.phony.helpers.replaceSymbolWithNumber(string: ["Apt. ###", "Suite ###"].randomElement()!)
    }

    public func county() -> String {
        return self.phony.definitions.county.randomElement()!
    }

    public func country() -> String {
        return self.phony.definitions.country.randomElement()!
    }

    public func countryCode() -> String {
        return self.phony.definitions.countryCode.randomElement()!
    }

    public func state() -> String {
        return self.phony.definitions.state.randomElement()!
    }

    public func stateAbbr() -> String {
        return self.phony.definitions.stateAbbr.randomElement()!
    }

    public func latitude(in range: ClosedRange<Float> = -90...90, precision: Int = 4) -> Float {
        return Float.random(in: range).rounded(toPlaces: precision)
    }

    public func longitude(in range: ClosedRange<Float> = -180...180, precision: Int = 4) -> Float {
        return Float.random(in: range).rounded(toPlaces: precision)
    }

    public func direction(useAbbreviation: Bool = false) -> String {
        if useAbbreviation {
            return self.phony.definitions.direction.randomElement()!
        }
        return self.phony.definitions.directionAbbr.randomElement()!
    }

    public func nearbyGPSCoordinate(coordinate: [Float]? = nil, radius: Float? = nil, isMetric: Bool = false) -> [Float] {
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

        // If there is no coordinate, the best we can do is return a random GPS coordinate.
        guard let coordinate = coordinate else {
            return [self.latitude(), self.longitude()]
        }

        let radius = radius ?? 10.0

        // TODO: implement either a gaussian/uniform distribution of points in cicular region.
        // Possibly include param to function that allows user to choose between distributions.

        // This approach will likely result in a higher density of points near the center.
        return coordinateWithOffset(coordinate: coordinate, bearing: degreesToRadians(degrees: Float.random(in: 0..<1) * 360.0), distance: radius, isMetric: isMetric)
    }
}
