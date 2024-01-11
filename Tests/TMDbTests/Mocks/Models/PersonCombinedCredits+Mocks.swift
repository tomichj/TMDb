import Foundation
import TMDb

extension PersonCombinedCredits {

    static func mock(
        id: Int = .randomID,
        cast: [ShowCredit] = [
            .movie(.jurassicWorldDominion),
            .tvShow(.theSandman),
            .movie(.topGunMaverick),
            .tvShow(.sheHulk),
            .tvShow(.strangerThings)
        ],
        crew: [ShowCredit] = [
            .movie(.bulletTrain),
            .tvShow(.theSandman),
            .movie(.thorLoveAndThunder)
        ]
    ) -> Self {
        .init(
            cast: cast,
            crew: crew
        )
    }

}
