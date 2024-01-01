import Foundation

public struct ReleaseDate: Codable, Equatable, Hashable {
    
    public let certification: String?
    
    public let descriptors: [String]?
    
    // language code in iso_639_1 format
    public let languageCode: String? // link to SpokenLanguage
    
    public let note: String?
    
    public let releaseDateString: String
    
    public let type: Int

    public var releaseDate: Date {
        return DateFormatter.theMovieDatabase.date(from: releaseDateString)!
    }

    public init(
        certification: String?,
        descriptors: [String]?,
        languageCode: String?,
        note: String?,
        releaseDateString: String,
        type: Int
    ) {
        self.certification = certification
        self.descriptors = descriptors
        self.languageCode = languageCode
        self.note = note
        self.releaseDateString = releaseDateString
        self.type = type
    }
}

extension ReleaseDate {

    private enum CodingKeys: String, CodingKey {
        case certification
        case descriptors
        case languageCode = "iso6391"
        case note
        case releaseDateString = "releaseDate"
        case type
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.certification = try container.decodeIfPresent(String.self, forKey: .certification)
        self.descriptors = try container.decodeIfPresent([String].self, forKey: .descriptors)
        self.languageCode = try container.decodeIfPresent(String.self, forKey: .languageCode)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.releaseDateString = try container.decode(String.self, forKey: .releaseDateString)
        self.type = try container.decode(Int.self, forKey: .type)
    }


}
