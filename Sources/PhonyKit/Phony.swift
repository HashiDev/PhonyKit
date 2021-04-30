public class Phony {
    public enum DefinitionsType {
        case `default`
        case harryPotter
        case custom(Definitions)
    }

    public static var `default`: Phony = Phony()
    public var definitions: Definitions = DefaultDefinitions()

    private init() {}

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
