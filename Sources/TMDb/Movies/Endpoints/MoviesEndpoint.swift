import Foundation

enum MoviesEndpoint {
    case details(movieID: Movie.ID)
    case credits(movieID: Movie.ID)
    case reviews(movieID: Movie.ID, page: Int? = nil)
    case images(movieID: Movie.ID, languageCode: String?)
    case videos(movieID: Movie.ID, languageCode: String?)
    case recommendations(movieID: Movie.ID, page: Int? = nil)
    case similar(movieID: Movie.ID, page: Int? = nil)
    case nowPlaying(page: Int? = nil)
    case popular(page: Int? = nil)
    case topRated(page: Int? = nil)
    case upcoming(regionCode: String? = nil, page: Int? = nil)
    case releaseDates(movieID: Movie.ID)
    case externalIDs(movieID: Movie.ID)
    case watch(movieID: Movie.ID)
    case fullDetails(movieID: Movie.ID, languageCode: String?)
}

extension MoviesEndpoint: Endpoint {

    private static let basePath = URL(string: "/movie")!

    var path: URL {
        switch self {
        case .details(let movieID):
            return Self.basePath
                .appendingPathComponent(movieID)

        case .credits(let movieID):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("credits")

        case .reviews(let movieID, let page):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("reviews")
                .appendingPage(page)

        case .images(let movieID, let languageCode):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("images")
                .appendingImageLanguage(languageCode)

        case .videos(let movieID, let languageCode):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("videos")
                .appendingVideoLanguage(languageCode)

        case .recommendations(let movieID, let page):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("recommendations")
                .appendingPage(page)

        case .similar(let movieID, let page):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("similar")
                .appendingPage(page)

        case .nowPlaying(let page):
            return Self.basePath
                .appendingPathComponent("now_playing")
                .appendingPage(page)

        case .popular(let page):
            return Self.basePath
                .appendingPathComponent("popular")
                .appendingPage(page)

        case .topRated(let page):
            return Self.basePath
                .appendingPathComponent("top_rated")
                .appendingPage(page)

        case .upcoming(let regionCode, let page):
            return Self.basePath
                .appendingPathComponent("upcoming")
                .appendingRegionCode(regionCode)
                .appendingPage(page)
        
        case .releaseDates(let movieID):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("release_dates")
            
        case .externalIDs(let movieID):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("external_ids")

        case .watch(let movieID):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("watch/providers")
            
        case .fullDetails(let movieID, let languageCode):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingToResponse("release_dates,credits,external_ids,similar,keywords,watch/providers")
                .appendingLanguage(languageCode)
        }
    }

}
