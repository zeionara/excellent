import FoundationNetworking
import Foundation

func getHtml(_ address: String) throws -> String {
    let url = URL(string: address)!
    // let (data, _) = try await session.data(from: url)
    // let decoder = JSONDecoder()
    // let ok = try decoder.decode([Item].self, from: data)
    // print(url)

    let table = try String(contentsOf: url, encoding: .utf8)

    // print(table)



    //
    //
    //


    // URLSession.shared.downloadTask(with: url) { (localUrl, urlResponse, error) in
    //     print(localUrl)
    // }

    // let (data, response) = try await URLSession.shared.data(from: URL(string: address))
    // let response: HTTPURLResponse = try await URLSession.shared.dataTask(
    //     with: URL(string: address)
    // )
    return table // "response"
}
