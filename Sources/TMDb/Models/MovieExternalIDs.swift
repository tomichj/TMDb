//
//  File.swift
//  
//
//  Created by Justin Tomich on 10/15/23.
//

import Foundation

public struct MovieExternalIDs: Identifiable, Codable, Equatable, Hashable {
    public let id: Int
    public let imdbID: String?
    public let wikidataID: String?
    public let facebookID: String?
    public let instagramID: String?
    public let twitterID: String?
    
    public init(
        id: Int,
        imdbID: String? = nil,
        wikidataID: String? = nil,
        facebookID: String? = nil,
        instagramID: String? = nil,
        twitterID: String? = nil
    ) {
        self.id = id
        self.imdbID = imdbID
        self.wikidataID = wikidataID
        self.facebookID = facebookID
        self.instagramID = instagramID
        self.twitterID = twitterID
    }
}

extension MovieExternalIDs {
    private enum CodingKeys: String, CodingKey {
        case id
        case imdbID
        case wikidataID
        case facebookID
        case instagramID
        case twitterID
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID)
        self.wikidataID = try container.decodeIfPresent(String.self, forKey: .wikidataID)
        self.facebookID = try container.decodeIfPresent(String.self, forKey: .facebookID)
        self.instagramID = try container.decodeIfPresent(String.self, forKey: .instagramID)
        self.twitterID = try container.decodeIfPresent(String.self, forKey: .twitterID)
    }
}
