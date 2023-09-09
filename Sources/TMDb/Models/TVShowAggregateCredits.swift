import Foundation


public struct TVShowAggregateCredits: Identifiable, Decodable, Equatable, Hashable {
    public let id: Int?
    public let cast: [TVShowAggregateCast]
    public let crew: [TVShowAggregateCrew]
    
    public init(id: Int, cast: [TVShowAggregateCast], crew: [TVShowAggregateCrew]) {
        self.id = id
        self.cast = cast
        self.crew = crew
    }
}

