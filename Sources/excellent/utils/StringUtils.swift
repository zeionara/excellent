import Foundation

func makeApplicationDateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yy"
    return formatter
}

let applicationDateFormatter = makeApplicationDateFormatter()

extension String {
    public var asIntMark: Int {
        if self == "" {
            return 0
        } else {
            return Int(self) ?? 0
        }
    }

    public var asDisplayedMark: String {
        return self == "" ? "-" : self
    }

    public var asApplicationDate: Date? {
        return applicationDateFormatter.date(from: self)
    }
}

