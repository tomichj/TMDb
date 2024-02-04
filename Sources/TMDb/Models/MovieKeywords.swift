import Foundation

public struct MovieKeywords: Codable, Equatable, Hashable {
    public let keywords: [Keyword]?
    public var results: [Keyword]? { return keywords }
}

extension MovieKeywords {

    private enum CodingKeys: String, CodingKey {
        case keywords
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.keywords = try container.decodeIfPresent([Keyword].self, forKey: .keywords)
    }
    
}
