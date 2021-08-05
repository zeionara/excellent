extension Array where Element == UserEntry {
    var users: Array<User> {
        self.group { entry in
            entry.name
        }.values.map{ entries in
            try! User(entries)
        }
    }
}
