import Foundation

let PRIORITY_INDEX = 2
let RANK_INDEX = 1
let NAME_INDEX = 3

let SPECIALIZATION_MARK_INDEX = 4
let FOREIGN_MARK_INDEX = 5
let INDIVIDUAL_MARK_INDEX = 6

public struct UserEntry: CustomStringConvertible {
    public var priority: String
    public var rank: String
    public var name: String
    public var foreignMark: String
    public var specializationMark: String
    public var individualMark: String

    public init(_ match: NSTextCheckingResult, html: String) {
        // let foreignMark = html.substring(with: match.range(at: FOREIGN_MARK_INDEX))
        // print(foreignMark)
        // print(foreignMark.asIntMark)
        self.priority = html.substring(with: match.range(at: PRIORITY_INDEX))
        self.rank = html.substring(with: match.range(at: RANK_INDEX))
        self.name = html.substring(with: match.range(at: NAME_INDEX))
        self.foreignMark = html.substring(with: match.range(at: FOREIGN_MARK_INDEX))
        self.specializationMark = html.substring(with: match.range(at: SPECIALIZATION_MARK_INDEX))
        self.individualMark = html.substring(with: match.range(at: INDIVIDUAL_MARK_INDEX))
    }

    public var description: String {
        return "\(name) Priority: \(priority.asDisplayedMark); Rank: \(rank.asDisplayedMark); Specialization mark: \(specializationMark.asDisplayedMark); " +
                "Foreign language mark: \(foreignMark.asDisplayedMark); Individual mark: \(individualMark.asDisplayedMark)"
    }
}