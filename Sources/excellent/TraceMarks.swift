import ArgumentParser
import Foundation


struct TraceMarks: ParsableCommand {

    // @Option(name: .shortAndLong, help: "User surname")
    @Argument(help: "User surname")
    private var surname: String = "ok"

    func run() throws {
        print("Fetching data for user \(self.surname)...")
        let html = try getHtml("https://abit.itmo.ru/postgraduate/rating/all/")
        let pattern = #"<tr><td class="[a-z ]+">([0-9]*)</td><td class="[a-z ]+">([0-9]+)</td><td class="[a-z ]+">([a-zA-Zа-яА-ЯёЁ]*"# + self.surname + "[a-zA-Zа-яА-ЯёЁ]*" +
                    #"\s+[a-zA-Zа-яА-ЯёЁ.]*)</td><td class="[a-z ]+">([0-9]*)</td><td class="[a-z ]+">([0-9]*)</td><td class="[a-z ]+">([0-9]*)</td>"#
        // if let range = table.range(of: pattern, options: .regularExpression) {
        //     let text = table[range]
        //     print(text)
        // } else {
        //     print("no match")
        // }
        
        let regex = try! NSRegularExpression(pattern: pattern)

        // if let match = regex.firstMatch(in: table, options: [], range: NSRange(location: 0, length: table.length)) {
        //     print(match)
        // } else {
        //     print("No match")
        // }

        for match in regex.matches(in: html, options: [], range: NSRange(location: 0, length: html.length)) {
            let user = User(match, html: html)
            print(user)
            // print(html.substring(with: match.range(at: FOREIGN_MARK_INDEX)))
        }
    }
}
