public class Phony {
    /// The different types of available definitions.
    /// - `default`: The default choices and definitions
    /// - `harryPotter`: Many definitions remain the same, names and a few other things are different.
    /// - `custom`: This was set up to allow different definitions if the two here aren't enough.
    public enum DefinitionsType {
        case `default`
        case harryPotter
        case custom(Definitions)
    }

    /// The public `default` instance of Phony.
    public static var `default`: Phony = Phony()
    
    /// The `default` Phony definitions.
    public var definitions: Definitions = DefaultDefinitions()

    private init() {}

    /// This function was added to make switching out definitions easy.
    /// - Parameter def: DefinitionsType enum. If you aren't happy with the default, it can be changed globally here.
    public static func setDefaultDefinitions(to def: DefinitionsType) {
        switch def {
        case .default:
            Phony.default.definitions = DefaultDefinitions()
        case .harryPotter:
            Phony.default.definitions = HPDefinitions()
        case let .custom(definitions):
            Phony.default.definitions = definitions
        }
    }
}
