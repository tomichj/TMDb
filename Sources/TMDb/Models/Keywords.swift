import Foundation

public struct Keywords: Codable, Equatable, Hashable {
    public let keywords: [Keyword]
}

extension Keywords {

    private enum CodingKeys: String, CodingKey {
        case keywords
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.keywords = try container.decode([Keyword].self, forKey: .keywords)
    }
    
}
