import Foundation

public struct CreditMedia: Identifiable, Codable, Equatable, Hashable {
    public let id: Int
    public let adult: Bool?
    public let backdropPath: URL?
    public let character: String?
    public let name: String?
    public let originalName: String?
    public let overview: String
    public let posterPath: URL?
//    public let firstAirDate: Date?
    public let firstAirDate: String?
    public let popularity: Double?
    public let voteAverage: Double?
    public let voteCount: Int?
    public let episodes: [TVEpisode]?
    public let seasons: [TVSeason]?
}
