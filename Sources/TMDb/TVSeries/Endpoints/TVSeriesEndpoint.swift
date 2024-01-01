import Foundation

enum TVSeriesEndpoint {

    case details(tvSeriesID: TVSeries.ID)
    case credits(tvSeriesID: TVSeries.ID)
    case reviews(tvSeriesID: TVSeries.ID, page: Int? = nil)
    case images(tvSeriesID: TVSeries.ID, languageCode: String?)
    case videos(tvSeriesID: TVSeries.ID, languageCode: String?)
    case recommendations(tvSeriesID: TVSeries.ID, page: Int? = nil)
    case similar(tvSeriesID: TVSeries.ID, page: Int? = nil)
    case popular(page: Int? = nil)
    case aggregateCredits(tvSeriesID: TVSeries.ID)
    case contentRatings(tvSeriesID: TVSeries.ID)
    case externalIDs(tvSeriesID: TVSeries.ID)
    case watch(tvSeriesID: TVSeries.ID)
    case fullDetails(tvSeriesID: TVSeries.ID)

}

extension TVSeriesEndpoint: Endpoint {

    private static let basePath = URL(string: "/tv")!

    var path: URL {
        switch self {
        case .details(let tvSeriesID):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)

        case .credits(let tvSeriesID):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("credits")

        case .reviews(let tvSeriesID, let page):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("reviews")
                .appendingPage(page)

        case .images(let tvSeriesID, let languageCode):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("images")
                .appendingImageLanguage(languageCode)

        case .videos(let tvSeriesID, let languageCode):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("videos")
                .appendingVideoLanguage(languageCode)

        case .recommendations(let tvSeriesID, let page):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("recommendations")
                .appendingPage(page)

        case .similar(let tvSeriesID, let page):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("similar")
                .appendingPage(page)

        case .popular(let page):
            return Self.basePath
                .appendingPathComponent("popular")
                .appendingPage(page)

        case .aggregateCredits(let tvShowID):
            return Self.basePath
                .appendingPathComponent(tvShowID)
                .appendingPathComponent("aggregate_credits")

        case .contentRatings(let tvShowID):
            return Self.basePath
                .appendingPathComponent(tvShowID)
                .appendingPathComponent("content_ratings")
            
        case .externalIDs(let tvSeriesID):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("external_ids")

        case .watch(let tvSeriesID):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("watch/providers")
            
        case .fullDetails(let tvSeriesID):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingToResponse("aggregate_credits,content_ratings,external_ids")

        }
    }

}
