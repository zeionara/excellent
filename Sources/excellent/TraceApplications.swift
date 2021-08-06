import ArgumentParser
import Foundation
import ahsheet

public enum ApplicationTracingError: Error {
    case cannotTraceApplications(String)
}

public extension Address {
    var asStringWithSheet: String {
        "\(self.sheet == nil ? "" : ("'" + self.sheet! + "'!"))\(self.columnIndex.asColumnLabel)\(self.rowIndex.asRowNumber)" 
    }
}

struct TraceApplications: ParsableCommand {

    @Argument(help: "Submission campaign start date")
    private var start: String = "01.04.21"

    private func countApplicationsPerDay(minDate: Date, maxDate: Date, status: ApplicationStatus? = nil) throws -> [(date: String, count: Int)] {
        // throw ApplicationTracingError.cannotTraceApplications("Testing")

        print("Fetching applications...")
        let html = try getHtml("https://abit.itmo.ru/doc_post_postgraduate/")
        // print(html)

        let pattern = #"<tr>\s*<td>([0-9.]+)</td>\s*<td>([a-zA-Zа-яА-ЯёЁ\s]+)</td>\s*<td>(Документы приняты|Отклонено|На модерации)</td>\s*<td>([^<]+)</td>\s*</tr>"#

        // let entries = try pattern.matchApplicationEntries(html).sorted{ lhs, rhs in
        //     rhs.date > lhs.date
        // }

        var entries = try pattern.matchApplicationEntries(html)
        
        if let targetStatus = status {
            entries = entries.filter{$0.status == status}
        }

        var groupedEntriesByDate = entries.group { entry in
            entry.date
        }

        // let maxDate = "05.08.21".asApplicationDate! // groupedEntriesByDate.keys.max()!
        // let minDate = "03.04.21".asApplicationDate! // groupedEntriesByDate.keys.min()!
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

        // for (date, group) in sortedGroups {
        //     print("\(date.asString!)\t\(group.count)")
        // }

        return sortedGroups.map { date, group in
            (date: date.asString, count: group.count)
        } as! [(date: String, count: Int)]

        // let pattern = #"<tr><td class="[a-z ]+">([0-9]*)</td><td class="[a-z ]+">([0-9]+)</td><td class="[a-z ]+">([a-zA-Zа-яА-ЯёЁ]*"# + self.surname + "[a-zA-Zа-яА-ЯёЁ]*" +
        //             #"\s+[a-zA-Zа-яА-ЯёЁ.]*)</td><td class="[a-z ]+">([0-9]*)</td><td class="[a-z ]+">([0-9]*)</td><td class="[a-z ]+">([0-9]*)</td>"#
        
        // for userEntry in try pattern.matchUserEntries(html) {
        //     print(userEntry)
        // }

        // for user in try pattern.matchUserEntries(html).users {
        //     print(user)
        // }
    }  

    func run() throws {

        let maxDate = Date().addingTimeInterval(-86400)
        let minDate = start.asApplicationDate!.addingTimeInterval(-86400)

        var currentAddress = Address(row: 1, column: 0, sheet: Date().asString)
        try setSheetData(
            SheetData(
                range: currentAddress.asStringWithSheet,
                values: try countApplicationsPerDay(minDate: minDate, maxDate: maxDate).map{ (date, count) in
                    [date, String(count)]
                }
            )
        )
        print(currentAddress.asStringWithSheet)

        currentAddress = Address(row: currentAddress.rowIndex, column: currentAddress.columnIndex + 2, sheet: currentAddress.sheet)
        try setSheetData(
            SheetData(
                range: currentAddress.asStringWithSheet,
                values: try countApplicationsPerDay(minDate: minDate, maxDate: maxDate, status: .accepted).map{ (date, count) in
                    [date, String(count)]
                }
            )
        )
        print(currentAddress, currentAddress.sheet!)
        currentAddress = Address(row: currentAddress.rowIndex, column: currentAddress.columnIndex + 2, sheet: currentAddress.sheet)
                try setSheetData(
            SheetData(
                range: currentAddress.asStringWithSheet,
                values: try countApplicationsPerDay(minDate: minDate, maxDate: maxDate, status: .inProgress).map{ (date, count) in
                    [date, String(count)]
                }
            )
        )
        print(currentAddress, currentAddress.sheet!)
        currentAddress = Address(row: currentAddress.rowIndex, column: currentAddress.columnIndex + 2, sheet: currentAddress.sheet)        
        try setSheetData(
            SheetData(
                range: currentAddress.asStringWithSheet,
                values: try countApplicationsPerDay(minDate: minDate, maxDate: maxDate, status: .denied).map{ (date, count) in
                    [date, String(count)]
                }
            )
        )
        print(currentAddress, currentAddress.sheet!)

        // print(try countApplicationsPerDay(minDate: minDate, maxDate: maxDate))
    }
}
