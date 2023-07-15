import Foundation

/// Release dates for a movie
public struct ReleaseDates: Identifiable, Decodable, Equatable, Hashable {
    
    /// Movie  identifier.
    public let id: Int
    /// Cast members of the show.
    public let results: [CountryReleaseDates]

    /// Creates a new `ReleaseDates`.
    ///
    /// - Parameters:
    ///    - id: Movie identifier.
    ///    - releaseDates: Release dates, organized by Country, for the movie
    public init(id: Int, results: [CountryReleaseDates]) {
        self.id = id
        self.results = results
    }

}
