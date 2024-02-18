import Foundation

public struct CreditMedia: Identifiable, Codable, Equatable, Hashable {
    public let id: Int
    public let backdropPath: URL?
    public let character: String?
    public let episodes: [TVEpisode]?
    public let seasons: [TVSeason]?
}
