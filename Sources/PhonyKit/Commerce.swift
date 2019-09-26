public class Commerce {
    var phony: Phony!

    public func color() -> String {
        return self.phony.definitions.colors.randomElement()!
    }

    public func department() -> String {
        return self.phony.definitions.departments.randomElement()!
    }

    public func productName() -> String {
        return "\(self.productAdjective()) \(self.productMaterial()) \(self.product())"
    }

    public func productAdjective() -> String {
        return self.phony.definitions.productAdjective.randomElement()!
    }

    public func productMaterial() -> String {
        return self.phony.definitions.productMaterial.randomElement()!
    }

    public func product() -> String {
        return self.phony.definitions.productProduct.randomElement()!
    }
}
