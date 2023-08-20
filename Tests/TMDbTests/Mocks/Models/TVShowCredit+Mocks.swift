import Foundation
@testable import TMDb

extension TVShowCredit {

    static func mock(
        id: Int = .randomID,
        creditID: String = .randomID,
        name: String? = nil,
        originalName: String? = nil,
        originalLanguage: String? = nil,
        overview: String? = .randomString,
        genres: [Genre]? = nil,
        firstAirDate: Date? = .random,
        originCountry: [String]? = nil,
        posterPath: URL? = nil,
        backdropPath: URL? = nil,
        popularity: Double? = nil,
        voteAverage: Double? = nil,
        voteCount: Int? = nil,
        department: String? = nil,
        job: String? = nil,
        character: String? = nil,
        episodeCount: Int? = nil
    ) -> Self {
        .init(
            id: id,
            creditID: creditID,
            name: name ?? "TV Show \(id)",
            originalName: originalName,
            originalLanguage: originalLanguage,
            overview: overview,
            genres: genres,
            firstAirDate: firstAirDate,
            originCountry: originCountry,
            posterPath: posterPath,
            backdropPath: backdropPath,
            popularity: popularity,
            voteAverage: voteAverage,
            voteCount: voteCount,
            department: department,
            job: job,
            character: character,
            episodeCount: episodeCount
        )
    }

    static var sheHulk: Self {
        .mock(
            id: 92783,
            creditID: "1234923",
            name: "She-Hulk: Attorney at Law",
            firstAirDate: DateFormatter.theMovieDatabase.date(from: "2022-08-18"),
            posterPath: URL(string: "/hJfI6AGrmr4uSHRccfJuSsapvOb.jpg")!
        )
    }

    static var theSandman: Self {
        .mock(
            id: 90802,
            creditID: "99938584",
            name: "The Sandman",
            firstAirDate: DateFormatter.theMovieDatabase.date(from: "2022-08-05"),
            posterPath: URL(string: "/q54qEgagGOYCq5D1903eBVMNkbo.jpg")!,
            department: "Cameras",
            job: "Camera Operator",
            episodeCount: 3
        )
    }

    static var strangerThings: Self {
        .mock(
            id: 66732,
            creditID: "6673232",
            name: "Stranger Things",
            firstAirDate: DateFormatter.theMovieDatabase.date(from: "2016-07-15"),
            posterPath: URL(string: "/49WJfeN0moxb9IPfGn8AIqMGskD.jpg")!
        )
    }

}

extension Array where Element == TVShowCredit {

    static var mocks: [Element] {
        [.sheHulk, .theSandman, .strangerThings]
    }

}
