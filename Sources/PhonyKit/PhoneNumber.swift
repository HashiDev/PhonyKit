
// PhoneNumber
public extension Phony {
    func phoneNumber(format: String? = nil) -> String {
         self.replaceSymbolWithNumber(string: format ?? self.phoneFormat())
    }

    func phoneNumber(index: Int = 0) -> String {
        if index > self.definitions.phoneNumberFormats.count {
            return self.phoneNumber(format: self.definitions.phoneNumberFormats[0])
        } else {
            return self.phoneNumber(format: self.definitions.phoneNumberFormats[index])
        }
    }

    func phoneFormat() -> String {
        self.definitions.phoneNumberFormats.randomElement()!
    }
}
