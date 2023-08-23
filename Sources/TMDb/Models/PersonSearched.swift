import Foundation

///
/// A model representing a person returned from a Search endpoint.
///
public struct PersonSearched: Identifiable, Codable, Equatable, Hashable {

    public let person: Person
    public let originalName: String?
    public let knownFor: [Media]?
    
    public var id: Int { return person.id }

    public init(
        id: Int,
        name: String,
        alsoKnownAs: [String]? = nil,
        knownForDepartment: String? = nil,
        biography: String? = nil,
        birthday: Date? = nil,
        deathday: Date? = nil,
        gender: Gender,
        placeOfBirth: String? = nil,
        profilePath: URL? = nil,
        popularity: Double? = nil,
        imdbID: String? = nil,
        homepageURL: URL? = nil,
        originalName: String? = nil,
        knownFor: [Media]? = nil
    ) {
        self.person = .init(
            id: id,
            name: name,
            alsoKnownAs: alsoKnownAs,
            knownForDepartment: knownForDepartment,
            biography: biography,
            birthday: birthday,
            deathday: deathday,
            gender: gender,
            placeOfBirth: placeOfBirth,
            profilePath: profilePath,
            popularity: popularity,
            imdbID: imdbID,
            homepageURL: homepageURL
        )
        self.originalName = originalName
        self.knownFor = knownFor
    }
    
    public init(
        person: Person,
        originalName: String? = nil,
        knownFor: [Media]? = nil
    ) {
        self.person = person
        self.originalName = originalName
        self.knownFor = knownFor
    }
}

extension PersonSearched {

    enum CodingKeys: String, CodingKey {
        case originalName
        case knownFor
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.person = try Person(from: decoder)
        self.originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        self.knownFor = try container.decodeIfPresent([Media].self, forKey: .knownFor)
    }

}
