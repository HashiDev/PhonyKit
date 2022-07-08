import Foundation

public class Phony {
    /// The public `default` instance of Phony.
    public static var `default`: Phony = .init(definitions: .default)

    internal var definitions: Definitions

    /// Creates a Phony instance that provides access to lots of fake data.
    /// - Parameter definitions: The type of fake data to use.
    public init(definitions: DefinitionsType) {
        self.definitions = definitions.definitions
    }

    /// This function was added to make switching out definitions easy.
    /// - Parameter type: DefinitionsType enum. If you aren't happy with the default, it can be changed globally here.
    public func setDefinitions(to type: DefinitionsType) {
        self.definitions = type.definitions
    }

    /// The different types of available definitions.
    /// - `default`: The default choices and definitions
    /// - `harryPotter`: Many definitions remain the same, names and a few other things are different.
    /// - `custom`: This was set up to allow different definitions if the two here aren't enough.
    public enum DefinitionsType {
        case `default`
        case harryPotter
        case custom(Definitions)

        var definitions: Definitions {
            switch self {
            case .default:
                return FileDefinitions(fileName: "DefaultDefinitions")
            case .harryPotter:
                return FileDefinitions(fileName: "HPDefinitions")
            case let .custom(custom):
                return custom
            }
        }
    }
}

public extension Phony {
    @available(*, unavailable, renamed: "default.setDefinitions(to:)")
    static func setDefaultDefinitions(to type: DefinitionsType) {
        Phony.default.setDefinitions(to: type)
    }
}
