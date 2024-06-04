import Foundation

public struct AlternativeTitle: Codable, Equatable, Hashable {
    public let countryCode: String?
    public let title: String?
    public let type: String?
}

extension AlternativeTitle {
    
    private enum CodingKeys: String, CodingKey {
        case countryCode = "iso31661"
        case title
        case type
    }
    
}
