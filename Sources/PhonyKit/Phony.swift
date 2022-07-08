public class Phony {
    public static var `default`: Phony = .init(definitions: .default)

    internal var definitions: Definitions

    public init(definitions: DefinitionsType) {
        self.definitions = definitions.definitions
    }

    public func setDefinitions(to type: DefinitionsType) {
        self.definitions = type.definitions
    }
    
    @available(*, deprecated, renamed: "default.setDefinitions(to:)", message: "Will be removed in v3.0.0")
    public static func setDefaultDefinitions(to type: DefinitionsType) {
        Phony.default.setDefinitions(to: type)
    }

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
