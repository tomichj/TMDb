import Foundation

public struct VideoCollection: Identifiable, Decodable {

    public let id: Int
    public let results: [VideoMetadata]

    public init(id: Int, results: [VideoMetadata]) {
        self.id = id
        self.results = results
    }

}