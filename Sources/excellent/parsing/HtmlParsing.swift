import Foundation

extension String {
    func match<Output>(_ html: String, parse: (NSTextCheckingResult, String) -> Output) throws -> Array<Output> {
        let regex = try NSRegularExpression(pattern: self)

        return regex.matches(in: html, options: [], range: NSRange(location: 0, length: html.length)).map{ match in
            parse(match, html)
        }
    }

    func matchUserEntries(_ html: String) throws -> Array<UserEntry> {
        return try match(html) { match, html in
            UserEntry(match, html: html)
        }

        // let regex = try NSRegularExpression(pattern: self)

        // // for match in regex.matches(in: html, options: [], range: NSRange(location: 0, length: html.length)) {
        // //     let user = UserEntry(match, html: html)
        // //     print(user)
        // //     // print(html.substring(with: match.range(at: FOREIGN_MARK_INDEX)))
        // // }

        // return regex.matches(in: html, options: [], range: NSRange(location: 0, length: html.length)).map{ match in
        //     UserEntry(match, html: html)
        // }
    }

    func matchApplicationEntries(_ html: String) throws -> Array<ApplicationEntry> {
        return try match(html) { match, html in
            ApplicationEntry(match, html: html)
        }
    }
}
