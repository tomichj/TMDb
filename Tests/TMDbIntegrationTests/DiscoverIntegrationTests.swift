import TMDb
import XCTest

final class DiscoverIntegrationTests: XCTestCase {

    var discoverService: DiscoverService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        try configureTMDb()
        discoverService = DiscoverService()
    }

    override func tearDown() {
        discoverService = nil
        super.tearDown()
    }

    func testMovies() async throws {
        let movieList = try await discoverService.movies()

        XCTAssertFalse(movieList.results.isEmpty)
    }


    func testMoviesUpcoming() async throws {
        let today = Date()
        let nextMonth = Calendar.current.date(byAdding: .day, value: 30, to: today)!
        let movieList = try await discoverService.movies(language: "en-US", primaryReleaseDateGTE: today, primaryReleaseDateLTE: nextMonth, releaseDateGTE: today, releaseDateLTE: nextMonth, sortedBy: MovieSort.popularity(descending: true), regionCode: "US")

        XCTAssertFalse(movieList.results.isEmpty)
    }

    func testTVSeries() async throws {
        let tvSeriesList = try await discoverService.tvSeries()

        XCTAssertFalse(tvSeriesList.results.isEmpty)
    }

}
