//
//  File.swift
//  
//
//  Created by Justin Tomich on 9/22/23.
//

import Foundation

public struct ContentRatings: Identifiable, Codable, Equatable, Hashable {
    public let id: Int
    public let results: [ContentRating]
}

extension ContentRatings {

    private enum CodingKeys: String, CodingKey {
        case id
        case results
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.results = try container.decode([ContentRating].self, forKey: .results)
    }

}
