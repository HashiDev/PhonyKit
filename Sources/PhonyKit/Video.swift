import Foundation

/// Video
public extension Phony {
    /// This function returns a random video URL String.
    ///
    /// - Returns: A video URL String.
    func video() -> String {
        self.definitions.videoUris.randomElement()!
    }

    /// This function returns a random video URL.
    ///
    /// - Returns: A video URL.
    func video() -> URL {
        URL(string: self.video())!
    }
}
