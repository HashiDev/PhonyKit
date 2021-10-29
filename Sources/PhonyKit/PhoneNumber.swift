
// PhoneNumber
public extension Phony {
    func phoneNumber(format: String? = nil) -> String {
         self.replaceSymbolWithNumber(string: format ?? self.phoneFormat())
    }

    func phoneNumber(index: Int = 0) -> String {
        self.phoneNumber(format: self.definitions.phoneNumberFormats[index])
    }

    func phoneFormat() -> String {
        self.definitions.phoneNumberFormats.randomElement()!
    }
}
