import Foundation

public struct Credit: Identifiable, Codable, Equatable, Hashable {
    public let id: String
    public let creditType: String
    public let job: String
    public let media: CreditMedia
    public let mediaType: String // tv, anything else...?
    public let person: Person
}
