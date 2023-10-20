import Foundation

public struct TVSeriesExternalIdList: Identifiable, Codable, Equatable, Hashable {
    public let id: Int
    public let imdbId: String?
    public let freebaseMid: String?
    public let freebaseId: String?
    public let tvdbId: Int?
    public let tvrageId: Int?
    public let wikidataId: String?
    public let facebookId: String?
    public let instagramId: String?
    public let twitterId: String?
    
    public init(
        id: Int,
        imdbId: String? = nil,
        freebaseMid: String? = nil,
        freebaseId: String? = nil,
        tvdbId: Int? = nil,
        tvrageId: Int? = nil,
        wikidataId: String? = nil,
        facebookId: String? = nil,
        instagramId: String? = nil,
        twitterId: String? = nil
    ) {
        self.id = id
        self.imdbId = imdbId
        self.freebaseMid = freebaseMid
        self.freebaseId = freebaseId
        self.tvdbId = tvdbId
        self.tvrageId = tvrageId
        self.wikidataId = wikidataId
        self.facebookId = facebookId
        self.instagramId = instagramId
        self.twitterId = twitterId
    }
}
