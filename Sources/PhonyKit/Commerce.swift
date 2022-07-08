import Foundation

/// Commerce
public extension Phony {
    @available(*, deprecated, renamed: "productColor()", message: "Will be removed in v3.0.0.")
    func color() -> String {
        self.productColor()
    }

    func productColor() -> String {
        self.definitions.colors.randomElement()!
    }

    func department() -> String {
        self.definitions.departments.randomElement()!
    }

    func productName() -> String {
        "\(self.productAdjective()) \(self.productMaterial()) \(self.product())"
    }

    func productAdjective() -> String {
        self.definitions.productAdjective.randomElement()!
    }

    func productMaterial() -> String {
        self.definitions.productMaterial.randomElement()!
    }

    func product() -> String {
        self.definitions.productProduct.randomElement()!
    }
}
