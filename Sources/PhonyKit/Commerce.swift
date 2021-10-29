// Commerce

public extension Phony {
    @available(*, deprecated, message: "Use 'productColor()' instead. Will be removed in v3.0.0.")
    func color() -> String {
        self.productColor()
    }

    func productColor() -> String {
        self.definitions.colors.randomElement()!
    }

    func department() -> String {
        return self.definitions.departments.randomElement()!
    }

    func productName() -> String {
        return "\(self.productAdjective()) \(self.productMaterial()) \(self.product())"
    }

    func productAdjective() -> String {
        return self.definitions.productAdjective.randomElement()!
    }

    func productMaterial() -> String {
        return self.definitions.productMaterial.randomElement()!
    }

    func product() -> String {
        return self.definitions.productProduct.randomElement()!
    }
}
