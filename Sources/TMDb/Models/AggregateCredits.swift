import Foundation


public struct AggregateCredits: Codable, Equatable, Hashable {
    public let cast: [AggregateCast]
    public let crew: [AggregateCrew]
    
    public init(cast: [AggregateCast], crew: [AggregateCrew]) {
        self.cast = cast
        self.crew = crew
    }
}
