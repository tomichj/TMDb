import Foundation

enum TrendingEndpoint {

    case movies(timeWindow: TrendingTimeWindowFilterType = .day, languageCode: String? = nil, regionCode: String? = nil, page: Int? = nil)
    case tvSeries(timeWindow: TrendingTimeWindowFilterType = .day, languageCode: String? = nil, regionCode: String? = nil, page: Int? = nil)
    case people(timeWindow: TrendingTimeWindowFilterType = .day, languageCode: String? = nil, regionCode: String? = nil, page: Int? = nil)

}

extension TrendingEndpoint: Endpoint {

    private static let basePath = URL(string: "/trending")!

    var path: URL {
        switch self {
        case .movies(let timeWindow, let languageCode, let regionCode, let page):
            return Self.basePath
                .appendingPathComponent("movie")
                .appendingPathComponent(timeWindow)
                .appendingLanguage(languageCode)
                .appendingRegionCode(regionCode)
                .appendingPage(page)

        case .tvSeries(let timeWindow, let languageCode, let regionCode, let page):
            return Self.basePath
                .appendingPathComponent("tv")
                .appendingPathComponent(timeWindow)
                .appendingLanguage(languageCode)
                .appendingRegionCode(regionCode)
                .appendingPage(page)

        case .people(let timeWindow, let languageCode, let regionCode, let page):
            return Self.basePath
                .appendingPathComponent("person")
                .appendingPathComponent(timeWindow)
                .appendingLanguage(languageCode)
                .appendingRegionCode(regionCode)
                .appendingPage(page)
        }
    }

}
