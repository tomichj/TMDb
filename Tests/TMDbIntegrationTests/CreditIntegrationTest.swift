import TMDb
import XCTest

final class CreditServiceTests: XCTestCase {
    
    var creditService: CreditService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        try configureTMDb()
        creditService = CreditService()
    }
    
    override func tearDown() {
        creditService = nil
        super.tearDown()
    }
    
    func testDetails() async throws {
        let creditID = "58073e56c3a3684cba010b30"

        let credit = try await creditService.details(forCredit: creditID)

        print("credit: \(credit)")
        XCTAssertEqual(credit.id, creditID)
        XCTAssertEqual(credit.job, "Actor")
    }
}
