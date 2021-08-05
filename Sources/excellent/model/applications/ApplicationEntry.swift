import Foundation

let DATE_INDEX = 1
private let NAME_INDEX = 2
let STATUS_INDEX = 3
let COMMENT_INDEX = 4

public enum ApplicationStatus: String {
    case accepted = "Документы приняты"
    case inProgress = "На модерации"
    case denied = "Отклонено"
}

public struct ApplicationEntry: CustomStringConvertible {
    public var date: Date
    public var name: String
    public var status: ApplicationStatus?
    public var comment: String

    public init(_ match: NSTextCheckingResult, html: String) {
        self.date = html.substring(with: match.range(at: DATE_INDEX)).asApplicationDate!
        self.name = html.substring(with: match.range(at: NAME_INDEX))
        self.status = ApplicationStatus(rawValue: html.substring(with: match.range(at: STATUS_INDEX)))
        self.comment = html.substring(with: match.range(at: COMMENT_INDEX))
    }

    public var description: String {
        // print("foo")
        // let formatter = DateFormatter()
        // applicationDateFormatter.dateFormat = "dd.MM.yy"
        // let foo = "02.02.02".asApplicationDate
        // print("bar")
        return "\(name) \(date.asString ?? "-") \(status?.rawValue ?? "-")"
    }
}
