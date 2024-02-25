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


    func testMoviesUpcomingViaDiscover() async throws {
        let today = Date()
        let nextMonth = Calendar.current.date(byAdding: .day, value: 30, to: today)!
        let movieList = try await discoverService.movies(language: "en-US", 
                                                         primaryReleaseDateGTE: today,
                                                         primaryReleaseDateLTE: nextMonth,
                                                         releaseDateGTE: today,
                                                         releaseDateLTE: nextMonth,
                                                         sortedBy: MovieSort.popularity(descending: true),
                                                         regionCode: "US")

        XCTAssertFalse(movieList.results.isEmpty)
//        print("movieList.results: \(movieList.results)")
    }

    func testMoviesDecades() async throws {
        let today = Date()
        let nextMonth = Calendar.current.date(byAdding: .day, value: 30, to: today)!
        let movieList = try await discoverService.movies(language: "en-US", 
                                                         primaryReleaseDateGTE: today,
                                                         primaryReleaseDateLTE: nextMonth,
                                                         releaseDateGTE: today,
                                                         releaseDateLTE: nextMonth,
                                                         sortedBy: MovieSort.popularity(descending: true),
                                                         regionCode: "US")

        XCTAssertFalse(movieList.results.isEmpty)
//        print("movieList.results: \(movieList.results)")
    }

    
    func testTVSeriesDecade() async throws {
        let start = toDate("1950-01-01")
        let end = toDate("1959-12-31")
        let seriesList = try await discoverService.tvSeries(language: "en-US",
                                                            sortedBy: TVSeriesSort.popularity(descending: true),
                                                            airDateGTE: start,
                                                            airDateLTE: end)

        XCTAssertFalse(seriesList.results.isEmpty)
        print("seriesList.results: \(seriesList.results)")
    }

    
    
    func testTVSeries() async throws {
        let tvSeriesList = try await discoverService.tvSeries()

        XCTAssertFalse(tvSeriesList.results.isEmpty)
    }

    private func toDate(_ dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString)!
    }

}
