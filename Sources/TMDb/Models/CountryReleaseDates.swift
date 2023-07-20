import Foundation

public struct CountryReleaseDates: Identifiable, Codable, Equatable, Hashable {
    
    /// Country's identifier (same as `countryCode`).
    public var id: String { countryCode }

    // Country Code in iso_3166_1 format
    public let countryCode: String
    
    // An array of ReleaseDates for this country code.
    public let releaseDates: [ReleaseDate]
    
    public init(countryCode: String, releaseDates: [ReleaseDate]) {
        self.countryCode = countryCode
        self.releaseDates = releaseDates
    }
}

extension CountryReleaseDates {

    private enum CodingKeys: String, CodingKey {
        case countryCode = "iso31661"
        case releaseDates = "release_dates"
    }

}
