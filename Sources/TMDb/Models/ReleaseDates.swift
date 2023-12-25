import Foundation

//public struct ReleaseDates: Identifiable, Codable, Equatable, Hashable {
public struct ReleaseDates: Codable, Equatable, Hashable {
    
//    public let id: Int
    public let results: [CountryReleaseDates]

//    public init(id: Int, results: [CountryReleaseDates]) {
    public init(results: [CountryReleaseDates]) {
//        self.id = id
        self.results = results
    }

}
