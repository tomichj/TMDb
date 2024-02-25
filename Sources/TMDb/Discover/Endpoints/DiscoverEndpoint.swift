import Foundation

enum DiscoverEndpoint {

    case movies(language: String? = nil,
                primaryReleaseDateGTE: Date? = nil,
                primaryReleaseDateLTE: Date? = nil,
                releaseDateGTE: Date? = nil,
                releaseDateLTE: Date? = nil,
                sortedBy: MovieSort? = nil,
                people: [Person.ID]? = nil,
                genres: [Genre.ID]? = nil,
                keywords: [Keyword.ID]? = nil,
                regionCode: String? = nil,
                page: Int? = nil)
    
    case tvSeries(language: String? = nil,
                  sortedBy: TVSeriesSort? = nil,
                  genres: [Genre.ID]? = nil,
                  keywords: [Keyword.ID]? = nil,
                  withOriginCountry: String? = nil,
                  withAirDateGTE: Date? = nil,
                  withAirDateLTE: Date? = nil,
                  page: Int? = nil)

}

extension DiscoverEndpoint: Endpoint {

    private static let basePath = URL(string: "/discover")!

    var path: URL {
        switch self {
        case .movies(let language, let primaryReleaseDateGTE, let primaryReleaseDateLTE, let releaseDateGTE, let releaseDateLTE, let sortedBy, let people, let genres, let keywords, let regionCode, let page):
            return Self.basePath
                .appendingPathComponent("movie")
                .appendingLanguage(language)
                .appendingPrimaryReleaseDateGTE(primaryReleaseDateGTE)
                .appendingPrimaryReleaseDateLTE(primaryReleaseDateLTE)
                .appendingReleaseDateGTE(releaseDateGTE)
                .appendingReleaseDateLTE(releaseDateLTE)
                .appendingSortBy(sortedBy)
                .appendingWithPeople(people)
                .appendingWithGenres(genres)
                .appendingWithKeywords(keywords)
                .appendingRegionCode(regionCode)
                .appendingPage(page)

        case .tvSeries(let language, let sortedBy, let genres, let keywords, let originCountry, let airDateGTE, let airDateLTE, let page):
            return Self.basePath
                .appendingPathComponent("tv")
                .appendingLanguage(language)
                .appendingSortBy(sortedBy)
                .appendingWithGenres(genres)
                .appendingWithKeywords(keywords)
                .appendingWithOriginCountry(originCountry)
                .appendingAirDateGTE(airDateGTE)
                .appendingAirDateLTE(airDateLTE)
                .appendingPage(page)
        }
    }

}
