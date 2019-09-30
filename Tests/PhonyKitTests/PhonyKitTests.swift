import XCTest
@testable import PhonyKit

final class PhonyKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let phony = Phony.default
        let internet = phony.internet
        print(internet.avatar())
        print(internet.color())
        print(internet.color(baseRed255: 100, baseGreen255: 100, baseBlue255: 100))
        print(internet.domainName())
        print(internet.domainSuffix())
        print(internet.domainWord())
        print(internet.email())
        print(internet.email(firstName: "Sean", lastName: "Robinson", provider: "hashi.dev"))
        print(internet.exampleEmail())
        print(internet.exampleEmail(firstName: "Ben", lastName: "Covington"))
        print(internet.ipAddress())
        print(internet.ipv6())
        print(internet.macAddress())
        print(internet.protocol())
        print(internet.url())
        print(internet.userName())
        print(internet.userName(firstName: "Trent", lastName: "Sucks"))
        XCTAssert(true)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
