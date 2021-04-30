// Commerce

public extension Phony {
    func color() -> String {
        return self.definitions.colors.randomElement()!
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
