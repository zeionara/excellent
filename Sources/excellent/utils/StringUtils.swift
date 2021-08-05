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
}