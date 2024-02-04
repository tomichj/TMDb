import Foundation

enum DiscoverEndpoint {

    case movies(sortedBy: MovieSort? = nil, people: [Person.ID]? = nil, genres: [Genre.ID]? = nil, keywords: [Keyword.ID]? = nil, regionCode: String? = nil, page: Int? = nil)
    case tvSeries(sortedBy: TVSeriesSort? = nil, genres: [Genre.ID]? = nil, keywords: [Keyword.ID]? = nil, withOriginCountry: String? = nil, withAirDateGTE: Date? = nil, page: Int? = nil)

}

extension DiscoverEndpoint: Endpoint {

    private static let basePath = URL(string: "/discover")!

    var path: URL {
        switch self {
        case .movies(let sortedBy, let people, let genres, let keywords, let regionCode, let page):
            return Self.basePath
                .appendingPathComponent("movie")
                .appendingSortBy(sortedBy)
                .appendingWithPeople(people)
                .appendingWithGenres(genres)
                .appendingWithKeywords(keywords)
                .appendingRegionCode(regionCode)
                .appendingPage(page)

        case .tvSeries(let sortedBy, let genres, let keywords, let originCountry, let airDateGTE, let page):
            return Self.basePath
                .appendingPathComponent("tv")
                .appendingSortBy(sortedBy)
                .appendingWithGenres(genres)
                .appendingWithKeywords(keywords)
                .appendingWithOriginCountry(originCountry)
                .appendingAirDateGTE(airDateGTE)
                .appendingPage(page)
        }
    }

}
