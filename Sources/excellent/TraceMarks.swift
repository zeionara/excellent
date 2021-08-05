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
        
        for userEntry in try pattern.matchUserEntries(html) {
            print(userEntry)
        }

        for user in try pattern.matchUserEntries(html).users {
            print(user)
        }
    }
}
