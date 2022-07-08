import Foundation

/// PhoneNumber
public extension Phony {
    /// Creates a mock phone number.
    ///
    /// - Parameters:
    ///   - format: A String that is the format of the returned mock phone number. Is optional, will supply one if nil.
    ///
    /// - Returns: A mock phone number
    func phoneNumber(format: String? = nil) -> String {
        self.replaceSymbolWithNumber(string: format ?? self.phoneFormat())
    }

    /// Creates a mock phone number.
    ///
    /// - Parameters:
    ///   - index: The index of the format in the definitions file. Default is 0 since that is the most common (Using the DefaultDefinitions).
    ///
    /// - Returns: A mock phone number
    func phoneNumber(index: Int = 0) -> String {
        if index > self.definitions.phoneNumberFormats.count {
            return self.phoneNumber(format: self.definitions.phoneNumberFormats[0])
        } else {
            return self.phoneNumber(format: self.definitions.phoneNumberFormats[index])
        }
    }

    /// Returns a String phone number format.
    ///
    /// - Returns: A phone number format String.
    func phoneFormat() -> String {
        self.definitions.phoneNumberFormats.randomElement()!
    }
}
