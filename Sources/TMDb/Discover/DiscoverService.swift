import Foundation

///
/// Provides an interface for discovering movies and TV series from TMDb.
///
@available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
public final class DiscoverService {

    private let apiClient: APIClient

    ///
    /// Creates a discover service object.
    ///
    public convenience init() {
        self.init(
            apiClient: TMDbFactory.apiClient
        )
    }

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    ///
    /// Returns movies to be discovered.
    ///
    /// [TMDb API - Discover: Movie](https://developer.themoviedb.org/reference/discover-movie)
    ///
    /// - Precondition: `page` can be between `1` and `1000`.
    ///
    /// - Parameters:
    ///    - sortedBy: How results should be sorted.
    ///    - people: A list of Person identifiers which to return only movies they have appeared in.
    ///    - regionCode: 
    ///    - page: The page of results to return.
    ///
    /// - Throws: TMDb error ``TMDbError``.
    ///
    /// - Returns: Matching movies as a pageable list.
    ///
    public func movies(language: String? = nil,
                       primaryReleaseDateGTE: Date? = nil,
                       primaryReleaseDateLTE: Date? = nil,
                       releaseDateGTE: Date? = nil,
                       releaseDateLTE: Date? = nil,
                       sortedBy: MovieSort? = nil,
                       withPeople people: [Person.ID]? = nil,
                       withGenres genres: [Genre.ID]? = nil,
                       withKeywords keywords: [Keyword.ID]? = nil,
                       regionCode: String? = nil,
                       page: Int? = nil) async throws -> MoviePageableList {
        let movieList: MoviePageableList
        do {
            movieList = try await apiClient.get(
                endpoint: DiscoverEndpoint.movies(language: language, primaryReleaseDateGTE: primaryReleaseDateGTE, primaryReleaseDateLTE: primaryReleaseDateLTE, releaseDateGTE: releaseDateGTE, releaseDateLTE: releaseDateLTE, sortedBy: sortedBy, people: people, genres: genres, keywords: keywords, regionCode: regionCode, page: page)
            )
        } catch let error {
            throw TMDbError(error: error)
        }

        return movieList
    }

    ///
    /// Returns TV series to be discovered.
    ///
    /// [TMDb API - Discover: TV Series](https://developer.themoviedb.org/reference/discover-tv)
    ///
    /// - Precondition: `page` can be between `1` and `1000`.
    ///
    /// - Parameters:
    ///    - sortedBy: How results should be sorted.
    ///    - page: The page of results to return.
    ///
    /// - Throws: TMDb error ``TMDbError``.
    ///
    /// - Returns: Matching TV series as a pageable list.
    ///
    public func tvSeries(sortedBy: TVSeriesSort? = nil, 
                         withGenres genres: [Genre.ID]? = nil,
                         withKeywords keywords: [Keyword.ID]? = nil,
                         withOriginCountry: String? = nil,
                         airDateGTE: Date? = nil,
                         page: Int? = nil) async throws -> TVSeriesPageableList {
        let tvSeriesList: TVSeriesPageableList
        do {
            tvSeriesList = try await apiClient.get(endpoint: DiscoverEndpoint.tvSeries(sortedBy: sortedBy, genres: genres, keywords: keywords, withOriginCountry: withOriginCountry, withAirDateGTE: airDateGTE, page: page))
        } catch let error {
            throw TMDbError(error: error)
        }

        return tvSeriesList
    }

}
