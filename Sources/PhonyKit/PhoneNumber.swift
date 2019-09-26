
public class PhoneNumber {
    var phony: Phony!

    public func phoneNumber(format: String? = nil) -> String {
        let format = format ?? self.phoneFormat()
        return self.phony.helpers.replaceSymbolWithNumber(string: format)
    }

    public func phoneNumber(index: Int = 0) -> String {
        return self.phoneNumber(format: self.phony.definitions.phoneNumberFormats[index])
    }

    public func phoneFormat() -> String {
        return self.phony.definitions.phoneNumberFormats.randomElement()!
    }
}
