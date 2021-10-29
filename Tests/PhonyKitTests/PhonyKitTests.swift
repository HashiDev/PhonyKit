@testable import PhonyKit
import XCTest

final class PhonyKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let phony = Phony.default
        print(phony.avatar() as String)
        print(phony.productColor())
        print(phony.color(baseRed255: 100, baseGreen255: 100, baseBlue255: 100) as String)
        print(phony.domainName())
        print(phony.domainSuffix())
        print(phony.domainWord())
        print(phony.email())
        print(phony.email(firstName: "Sean", lastName: "Robinson", provider: "hashi.dev"))
        print(phony.exampleEmail())
        print(phony.exampleEmail(firstName: "Ben", lastName: "Covington"))
        print(phony.ipAddress())
        print(phony.ipv6())
        print(phony.macAddress())
        print(phony.protocol())
        print(phony.url())
        print(phony.userName())
        print(phony.userName(firstName: "Trent", lastName: "Sucks"))
        XCTAssert(true)
    }

    static var allTests = [
        ("testExample", testExample)
    ]
}
