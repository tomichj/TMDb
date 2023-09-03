//
//  File.swift
//  
//
//  Created by Justin Tomich on 9/2/23.
//

import Foundation

public struct TVShowCreator: Identifiable, Codable, Equatable, Hashable {
    
    public let id: Int
    public let creditId: String
    public let name: String
    public let gender: Int?
    public let profilePath: URL?
    
    public init(
        id: Int,
        creditId: String,
        name: String,
        gender: Int? = nil,
        profilePath: URL? = nil
    ) {
        self.id = id
        self.creditId = creditId
        self.name = name
        self.gender = gender
        self.profilePath = profilePath
    }
}

extension TVShowCreator {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case creditId
        case name
        case gender
        case profilePath
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.creditId = try container.decode(String.self, forKey: .creditId)
        self.name = try container.decode(String.self, forKey: .name)
        self.gender = try container.decodeIfPresent(Int.self, forKey: .gender)
        self.profilePath = try container.decodeIfPresent(URL.self, forKey: .profilePath)
    }
}
