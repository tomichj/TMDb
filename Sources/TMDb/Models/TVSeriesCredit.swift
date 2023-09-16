import Foundation


public struct TVSeriesCredit: Identifiable, Codable, Equatable, Hashable {

    public let tvSeries: TVSeries
    public let creditID: String
    public let department: String?
    public let job: String?
    public let character: String?
    public let episodeCount: Int?
    
    public var id: Int { return tvSeries.id }
    public var popularity: Double? { return tvSeries.popularity }
    public var firstAirDate: Date? { return tvSeries.firstAirDate }

    public init(
        tvSeries: TVSeries,
        creditID: String,
        department: String? = nil,
        job: String? = nil,
        character: String? = nil,
        episodeCount: Int? = nil
    ) {
        self.tvSeries = tvSeries
        self.creditID = creditID
        self.department = department
        self.job = job
        self.character = character
        self.episodeCount = episodeCount
    }
    
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
        self.tvSeries = .init(
            id: id,
            name: name,
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
            isAdultOnly: isAdultOnly
        )
        self.creditID = creditID
        self.department = department
        self.job = job
        self.character = character
        self.episodeCount = episodeCount
    }
    


}

extension TVSeriesCredit {

    private enum CodingKeys: String, CodingKey {
        case creditID = "creditId"
        case department
        case job
        case character
        case episodeCount
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.tvSeries = try TVSeries(from: decoder)
        self.creditID = try container.decode(String.self, forKey: .creditID)
        self.department = try container.decodeIfPresent(String.self, forKey: .department)
        self.job = try container.decodeIfPresent(String.self, forKey: .job)
        self.character = try container.decodeIfPresent(String.self, forKey: .character)
        self.episodeCount = try container.decodeIfPresent(Int.self, forKey: .episodeCount)
    }

}
