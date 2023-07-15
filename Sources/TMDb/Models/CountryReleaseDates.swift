import Foundation

public struct CountryReleaseDates: Codable, Equatable, Hashable {
    // Country Code in iso_3166_1 format
    public let iso31661: String
    
    public let releaseDates: [ReleaseDate]
    
    public init(iso31661: String, releaseDates: [ReleaseDate]) {
        self.iso31661 = iso31661
        self.releaseDates = releaseDates
    }

}

extension CountryReleaseDates {

    private enum CodingKeys: String, CodingKey {
        case iso31661 = "iso_3166_1"
        case releaseDates = "release_dates"
    }

}
