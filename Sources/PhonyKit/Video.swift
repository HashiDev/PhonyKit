
import Foundation

// Video

public extension Phony {
    func video() -> String {
        self.definitions.videoUris.randomElement()!
    }

    func video() -> URL {
        URL(string: self.video())!
    }
}
