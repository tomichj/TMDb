import Foundation

enum CreditsEndpoint {
    case details(creditsID: String)
}

extension CreditsEndpoint: Endpoint {
    private static let basePath = URL(string: "/credit")!

    var path: URL {
        switch self {
        case .details(let creditsID):
            return Self.basePath
                .appendingPathComponent(creditsID)
        }
    }
}
