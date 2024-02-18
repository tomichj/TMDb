import Foundation

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
public final class CreditService {
    
    private let apiClient: APIClient
    private let localeProvider: () -> Locale
    
    public convenience init() {
        self.init(
            apiClient: TMDbFactory.apiClient,
            localeProvider: TMDbFactory.localeProvider
        )
    }
    
    init(apiClient: APIClient, localeProvider: @escaping () -> Locale) {
        self.apiClient = apiClient
        self.localeProvider = localeProvider
    }
        
    public func details(forCredit id: Credit.ID) async throws -> Credit {
        let credit: Credit
        do {
            credit = try await apiClient.get(endpoint: CreditsEndpoint.details(creditsID: id))
        } catch let error {
            throw TMDbError(error: error)
        }

        return credit
    }

}
