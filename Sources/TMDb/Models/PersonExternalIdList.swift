import Foundation

public struct PersonExternalIdList: Codable, Equatable, Hashable {
    public let freebaseMid: String?
    public let freebaseId: String?
    public let imdbId: String?
    public let tvrageId: Int?
    public let wikidataId: String?
    public let facebookId: String?
    public let instagramId: String?
    public let tictokId: String?
    public let twitterId: String?
    public let youtubeId: String?
    
    public init(
        freebaseMid: String? = nil,
        freebaseId: String? = nil,
        imdbId: String? = nil,
        tvrageId: Int? = nil,
        wikidataId: String? = nil,
        facebookId: String? = nil,
        instagramId: String? = nil,
        tictokId: String? = nil,
        twitterId: String? = nil,
        youtubeId: String? = nil
    ) {
        self.freebaseMid = freebaseMid
        self.freebaseId = freebaseId
        self.imdbId = imdbId
        self.tvrageId = tvrageId
        self.wikidataId = wikidataId
        self.facebookId = facebookId
        self.instagramId = instagramId
        self.tictokId = tictokId
        self.twitterId = twitterId
        self.youtubeId = youtubeId
    }
}
