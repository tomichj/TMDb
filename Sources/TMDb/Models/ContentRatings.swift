//
//  File.swift
//  
//
//  Created by Justin Tomich on 9/22/23.
//

import Foundation

public struct ContentRatings: Codable, Equatable, Hashable {
    public let results: [ContentRating]
}

extension ContentRatings {

    private enum CodingKeys: String, CodingKey {
        case results
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([ContentRating].self, forKey: .results)
    }

}
