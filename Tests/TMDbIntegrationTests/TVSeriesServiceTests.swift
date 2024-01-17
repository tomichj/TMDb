import TMDb
import XCTest

final class TVSeriesServiceTests: XCTestCase {

    var tvSeriesService: TVSeriesService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        try configureTMDb()
        tvSeriesService = TVSeriesService()
    }

    override func tearDown() {
        tvSeriesService = nil
        super.tearDown()
    }

    func testDetails() async throws {
        let tvSeriesID = 84958

        let tvSeries = try await tvSeriesService.details(forTVSeries: tvSeriesID)

        XCTAssertEqual(tvSeries.id, tvSeriesID)
        XCTAssertEqual(tvSeries.name, "Loki")
    }

    func testCredits() async throws {
        let tvSeriesID = 4604

        let credits = try await tvSeriesService.credits(forTVSeries: tvSeriesID)

        XCTAssertFalse(credits.cast.isEmpty)
        XCTAssertFalse(credits.crew.isEmpty)
    }

    func testReviews() async throws {
        let tvSeriesID = 76479

        let reviewList = try await tvSeriesService.reviews(forTVSeries: tvSeriesID)

        XCTAssertFalse(reviewList.results.isEmpty)
    }

    func testImages() async throws {
        let tvSeriesID = 76479

        let imageCollection = try await tvSeriesService.images(forTVSeries: tvSeriesID)

        XCTAssertEqual(imageCollection.id, tvSeriesID)
        XCTAssertFalse(imageCollection.backdrops.isEmpty)
        XCTAssertFalse(imageCollection.logos.isEmpty)
        XCTAssertFalse(imageCollection.posters.isEmpty)
    }

    func testVideos() async throws {
        let tvSeriesID = 76479

        let videoCollection = try await tvSeriesService.videos(forTVSeries: tvSeriesID)

        XCTAssertEqual(videoCollection.id, tvSeriesID)
        XCTAssertFalse(videoCollection.results.isEmpty)
    }

    func testRecommendations() async throws {
        let tvSeriesID = 76479

        let tvSeriesList = try await tvSeriesService.recommendations(forTVSeries: tvSeriesID)

        XCTAssertFalse(tvSeriesList.results.isEmpty)
    }

    func testSimilar() async throws {
        let tvSeriesID = 76479

        let tvSeriesList = try await tvSeriesService.similar(toTVSeries: tvSeriesID)

        XCTAssertFalse(tvSeriesList.results.isEmpty)
    }

    func testPopular() async throws {
        let tvSeriesList = try await tvSeriesService.popular()

        XCTAssertFalse(tvSeriesList.results.isEmpty)
    }

    func testExternalIDs() async throws {
        let tvSeriesID = 76479
        
        let externalIds = try await tvSeriesService.externalIDs(forTVSeries: tvSeriesID)
        print(String(describing: externalIds))
        
        XCTAssertTrue(externalIds.imdbId != nil)
    }

    func testFullDetails() async throws {
        let tvSeriesID = 76479
//        let tvSeriesID = 2051
        
        let tvSeries = try await tvSeriesService.fullDetails(forTVSeries: tvSeriesID)
        
        XCTAssertTrue(tvSeries.aggregateCredits != nil)
        XCTAssertTrue(tvSeries.aggregateCredits?.cast != nil)
        XCTAssertTrue((tvSeries.aggregateCredits?.cast.count)! > 0)
        XCTAssertTrue(tvSeries.aggregateCredits?.crew != nil)
        XCTAssertTrue((tvSeries.aggregateCredits?.crew.count)! > 0)
        XCTAssertTrue(tvSeries.contentRatings != nil)
        XCTAssertTrue(tvSeries.contentRatings?.results != nil)
        XCTAssertTrue((tvSeries.contentRatings?.results.count)! > 0)
        XCTAssertTrue(tvSeries.externalIds != nil)
        XCTAssertTrue(tvSeries.externalIds?.imdbId != nil)
        XCTAssertTrue(tvSeries.nextEpisodeToAir == nil)
//        XCTAssertTrue(tvSeries.nextEpisodeToAir != nil)
    }

}
