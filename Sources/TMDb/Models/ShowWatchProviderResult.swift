//
//  ShowWatchProviderResult.swift
//
//
//  Created by Mikko Kuivanen on 5.9.2023.
//

import Foundation


struct ShowWatchProviderResult: Codable, Equatable, Hashable {
    let id: Int
    let results: [String: ShowWatchProvider]
}


public struct ShowWatchProviders: Codable, Equatable, Hashable {
    public let results: [String: ShowWatchProvider]
}


public struct ShowWatchProvider: Codable, Equatable, Hashable {
    public let link: String
    public let free: [WatchProvider]?
    public let flatrate: [WatchProvider]?
    public let buy: [WatchProvider]?
    public let rent: [WatchProvider]?
}
