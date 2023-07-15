import Foundation

public struct ReleaseDate: Codable, Equatable, Hashable {
    public let certification: String?
    public let descriptors: [String]?
    public let iso6391: String? // SpokenLanguage
    public let note: String?
    public let releaseDateString: String
    public let type: Int

    public var releaseDate: Date {
        return DateFormatter.theMovieDatabase.date(from: releaseDateString)!
    }

    public init(
        certification: String?,
        descriptors: [String]?,
        iso6391: String?,
        note: String?,
        releaseDateString: String,
        type: Int
    ) {
        self.certification = certification
        self.descriptors = descriptors
        self.iso6391 = iso6391
        self.note = note
        self.releaseDateString = releaseDateString
        self.type = type
    }
}

extension ReleaseDate {

    private enum CodingKeys: String, CodingKey {
        case certification
        case descriptors
        case iso6391 = "iso_639_1"
        case note
        case releaseDateString = "release_date"
        case type
    }

}
