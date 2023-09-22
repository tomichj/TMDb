import Foundation

public struct ReleaseDates: Identifiable, Decodable, Equatable, Hashable {
    
    public let id: Int
    public let results: [CountryReleaseDates]

    public init(id: Int, results: [CountryReleaseDates]) {
        self.id = id
        self.results = results
    }

}
