import Foundation

public struct MovieExternalIds: Codable, Equatable, Hashable {
    public let imdbId: String?
    public let wikidataId: String?
    public let facebookId: String?
    public let instagramId: String?
    public let twitterId: String?
    
    public init(
        imdbId: String? = nil,
        wikidataId: String? = nil,
        facebookId: String? = nil,
        instagramId: String? = nil,
        twitterId: String? = nil
    ) {
        self.imdbId = imdbId
        self.wikidataId = wikidataId
        self.facebookId = facebookId
        self.instagramId = instagramId
        self.twitterId = twitterId
    }
}

extension MovieExternalIds {
    public enum CodingKeys: String, CodingKey {
        case imdbId
        case wikidataId
        case facebookId
        case instagramId
        case twitterId
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imdbId = try container.decodeIfPresent(String.self, forKey: .imdbId)
        self.wikidataId = try container.decodeIfPresent(String.self, forKey: .wikidataId)
        self.facebookId = try container.decodeIfPresent(String.self, forKey: .facebookId)
        self.instagramId = try container.decodeIfPresent(String.self, forKey: .instagramId)
        self.twitterId = try container.decodeIfPresent(String.self, forKey: .twitterId)
    }
}
