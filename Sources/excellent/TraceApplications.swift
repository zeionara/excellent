import ArgumentParser
import Foundation


struct TraceApplications: ParsableCommand {

    func run() throws {
        print("Fetching applications...")
        let html = try getHtml("https://abit.itmo.ru/doc_post_postgraduate/")
        // print(html)

        let pattern = #"<tr>\s*<td>([0-9.]+)</td>\s*<td>([a-zA-Zа-яА-ЯёЁ\s]+)</td>\s*<td>(Документы приняты|Отклонено|На модерации)</td>\s*<td>([^<]+)</td>\s*</tr>"#

        // let entries = try pattern.matchApplicationEntries(html).sorted{ lhs, rhs in
        //     rhs.date > lhs.date
        // }

        let entries = try pattern.matchApplicationEntries(html).filter{$0.status == .denied}

        var groupedEntriesByDate = entries.group { entry in
            entry.date
        }

        let maxDate = "05.08.21".asApplicationDate! // groupedEntriesByDate.keys.max()!
        let minDate = "03.04.21".asApplicationDate! // groupedEntriesByDate.keys.min()!
        var currentDate = minDate

        while currentDate < maxDate {
            currentDate = currentDate.addingTimeInterval(86400)
            guard let entries = groupedEntriesByDate[currentDate] else {
                groupedEntriesByDate[currentDate] = [ApplicationEntry]()
                continue
            }
        }

        let sortedGroups = Array(
            groupedEntriesByDate
        ).sorted { lhs, rhs in
            rhs.key > lhs.key
        }

        for (date, group) in sortedGroups {
            print("\(date.asString!)\t\(group.count)")
        }

        // let pattern = #"<tr><td class="[a-z ]+">([0-9]*)</td><td class="[a-z ]+">([0-9]+)</td><td class="[a-z ]+">([a-zA-Zа-яА-ЯёЁ]*"# + self.surname + "[a-zA-Zа-яА-ЯёЁ]*" +
        //             #"\s+[a-zA-Zа-яА-ЯёЁ.]*)</td><td class="[a-z ]+">([0-9]*)</td><td class="[a-z ]+">([0-9]*)</td><td class="[a-z ]+">([0-9]*)</td>"#
        
        // for userEntry in try pattern.matchUserEntries(html) {
        //     print(userEntry)
        // }

        // for user in try pattern.matchUserEntries(html).users {
        //     print(user)
        // }
    }
}
