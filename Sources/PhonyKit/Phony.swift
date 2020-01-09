public class Phony {
    public static var `default`: Phony = Phony()
    public var definitions: Definitions

    private init() {
        self.definitions = DefaultDefinitions()
    }
}
