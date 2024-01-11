import Foundation

///
/// A model representing a show - movie or TV show.
///
public enum ShowCredit: Identifiable, Equatable, Hashable {

    ///
    /// Show identifier.
    ///
    public var id: Int {
        switch self {
        case .movie(let movie):
            return movie.id

        case .tvShow(let tvShow):
            return tvShow.id
        }
    }

    ///
    /// Show's popularity.
    ///
    public var popularity: Double? {
        switch self {
        case .movie(let movie):
            return movie.popularity

        case .tvShow(let tvShow):
            return tvShow.popularity
        }
    }

    ///
    /// Show's release or first air date.
    ///
    public var date: Date? {
        switch self {
        case .movie(let movie):
            return movie.releaseDate

        case .tvShow(let tvShow):
            return tvShow.firstAirDate
        }
    }
    
    ///
    /// Movie.
    ///
    case movie(MovieCredit)

    ///
    /// TV show.
    ///
    case tvShow(TVSeriesCredit)

}

extension ShowCredit: Codable {

    private enum CodingKeys: String, CodingKey {
        case mediaType
    }

    private enum MediaType: String, Decodable, Equatable {
        case movie
        case tvShow = "tv"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let mediaType = try container.decode(MediaType.self, forKey: .mediaType)

        switch mediaType {
        case .movie:
            self = .movie(try MovieCredit(from: decoder))

        case .tvShow:
            self = .tvShow(try TVSeriesCredit(from: decoder))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var singleContainer = encoder.singleValueContainer()

        switch self {
        case .movie(let movie):
            try singleContainer.encode(movie)
            
        case .tvShow(let tvShow):
            try singleContainer.encode(tvShow)
        }
    }

}
