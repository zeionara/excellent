public struct User: CustomStringConvertible {
    public let entries: Array<UserEntry>
    public let name: String

    public init(_ entries: Array<UserEntry>) throws {
        self.entries = entries
        self.name = try ensureEquivalent(entries) { entry in
            entry.name
        }
    }

    public var description: String {
        return "\(name) (\(entries.count) entries)"
    }
}
