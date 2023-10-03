import Foundation

enum DiscoverEndpoint {

    case movies(sortedBy: MovieSort? = nil, people: [Person.ID]? = nil, genres: [Genre.ID]? = nil, page: Int? = nil)
    case tvSeries(sortedBy: TVSeriesSort? = nil, genres: [Genre.ID]? = nil, page: Int? = nil)

}

extension DiscoverEndpoint: Endpoint {

    private static let basePath = URL(string: "/discover")!

    var path: URL {
        switch self {
        case .movies(let sortedBy, let people, let genres, let page):
            return Self.basePath
                .appendingPathComponent("movie")
                .appendingSortBy(sortedBy)
                .appendingWithPeople(people)
                .appendingWithGenres(genres)
                .appendingPage(page)

        case .tvSeries(let sortedBy, let genres, let page):
            return Self.basePath
                .appendingPathComponent("tv")
                .appendingSortBy(sortedBy)
                .appendingWithGenres(genres)
                .appendingPage(page)
        }
    }

}
