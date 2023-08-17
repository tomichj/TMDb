import Foundation
@testable import TMDb

extension MovieCredit {

    static func mock(
        id: Int = Int.randomID,
        creditId: Int = Int.randomID,
        title: String? = nil,
        originalTitle: String? = nil,
        originalLanguage: String? = "en",
        overview: String? = .randomString,
        genres: [Genre]? = .mocks,
        releaseDate: Date? = .random,
        posterPath: URL? = .randomImagePath,
        backdropPath: URL? = .randomImagePath,
        popularity: Double? = Double.random(in: 1...10),
        voteAverage: Double? = Double.random(in: 1...10),
        voteCount: Int? = Int.random(in: 1...1000),
        hasVideo: Bool? = .random(),
        isAdultOnly: Bool? = .random(),
        department: String? = nil,
        job: String? = nil,
        character: String? = nil
    ) -> Self {
        .init(
            id: id,
            creditId: creditId,
            title: title ?? "Movie \(id)",
            originalTitle: originalTitle ?? title ?? "Movie \(id)",
            originalLanguage: originalLanguage,
            overview: overview,
            genres: genres,
            releaseDate: releaseDate,
            posterPath: posterPath,
            backdropPath: backdropPath,
            popularity: popularity,
            voteAverage: voteAverage,
            voteCount: voteCount,
            hasVideo: hasVideo,
            isAdultOnly: isAdultOnly,
            department: department,
            job: job,
            character: character
        )
    }

    static var bulletTrain: Self {
        .mock(
            id: 718930,
            title: "Bullet Train",
            overview: "Unlucky assassin Ladybug is determined to do his job peacefully after one too many gigs gone "
            + "off the rails. Fate, however, may have other plans, as Ladybug's latest mission puts him on a collision "
            + "course with lethal adversaries from around the globe—all with connected, yet conflicting, objectives—on "
            + "the world's fastest train.",
            releaseDate: DateFormatter.theMovieDatabase.date(from: "2022-07-03"),
            department: "Production",
            job: "Executive Producer"
        )
    }

    static var thorLoveAndThunder: Self {
        .mock(
            id: 616037,
            title: "Thor: Love and Thunder",
            overview: "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the "
            + "extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane "
            + "Foster, who now inexplicably wields Mjolnir as the Relatively Mighty Girl Thor. Together they embark "
            + "upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him "
            + "before it’s too late.",
            releaseDate: DateFormatter.theMovieDatabase.date(from: "2022-07-06"),
            department: "Production",
            job: "Executive Producer"
        )
    }

    static var jurassicWorldDominion: Self {
        .mock(
            id: 507086,
            title: "Jurassic World Dominion",
            overview: "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all "
            + "over the world. This fragile balance will reshape the future and determine, once and for all, whether "
            + "human beings are to remain the apex predators on a planet they now share with history’s most fearsome "
            + "creatures.",
            releaseDate: DateFormatter.theMovieDatabase.date(from: "2022-06-01"),
            character: "Colonel Mustard"
        )
    }

    static var topGunMaverick: Self {
        .mock(
            id: 361743,
            title: "Top Gun: Maverick",
            overview: "After more than thirty years of service as one of the Navy’s top aviators, and dodging the "
            + "advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment "
            + "of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.",
            releaseDate: DateFormatter.theMovieDatabase.date(from: "2022-05-24"),
            character: "Henry Heimlich"
        )
    }

}

extension Array where Element == MovieCredit {

    static var mocks: [Element] {
        [
            .bulletTrain,
            .thorLoveAndThunder,
            .jurassicWorldDominion,
            .topGunMaverick
        ]
    }

}
