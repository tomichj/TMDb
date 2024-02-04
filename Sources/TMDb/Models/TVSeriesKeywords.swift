import Foundation

public struct TVSeriesKeywords: Codable, Equatable, Hashable {
    public let results: [Keyword]?
}

extension TVSeriesKeywords {

    private enum CodingKeys: String, CodingKey {
        case results
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decodeIfPresent([Keyword].self, forKey: .results)
    }
    
}
