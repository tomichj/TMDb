import Foundation

extension URL {

    func appendingPathComponent(_ value: Int) -> Self {
        appendingPathComponent(String(value))
    }

    func appendingQueryItem(name: String, value: CustomStringConvertible) -> Self {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)!
        var queryItems = urlComponents.queryItems ?? []
        queryItems.append(URLQueryItem(name: name, value: value.description))
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }

}

extension URL {
    
    private enum QueryItemName {
        static let apiKey = "api_key"
        static let language = "language"
        static let imageLanguage = "include_image_language"
        static let videoLanguage = "include_video_language"
        static let page = "page"
        static let year = "year"
        static let firstAirDateYear = "first_air_date_year"
        static let withPeople = "with_people"
        static let withGenres = "with_genres"
        static let withKeywords = "with_keywords"
        static let withRegionCode = "region"
        static let withOriginCountry = "with_origin_country"
        static let withAirDateGTE = "air_date.gte"
        static let includeAdult = "include_adult"
        static let appendToResponse = "append_to_response"
    }
    
    func appendingAPIKey(_ apiKey: String) -> Self {
        appendingQueryItem(name: QueryItemName.apiKey, value: apiKey)
    }
    
    func appendingLanguage(_ languageCode: String?) -> Self {
        guard let languageCode else {
            return self
        }
        
        return appendingQueryItem(name: QueryItemName.language, value: languageCode)
    }
    
    func appendingImageLanguage(_ languageCode: String?) -> Self {
        guard let languageCode else {
            return self
        }
        
        let value = [languageCode, "null"]
            .map(\.description)
            .joined(separator: ",")
        
        return appendingQueryItem(name: QueryItemName.imageLanguage, value: value)
    }
    
    func appendingVideoLanguage(_ languageCode: String?) -> Self {
        guard let languageCode else {
            return self
        }
        
        let value = [languageCode, "null"]
            .map(\.description)
            .joined(separator: ",")
        
        return appendingQueryItem(name: QueryItemName.videoLanguage, value: value)
    }
    
    func appendingPage(_ page: Int?) -> Self {
        guard var page = page else {
            return self
        }
        
        page = max(page, 1)
        page = min(page, 1000)
        
        return appendingQueryItem(name: QueryItemName.page, value: page)
    }
    
    func appendingYear(_ year: Int?) -> Self {
        guard let year else {
            return self
        }
        
        return appendingQueryItem(name: QueryItemName.year, value: year)
    }
    
    func appendingFirstAirDateYear(_ year: Int?) -> Self {
        guard let year else {
            return self
        }
        
        return appendingQueryItem(name: QueryItemName.firstAirDateYear, value: year)
    }
    
    func appendingWithPeople(_ peopleIDs: [Person.ID]?) -> Self {
        guard let peopleIDs else {
            return self
        }
        
        let value = peopleIDs
            .map(\.description)
            .joined(separator: ",")
        
        return appendingQueryItem(name: QueryItemName.withPeople, value: value)
    }
    
    func appendingWithGenres(_ genreIDs: [Genre.ID]?) -> Self {
        guard let genreIDs else {
            return self
        }
        
        let value = genreIDs
            .map{ String($0) }
            .joined(separator: ",")
        
        return appendingQueryItem(name: QueryItemName.withGenres, value: value)
    }
    
    func appendingWithKeywords(_ keywordIDs: [Keyword.ID]?) -> Self {
        guard let keywordIDs else {
            return self
        }
        
        let value = keywordIDs
            .map{ String($0) }
            .joined(separator: ",")
        
        return appendingQueryItem(name: QueryItemName.withKeywords, value: value)
    }
    
    func appendingRegionCode(_ regionCode: String?) -> Self {
        guard let regionCode else {
            return self
        }
        
        return appendingQueryItem(name: QueryItemName.withRegionCode, value: regionCode)
    }
    
    func appendingWithOriginCountry(_ withOriginCountry: String?) -> Self {
        guard let withOriginCountry else {
            return self
        }
        
        return appendingQueryItem(name: QueryItemName.withOriginCountry, value: withOriginCountry)
    }
    
    func appendingAirDateGTE(_ airDateGTE: Date?) -> Self {
        guard let airDateGTE else {
            return self
        }
        
        // turn Date into String yyyy-MM-dd
        let airDateGTEString = DateFormatter.theMovieDatabase.string(from: airDateGTE)
        
        return appendingQueryItem(name: QueryItemName.withAirDateGTE, value: airDateGTEString)
    }
    
    func appendingIncludeAdult(_ includeAdult: Bool?) -> Self {
        guard let includeAdult else {
            return self
        }
        
        return appendingQueryItem(name: QueryItemName.includeAdult, value: includeAdult)
    }
    
    func appendingToResponse(_ appendToResponse: String) -> Self {
        return appendingQueryItem(name: QueryItemName.appendToResponse, value: appendToResponse)
    }
}
