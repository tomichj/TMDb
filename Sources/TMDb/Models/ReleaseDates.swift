import Foundation

public struct ReleaseDates: Codable, Equatable, Hashable {
    public let results: [CountryReleaseDates]
}

extension ReleaseDates {
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([CountryReleaseDates].self, forKey: .results)
    }
}
