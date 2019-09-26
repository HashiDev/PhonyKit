import XCTest
@testable import PhonyKit

final class PhonyKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssert(true)
        XCTAssertEqual(PhonyKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
