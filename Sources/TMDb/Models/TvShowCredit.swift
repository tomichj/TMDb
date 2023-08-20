import Foundation

///
/// A model representing a TV show.
///
public struct TVShowCredit: Identifiable, Codable, Equatable, Hashable {

    ///
    /// TV show identifier.
    ///
    public let id: Int

    public let creditID: String

    ///
    /// TV show name.
    ///
    public let name: String

    ///
    /// Original TV show name.
    ///
    public let originalName: String?

    ///
    /// Original language of the TV show.
    ///
    public let originalLanguage: String?

    ///
    /// TV show overview.
    ///
    public let overview: String?

    ///
    /// TV show genres.
    ///
    public let genres: [Genre]?

    ///
    /// TV show's first air date.
    ///
    public let firstAirDate: Date?

    ///
    /// TV show country of origin.
    ///
    public let originCountry: [String]?

    ///
    /// TV show poster path.
    ///
    /// To generate a full URL see <doc:/TMDb/GeneratingImageURLs>.
    ///
    public let posterPath: URL?

    ///
    /// TV show backdrop path.
    ///
    /// To generate a full URL see <doc:/TMDb/GeneratingImageURLs>.
    ///
    public let backdropPath: URL?

    ///
    /// TV show current popularity.
    ///
    public let popularity: Double?

    ///
    /// Average vote score.
    ///
    public let voteAverage: Double?

    ///
    /// Number of votes.
    ///
    public let voteCount: Int?

    ///
    /// Is the TV show only suitable for adults.
    ///
    public let isAdultOnly: Bool?
    
    public let department: String?
    public let job: String?
    public let character: String?
    public let episodeCount: Int?

    ///
    /// Creates a TV show object.
    ///
    /// - Parameters:
    ///    - id: TV show identifier.
    ///    - name: TV show name.
    ///    - originalName: Original TV show name.
    ///    - originalLanguage: Original language of the TV show.
    ///    - overview: TV show overview.
    ///    - episodeRunTime: TV show episode run times, in minutes.
    ///    - numberOfSeasons: Number of seasons in the TV show.
    ///    - numberOfEpisodes: Total number of episodes in the TV show.
    ///    - seasons: Seasons in the TV show.
    ///    - genres: TV show genres.
    ///    - firstAirDate: TV show's first air date.
    ///    - originCountry: TV show country of origin.
    ///    - posterPath: TV show poster path.
    ///    - backdropPath: TV show backdrop path.
    ///    - homepageURL: TV show's web site URL.
    ///    - isInProduction: Is TV show currently in production.
    ///    - languages: Languages the TV show is available in.
    ///    - lastAirDate: Last air date of the TV show.
    ///    - networks: Networks involved in the TV show.
    ///    - productionCompanies: Production companies involved in the TV show.
    ///    - status: TV show status.
    ///    - popularity: TV show current popularity.
    ///    - voteAverage: Average vote score.
    ///    - voteCount: Number of votes.
    ///    - isAdultOnly: Is the TV show only suitable for adults.
    ///
    public init(
        id: Int,
        creditID: String,
        name: String,
        originalName: String? = nil,
        originalLanguage: String? = nil,
        overview: String? = nil,
        genres: [Genre]? = nil,
        firstAirDate: Date? = nil,
        originCountry: [String]? = nil,
        posterPath: URL? = nil,
        backdropPath: URL? = nil,
        popularity: Double? = nil,
        voteAverage: Double? = nil,
        voteCount: Int? = nil,
        isAdultOnly: Bool? = nil,
        department: String? = nil,
        job: String? = nil,
        character: String? = nil,
        episodeCount: Int? = nil
    ) {
        self.id = id
        self.creditID = creditID
        self.name = name
        self.originalName = originalName
        self.originalLanguage = originalLanguage
        self.overview = overview
        self.genres = genres
        self.firstAirDate = firstAirDate
        self.originCountry = originCountry
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.popularity = popularity
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.isAdultOnly = isAdultOnly
        self.department = department
        self.job = job
        self.character = character
        self.episodeCount = episodeCount
    }

}

extension TVShowCredit {

    private enum CodingKeys: String, CodingKey {
        case id
        case creditID = "creditId"
        case name
        case originalName
        case originalLanguage
        case overview
        case genres
        case firstAirDate
        case originCountry
        case posterPath
        case backdropPath
        case popularity
        case voteAverage
        case voteCount
        case isAdultOnly = "adult"
        case department
        case job
        case character
        case episodeCount
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let container2 = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.creditID = try container.decode(String.self, forKey: .creditID)
        self.name = try container.decode(String.self, forKey: .name)
        self.originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        self.originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.genres = try container.decodeIfPresent([Genre].self, forKey: .genres)

        // Need to deal with empty strings - date decoding will fail with an empty string
        let firstAirDateString = try container.decodeIfPresent(String.self, forKey: .firstAirDate)
        self.firstAirDate = try {
            guard let firstAirDateString, !firstAirDateString.isEmpty else {
                return nil
            }

            return try container2.decodeIfPresent(Date.self, forKey: .firstAirDate)
        }()

        self.originCountry = try container.decodeIfPresent([String].self, forKey: .originCountry)
        self.posterPath = try container.decodeIfPresent(URL.self, forKey: .posterPath)
        self.backdropPath = try container.decodeIfPresent(URL.self, forKey: .backdropPath)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        self.voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
        self.voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        self.isAdultOnly = try container.decodeIfPresent(Bool.self, forKey: .isAdultOnly)
        self.department = try container.decodeIfPresent(String.self, forKey: .department)
        self.job = try container.decodeIfPresent(String.self, forKey: .job)
        self.character = try container.decodeIfPresent(String.self, forKey: .character)
        self.episodeCount = try container.decodeIfPresent(Int.self, forKey: .episodeCount)
    }

}
