import Foundation

/// Commerce
public extension Phony {
    /// This function returns a random color name.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.productColor()) // mint green
    ///
    /// - Returns: A color name string.
    func productColor() -> String {
        self.definitions.colors.randomElement()!
    }

    @available(*, unavailable, renamed: "productColor()")
    func color() -> String {
        self.productColor()
    }

    /// This function returns a random product department.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.department()) // Toys
    ///
    /// - Returns: A department name string.
    func department() -> String {
        self.definitions.departments.randomElement()!
    }

    /// This function returns a random product name, combining an adjective, material and product.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.productName()) // Licensed Plastic Pants
    ///
    /// - Returns: An abbreviated state name string.
    func productName() -> String {
        "\(self.productAdjective()) \(self.productMaterial()) \(self.product())"
    }

    /// This function returns a random product adjective.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.productAdjective()) // Rustic
    ///
    /// - Returns: A product adjective string.
    func productAdjective() -> String {
        self.definitions.productAdjective.randomElement()!
    }

    /// This function returns a random product material.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.productMaterial()) // Concrete
    ///
    /// - Returns: An abbreviated state name string.
    func productMaterial() -> String {
        self.definitions.productMaterial.randomElement()!
    }

    /// This function returns a random product.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.product()) // Gloves
    ///
    /// - Returns: A product string.
    func product() -> String {
        self.definitions.productProduct.randomElement()!
    }
}
