import FoundationNetworking
import Foundation

func getHtml(_ address: String) throws -> String {
    let url = URL(string: address)!
    return try String(contentsOf: url, encoding: .utf8)
}
