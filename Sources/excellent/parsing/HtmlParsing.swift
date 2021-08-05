import Foundation

extension String {
    func matchUserEntries(_ html: String) throws -> Array<UserEntry> {
        let regex = try NSRegularExpression(pattern: self)

        // for match in regex.matches(in: html, options: [], range: NSRange(location: 0, length: html.length)) {
        //     let user = UserEntry(match, html: html)
        //     print(user)
        //     // print(html.substring(with: match.range(at: FOREIGN_MARK_INDEX)))
        // }

        return regex.matches(in: html, options: [], range: NSRange(location: 0, length: html.length)).map{ match in
            UserEntry(match, html: html)
        }
    }
}
