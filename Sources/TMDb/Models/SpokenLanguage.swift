import Foundation

///
/// A model representing a spoken language.
///
public struct SpokenLanguage: Identifiable, Codable, Equatable, Hashable {

    ///
    /// Language code.
    ///
    public var id: String { languageCode }

    ///
    /// The ISO 639-1 language code.
    ///
    public let languageCode: String

    ///
    /// Language name.
    ///
    public let name: String
    
    
    public let englishName: String?

    ///
    /// Creates a spoken language object.
    ///
    /// - Parameters:
    ///    - languageCode: ISO 639-1 language code.
    ///    - name: Language name.
    ///
    public init(languageCode: String, name: String, englishName: String?) {
        self.languageCode = languageCode
        self.name = name
        self.englishName = englishName
    }

}

extension SpokenLanguage {

    private enum CodingKeys: String, CodingKey {
        case languageCode = "iso6391"
        case name
        case englishName
    }

}
