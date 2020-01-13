
import Foundation

// Video

public extension Phony {
    
    func video() -> String {
        return self.definitions.videoUris.randomElement()!
    }

    func video() -> URL {
        return URL(string: self.video())!
    }
}
