import Foundation


public struct AggregateCast: Identifiable, Decodable, Equatable, Hashable {
    public let id: Int
    public let isAdultOnly: Bool?
    public let gender: Int?
    public let knownForDepartment: String?
    public let name: String
    public let originalName: String?
    public let popularity: Double?
    public let profilePath: URL?
    public let totalEpisodeCount: Int?
    public let order: Int
    public let roles: [Role]?
    
    public init(
        id: Int,
        isAdultOnly: Bool?,
        gender: Int?,
        knownForDepartment: String?,
        name: String,
        originalName: String?,
        popularity: Double?,
        profilePath: URL?,
        totalEpisodeCount: Int?,
        order: Int,
        roles: [Role]?
    ) {
        self.id = id
        self.isAdultOnly = isAdultOnly
        self.gender = gender
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
        self.totalEpisodeCount = totalEpisodeCount
        self.order = order
        self.roles = roles
    }
}

public struct Role {
    public var id: String { creditId }
    public let creditId: String
    public let character: String?
    public let episodeCount: Int?
    
    public init(
        creditId: String,
        character: String?,
        episodeCount: Int?
    ) {
        self.creditId = creditId
        self.character = character
        self.episodeCount = episodeCount
    }
}

extension Role: Identifiable, Codable, Equatable, Hashable {
    private enum CodingKeys: String, CodingKey {
        case creditId
        case character
        case episodeCount
    }
}

extension AggregateCast {
    private enum CodingKeys: String, CodingKey {
        case id
        case isAdultOnly = "adult"
        case gender
        case knownForDepartment
        case name
        case originalName
        case popularity
        case profilePath
        case totalEpisodeCount
        case order
        case roles
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.isAdultOnly = try container.decodeIfPresent(Bool.self, forKey: .isAdultOnly)
        self.gender = try container.decodeIfPresent(Int.self, forKey: .gender)
        self.knownForDepartment = try container.decodeIfPresent(String.self, forKey: .knownForDepartment)
        self.name = try container.decode(String.self, forKey: .name)
        self.originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        self.profilePath = try container.decodeIfPresent(URL.self, forKey: .profilePath)
        self.totalEpisodeCount = try container.decodeIfPresent(Int.self, forKey: .totalEpisodeCount)
        self.order = try container.decode(Int.self, forKey: .order)
        self.roles = try container.decodeIfPresent([Role].self, forKey: .roles)
    }
}


