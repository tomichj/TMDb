import Foundation

public struct MovieExternalIdList: Identifiable, Codable, Equatable, Hashable {
    public let id: Int
    public let imdbId: String?
    public let wikidataId: String?
    public let facebookId: String?
    public let instagramId: String?
    public let twitterId: String?
    
    public init(
        id: Int,
        imdbId: String? = nil,
        wikidataId: String? = nil,
        facebookId: String? = nil,
        instagramId: String? = nil,
        twitterId: String? = nil
    ) {
        self.id = id
        self.imdbId = imdbId
        self.wikidataId = wikidataId
        self.facebookId = facebookId
        self.instagramId = instagramId
        self.twitterId = twitterId
    }
}

