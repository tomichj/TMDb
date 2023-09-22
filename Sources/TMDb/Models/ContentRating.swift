//
//  File.swift
//  
//
//  Created by Justin Tomich on 9/22/23.
//

import Foundation

public struct ContentRating: Identifiable, Codable, Equatable, Hashable {
    public var id: String { countryCode }
    public let countryCode: String
    public let rating: String
    
    public init(
        countryCode: String,
        rating: String
    ) {
        self.countryCode = countryCode
        self.rating = rating
    }
}


extension ContentRating {

    private enum CodingKeys: String, CodingKey {
        case countryCode = "iso31661"
        case rating
    }

}
