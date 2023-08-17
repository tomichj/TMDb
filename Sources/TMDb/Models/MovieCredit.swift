import Foundation

///
/// A model representing a movie.
///
public struct MovieCredit: Identifiable, Codable, Equatable, Hashable {

    ///
    /// Movie identifier.
    ///
    public let id: Int
    public let creditId: Int

    ///
    /// Movie title.
    ///
    public let title: String

    ///
    /// Original movie title.
    ///
    public let originalTitle: String?

    ///
    /// Original language of the movie.
    ///
    public let originalLanguage: String?

    ///
    /// Movie overview.
    ///
    public let overview: String?

    ///
    /// Movie genres.
    ///
    public let genres: [Genre]?

    ///
    /// Movie release date.
    ///
    public let releaseDate: Date?

    ///
    /// Movie poster path.
    ///
    /// To generate a full URL see <doc:/TMDb/GeneratingImageURLs>.
    ///
    public let posterPath: URL?

    ///
    /// Movie poster backdrop path.
    ///
    /// To generate a full URL see <doc:/TMDb/GeneratingImageURLs>.
    ///
    public let backdropPath: URL?

    ///
    /// Current popularity.
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
    /// Has video.
    ///
    public let hasVideo: Bool?

    ///
    /// Is the movie only suitable for adults.
    ///
    public let isAdultOnly: Bool?

    public let department: String?
    public let job: String?
    public let character: String?

    
    
    ///
    /// Creates a movie object.
    ///
    /// - Parameters:
    ///    - id: Movie identifier.
    ///    - title: Movie title.
    ///    - tagline: Movie tagline.
    ///    - originalTitle: Original movie title.
    ///    - originalLanguage: Original language of the movie.
    ///    - overview: Movie overview.
    ///    - genres: Movie genres.
    ///    - releaseDate: Movie release date.
    ///    - posterPath: Movie poster path.
    ///    - backdropPath: Movie poster backdrop path.
    ///    - popularity: Current popularity.
    ///    - voteAverage: Average vote score.
    ///    - voteCount: Number of votes.
    ///    - hasVideo: Has video.
    ///    - isAdultOnly: Is the movie only suitable for adults.
    ///
    public init(
        id: Int,
        creditId: Int,
        title: String,
        originalTitle: String? = nil,
        originalLanguage: String? = nil,
        overview: String? = nil,
        genres: [Genre]? = nil,
        releaseDate: Date? = nil,
        posterPath: URL? = nil,
        backdropPath: URL? = nil,
        popularity: Double? = nil,
        voteAverage: Double? = nil,
        voteCount: Int? = nil,
        hasVideo: Bool? = nil,
        isAdultOnly: Bool? = nil,
        department: String?,
        job: String?,
        character: String?
    ) {
        self.id = id
        self.creditId = creditId
        self.title = title
        self.originalTitle = originalTitle
        self.originalLanguage = originalLanguage
        self.overview = overview
        self.genres = genres
        self.releaseDate = releaseDate
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.popularity = popularity
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.hasVideo = hasVideo
        self.isAdultOnly = isAdultOnly
        self.department = department
        self.job = job
        self.character = character
    }

}

extension MovieCredit {

    private enum CodingKeys: String, CodingKey {
        case id
        case creditId
        case title
        case originalTitle
        case originalLanguage
        case overview
        case genres
        case releaseDate
        case posterPath
        case backdropPath
        case popularity
        case voteAverage
        case voteCount
        case hasVideo = "video"
        case isAdultOnly = "adult"
        case department
        case job
        case character
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let container2 = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.creditId = try container.decode(Int.self, forKey: .creditId)
        self.title = try container.decode(String.self, forKey: .title)
        self.originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        self.originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.genres = try container.decodeIfPresent([Genre].self, forKey: .genres)

        // Need to deal with empty strings - date decoding will fail with an empty string
        let releaseDateString = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        self.releaseDate = try {
            guard let releaseDateString, !releaseDateString.isEmpty else {
                return nil
            }

            return try container2.decodeIfPresent(Date.self, forKey: .releaseDate)
        }()

        self.posterPath = try container.decodeIfPresent(URL.self, forKey: .posterPath)
        self.backdropPath = try container.decodeIfPresent(URL.self, forKey: .backdropPath)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        self.voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
        self.voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        self.hasVideo = try container.decodeIfPresent(Bool.self, forKey: .hasVideo)
        self.isAdultOnly = try container.decodeIfPresent(Bool.self, forKey: .isAdultOnly)
        self.department = try container.decodeIfPresent(String.self, forKey: .department)
        self.job = try container.decodeIfPresent(String.self, forKey: .department)
        self.character = try container.decodeIfPresent(String.self, forKey: .department)
    }

}
