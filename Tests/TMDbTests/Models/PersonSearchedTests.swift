@testable import TMDb
import XCTest

final class PersonSearchedTests: XCTestCase {

    func testDecodeReturnsPersonSearched() throws {
        let result = try JSONDecoder.theMovieDatabase.decode(PersonSearched.self, fromResource: "person-searched")
        print("\(result.knownFor!)")
//        XCTAssertEqual(result.countryCode, productionCountry.countryCode)
//        XCTAssertEqual(result.name, productionCountry.name)
        XCTAssertEqual(result.knownFor?.count, 3)
    }

}
