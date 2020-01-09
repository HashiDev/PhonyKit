
// PhoneNumber
public extension Phony {

    func phoneNumber(format: String? = nil) -> String {
        let format = format ?? self.phoneFormat()
        return self.replaceSymbolWithNumber(string: format)
    }

    func phoneNumber(index: Int = 0) -> String {
        return self.phoneNumber(format: self.definitions.phoneNumberFormats[index])
    }

    func phoneFormat() -> String {
        return self.definitions.phoneNumberFormats.randomElement()!
    }
}
