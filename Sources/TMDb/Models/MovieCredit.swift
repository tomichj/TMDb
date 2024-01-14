import Foundation


public struct MovieCredit: Identifiable, Codable, Equatable, Hashable {

    public let movie: Movie
    public let creditID: String
    public let department: String?
    public let job: String?
    public let character: String?
    public let order: Int?

    public var id: Int { return movie.id }
    public var popularity: Double? { return movie.popularity }
    public var releaseDate: Date? { return movie.releaseDate }
    
    public init(
        movie: Movie,
        creditID: String,
        department: String? = nil,
        job: String? = nil,
        character: String? = nil,
        order: Int? = nil
    ) {
        self.movie = movie
        self.creditID = creditID
        self.department = department
        self.job = job
        self.character = character
        self.order = order
    }

    public init(
        id: Int,
        creditID: String,
        title: String,
        tagline: String? = nil,
        originalTitle: String? = nil,
        originalLanguage: String? = nil,
        overview: String? = nil,
        runtime: Int? = nil,
        genres: [Genre]? = nil,
        releaseDate: Date? = nil,
        posterPath: URL? = nil,
        backdropPath: URL? = nil,
        popularity: Double? = nil,
        voteAverage: Double? = nil,
        voteCount: Int? = nil,
        hasVideo: Bool? = nil,
        isAdultOnly: Bool? = nil,
        department: String? = nil,
        job: String? = nil,
        character: String? = nil,
        order: Int? = nil
    ) {
        self.movie = .init(
            id: id,
            title: title,
            tagline: tagline,
            originalTitle: originalTitle,
            originalLanguage: originalLanguage,
            overview: overview,
            runtime: runtime,
            genres: genres,
            releaseDate: releaseDate,
            posterPath: posterPath,
            backdropPath: backdropPath,
            popularity: popularity,
            voteAverage: voteAverage,
            voteCount: voteCount,
            hasVideo: hasVideo,
            isAdultOnly: isAdultOnly
        )
        self.creditID = creditID
        self.department = department
        self.job = job
        self.character = character
        self.order = order
    }
}

extension MovieCredit {

    private enum CodingKeys: String, CodingKey {
        case creditID = "creditId"
        case department
        case job
        case character
        case order
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.movie = try Movie(from: decoder)
        self.creditID = try container.decode(String.self, forKey: .creditID)
        self.department = try container.decodeIfPresent(String.self, forKey: .department)
        self.job = try container.decodeIfPresent(String.self, forKey: .job)
        self.character = try container.decodeIfPresent(String.self, forKey: .character)
        self.order = try container.decodeIfPresent(Int.self, forKey: .order)
    }

}
