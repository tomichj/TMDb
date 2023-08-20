import Foundation

///
/// A model representing combined movie and tv show credits for a person.
///
/// A person can be both a cast member and crew member of the same show.
///
public struct PersonCombinedCredits: Identifiable, Decodable, Equatable, Hashable {

    ///
    /// Person identifier.
    ///
    public let id: Int

    ///
    /// Shows where the person is in the cast.
    ///
    public let cast: [ShowCredit]

    ///
    /// Shows where the person is in the crew.
    ///
    public let crew: [ShowCredit]

    ///
    /// All shows the person is in.
    ///
    public var allShows: [ShowCredit] {
        (cast + crew).uniqued()
    }

    /// Creates a person combined credits object.
    ///
    /// - Parameters:
    ///    - id: Person identifier.
    ///    - cast: Shows where person is in the cast.
    ///    - crew: Shows where person is in the case.
    ///
    public init(id: Int, cast: [ShowCredit], crew: [ShowCredit]) {
        self.id = id
        self.cast = cast
        self.crew = crew
    }

}
