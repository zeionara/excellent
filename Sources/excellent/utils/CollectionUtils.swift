enum CollectionProcessingError: Error {
    case emptyList(String)
    case valueIsNotUnique(String)
}

func ensureEquivalent<Input, Output>(_ items: Array<Input>, handle: (Input) -> Output) throws -> Output where Output: Equatable { // TODO: Make this method to be an extension of the Array class
    if items.count < 1 {
        throw CollectionProcessingError.emptyList("The list of items must contain at least 1 entry for the program to be able to check the values for uniqueness")
    }
    let firstValue = handle(items.first!)
    for item in items[1...] {
        let nextValue = handle(item)
        if nextValue != firstValue {
            throw CollectionProcessingError.valueIsNotUnique("The given collection includes items which do not contain the same values (\(nextValue) != \(firstValue))")
        }
    }
    return firstValue
}

public extension Array {
    func group<Key>(by getKey: (Element) -> Key) -> [Key: Array<Element>] where Key: Hashable {
        var groupedElements = [Key: Array<Element>]()
        
        for item in self {
            let key = getKey(item)
            if var group = groupedElements[key] {
                // print("found existing entry with key \(key)")
                group.append(item)
                groupedElements[key] = group
            } else {
                groupedElements[key] = [item]
            }
        }

        return groupedElements
    }
}