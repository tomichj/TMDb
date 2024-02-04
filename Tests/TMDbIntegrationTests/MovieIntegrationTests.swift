import TMDb
import XCTest

final class MovieIntegrationTests: XCTestCase {

    var movieService: MovieService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        try configureTMDb()
        movieService = MovieService()
    }

    override func tearDown() {
        movieService = nil
        super.tearDown()
    }

    func testDetails() async throws {
        let movieID = 346698

        let movie = try await movieService.details(forMovie: movieID)

        XCTAssertEqual(movie.id, movieID)
        XCTAssertEqual(movie.title, "Barbie")
    }

    func testCredits() async throws {
        let movieID = 346698

        let credits = try await movieService.credits(forMovie: movieID)

//        XCTAssertEqual(credits.id, movieID)
        XCTAssertFalse(credits.cast.isEmpty)
        XCTAssertFalse(credits.crew.isEmpty)
    }

    func testReviews() async throws {
        let movieID = 346698

        let reviewList = try await movieService.reviews(forMovie: movieID)

        XCTAssertFalse(reviewList.results.isEmpty)
    }

    func testImages() async throws {
        let movieID = 346698

        let imageCollection = try await movieService.images(forMovie: movieID)

        XCTAssertEqual(imageCollection.id, movieID)
        XCTAssertFalse(imageCollection.posters.isEmpty)
        XCTAssertFalse(imageCollection.logos.isEmpty)
        XCTAssertFalse(imageCollection.backdrops.isEmpty)
    }

    func testVideos() async throws {
        let movieID = 346698

        let videoCollection = try await movieService.videos(forMovie: movieID)

        XCTAssertEqual(videoCollection.id, movieID)
        XCTAssertFalse(videoCollection.results.isEmpty)
    }

    func testRecommendations() async throws {
        let movieID = 921636

        let recommendationList = try await movieService.recommendations(forMovie: movieID)

        XCTAssertFalse(recommendationList.results.isEmpty)
    }

    func testSimilar() async throws {
        let movieID = 921636

        let movieList = try await movieService.similar(toMovie: movieID)

        XCTAssertFalse(movieList.results.isEmpty)
    }

    func testNowPlaying() async throws {
        let movieList = try await movieService.nowPlaying()

        XCTAssertFalse(movieList.results.isEmpty)
    }

    func testPopular() async throws {
        let movieList = try await movieService.popular()

        XCTAssertFalse(movieList.results.isEmpty)
    }

    func testTopRated() async throws {
        let movieList = try await movieService.topRated()

        XCTAssertFalse(movieList.results.isEmpty)
    }

    func testUpcoming() async throws {
        let movieList = try await movieService.upcoming()

        XCTAssertFalse(movieList.results.isEmpty)
    }

    func testExternalIDs() async throws {
        let movieID = 575264
        
        let movieExternalIdList: MovieExternalIds = try await movieService.externalIDs(forMovie: movieID)
        
        XCTAssertTrue(movieExternalIdList.imdbId != nil)
    }

    func testFullDetails() async throws {
        let movieID = 575264
                
        let movie: Movie = try await movieService.fullDetails(forMovie: movieID)
        
        print("Cast members count: \(String(describing: movie.credits?.cast.count))")
        print("imdb: \(String(describing: movie.externalIds?.imdbId))")
        XCTAssertEqual(movie.id, movieID)
        XCTAssertEqual(movie.title, "Mission: Impossible - Dead Reckoning Part One")
        XCTAssertTrue(movie.credits != nil)
        XCTAssertTrue(movie.credits?.cast != nil)
        XCTAssertTrue((movie.credits?.cast.count)! > 0)
        XCTAssertTrue(movie.externalIds != nil)
        XCTAssertTrue(movie.externalIds?.imdbId != nil)
        XCTAssertTrue(movie.releaseDates != nil)
        XCTAssertTrue(movie.similar != nil)
        XCTAssertTrue(movie.similar?.page == 1)
        XCTAssertTrue(movie.keywords != nil)
        XCTAssertTrue((movie.keywords!.keywords?.count)! > 0)
        
    }
}
