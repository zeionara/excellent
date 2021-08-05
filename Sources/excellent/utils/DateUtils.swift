import Foundation

func makeDateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.YYYY"
    return formatter
}

let dateFormatter = makeDateFormatter()

extension Date {
    public var asString: String? {
        dateFormatter.string(from: self)
    }
}
