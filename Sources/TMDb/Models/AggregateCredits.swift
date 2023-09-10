import Foundation


public struct AggregateCredits: Identifiable, Decodable, Equatable, Hashable {
    public let id: Int?
    public let cast: [AggregateCast]
    public let crew: [AggregateCrew]
    
    public init(id: Int, cast: [AggregateCast], crew: [AggregateCrew]) {
        self.id = id
        self.cast = cast
        self.crew = crew
    }
}
