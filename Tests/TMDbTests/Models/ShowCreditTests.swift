@testable import TMDb
import XCTest

final class ShowCreditTests: XCTestCase {

    func testIDWhenMovieReturnsMovieID() {
        XCTAssertEqual(movieShow.id, 109091)
    }

    func testIDWhenTVShowReturnsTVShowID() {
        XCTAssertEqual(tvShowShow.id, 54)
    }

    func testPopularityWhenMovieReturnsMoviePopularity() {
        XCTAssertEqual(movieShow.popularity, 3.597124)
    }

    func testPopularityWhenTVShowReturnsTVShowPopularity() {
        XCTAssertEqual(tvShowShow.popularity, 2.883124)
    }

    func testDateWhenMovieReturnsMovieReleaseDate() {
        let expectedResult = DateFormatter.theMovieDatabase.date(from: "2013-10-25")
        XCTAssertEqual(movieShow.date, expectedResult)
    }

    func testDateWhenTVShowReturnsTVShowFirstAirDate() {
        let expectedResult = DateFormatter.theMovieDatabase.date(from: "1985-09-24")
        XCTAssertEqual(tvShowShow.date, expectedResult)
    }

    func testDecodeReturnsMovie() throws {
        let result = try JSONDecoder.theMovieDatabase.decode(ShowCredit.self, fromResource: "show-movie")

        XCTAssertEqual(result, movieShow)
    }

    func testDecodeReturnsTVShow() throws {
        let result = try JSONDecoder.theMovieDatabase.decode(ShowCredit.self, fromResource: "show-tv-series")

        XCTAssertEqual(result, tvShowShow)
    }

}

extension ShowCreditTests {

    // swiftlint:disable line_length
    private var movieShow: ShowCredit {
        .movie(
            .init(
                id: 109091,
                creditID: "52fe4aaac3a36847f81db47d",
                title: "The Counselor",
                originalTitle: "The Counselor",
                originalLanguage: "en",
                overview: "A rich and successful lawyer named Counselor is about to get married to his fiancée but soon meets up with the middle-man known as Westray who tells him his drug trafficking plan has taken a horrible twist and now he must protect himself and his soon bride-to-be lover as the truth of the drug business uncovers and targets become chosen.",
                releaseDate: DateFormatter.theMovieDatabase.date(from: "2013-10-25"),
                posterPath: URL(string: "/uxp6rHVBzUqZCyTaUI8xzUP5sOf.jpg"),
                backdropPath: URL(string: "/62xHmGnxMi0wV40BS3iKnDru0nO.jpg"),
                popularity: 3.597124,
                voteAverage: 5,
                voteCount: 661,
                hasVideo: false,
                isAdultOnly: false,
                character: "Westray"
            )
        )
    }

    private var tvShowShow: ShowCredit {
        .tvShow(
            .init(
                id: 54,
                creditID: "525333fb19c295794002c720",
                name: "Growing Pains",
                originalName: "Growing Pains",
                originalLanguage: "en",
                overview: "Growing Pains is an American television sitcom about an affluent family, residing in Huntington, Long Island, New York, with a working mother and a stay-at-home psychiatrist father raising three children together, which aired on ABC from September 24, 1985, to April 25, 1992.",
                firstAirDate: DateFormatter.theMovieDatabase.date(from: "1985-09-24"),
                originCountry: ["US"],
                posterPath: URL(string: "/eKyeUFwjc0LhPSp129IHpXniJVR.jpg"),
                backdropPath: URL(string: "/xYpXcp7S8pStWihcksTQQue3jlV.jpg"),
                popularity: 2.883124,
                voteAverage: 6.2,
                voteCount: 25,
                character: "",
                episodeCount: 2
            )
        )
    }
    // swiftlint:enable line_length

}
