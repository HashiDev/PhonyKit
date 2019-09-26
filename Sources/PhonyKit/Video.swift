
import Foundation

public class Video {
    var phony: Phony!
    
    public func video() -> String {
        return self.phony.definitions.videoUris.randomElement()!
    }

    public func video() -> URL {
        return URL(string: self.video())!
    }
}
