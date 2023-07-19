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
        case languageCode = "iso_639_1"
        case note
        case releaseDateString = "release_date"
        case type
    }

}
