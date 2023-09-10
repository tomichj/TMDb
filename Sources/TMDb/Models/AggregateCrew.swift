import Foundation


public struct AggregateCrew: Identifiable, Decodable, Equatable, Hashable {
    public let id: Int
    public let isAdultOnly: Bool?
    public let gender: Int?
    public let knownForDepartment: String?
    public let name: String?
    public let originalName: String?
    public let popularity: Double?
    public let profilePath: URL?
    public let department: String?
    public let totalEpisodeCount: Int?
    public let jobs: [Job]?
    
    public init(
        id: Int,
        isAdultOnly: Bool?,
        gender: Int?,
        knownForDepartment: String?,
        name: String?,
        originalName: String?,
        popularity: Double?,
        profilePath: URL?,
        department: String?,
        totalEpisodeCount: Int?,
        jobs: [Job]?
    ) {
        self.id = id
        self.isAdultOnly = isAdultOnly
        self.gender = gender
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
        self.department = department
        self.totalEpisodeCount = totalEpisodeCount
        self.jobs = jobs
    }
}

public struct Job {
    public var id: String { creditId }
    public let creditId: String
    public let job: String?
    public let episodeCount: Int?
    
    public init(
        creditId: String,
        job: String?,
        episodeCount: Int?
    ) {
        self.creditId = creditId
        self.job = job
        self.episodeCount = episodeCount
    }

}

extension Job: Identifiable, Codable, Equatable, Hashable {
    private enum CodingKeys: String, CodingKey {
        case creditId
        case job
        case episodeCount
    }
}

extension AggregateCrew {
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
        case department
        case jobs
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.isAdultOnly = try container.decodeIfPresent(Bool.self, forKey: .isAdultOnly)
        self.gender = try container.decodeIfPresent(Int.self, forKey: .gender)
        self.knownForDepartment = try container.decodeIfPresent(String.self, forKey: .knownForDepartment)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        self.profilePath = try container.decodeIfPresent(URL.self, forKey: .profilePath)
        self.department = try container.decodeIfPresent(String.self, forKey: .department)
        self.totalEpisodeCount = try container.decodeIfPresent(Int.self, forKey: .totalEpisodeCount)
        self.jobs = try container.decodeIfPresent([Job].self, forKey: .jobs)
    }
}

