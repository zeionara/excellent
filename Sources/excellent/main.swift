import ArgumentParser

// print("Parsing the cells containing exam marks...")

struct Excellent: ParsableCommand {
    static var configuration = CommandConfiguration(
            abstract: "Exam results analyzer",
            subcommands: [TraceMarks.self],
            defaultSubcommand: TraceMarks.self
    )
}

// // Excellented.main()

// struct StartServer: ParsableCommand {

//     // private enum CodingKeys: String, CodingKey {
//     //     case port, dbHost, dbPort, dbName, dbLogin, dbPassword, tokenLength, tokenCharset, tokenMaxLifespan
//     // }

//     @Option(name: .shortAndLong, help: "Port for the server to listen to")
//     private var port: Int = 20760

//     @Option(name: .shortAndLong, help: "Default logging level")
//     var loggingLevel: Logger.Level = .debug

//     @Option(help: "Token length")
//     internal var tokenLength: Int = 64

//     @Option(help: "Set of characters which may occur in the tokens")
//     var tokenCharset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

//     @Option(help: "Number of seconds for authentication tokens to be active")
//     private var tokenMaxLifespan: Double = 604800 // 1 week

//     func sendOptions(request: HTTPRequest, response: HTTPResponse) {
//         response.completed()
//     }

//     func isAuthenticated(request: HTTPRequest, response: HTTPResponse) {
//         response.completed()
//     }

//     mutating func run() throws {
//         let logger = Logger("root", loggingLevel)

//         logger.trace("Starting an http server...")
//         logger.trace("Connecting to the databased on \(env["AGK_DB_HOST"]!)...")

//         MongoDBConnection.host = env["AGK_DB_HOST"]!
//         MongoDBConnection.database = env["AGK_DB_NAME"]!
//         MongoDBConnection.port = Int(env["AGK_DB_PORT"]!)!

//         MongoDBConnection.authmode = .standard
//         MongoDBConnection.username = env["AGK_DB_LOGIN"]!
//         MongoDBConnection.password = env["AGK_DB_PASSWORD"]!

        
//         let result = try User().find()
//         print(result)

//         print(MongoDBConnection.host, MongoDBConnection.database, MongoDBConnection.port, MongoDBConnection.authmode, MongoDBConnection.username, MongoDBConnection.password)
        
//         var routes = Routes()
//         routes.add(method: .post, uri: SIGN_IN_ROUTE, handler: signIn)
//         routes.add(method: .post, uri: "/sign-out", handler: signOut)
//         routes.add(method: .post, uri: "/start-experiment", handler: startExperiment)
//         routes.add(method: .get, uri: "/is-authenticated", handler: isAuthenticated)
//         routes.add(method: .get, uri: "/get-experiment", handler: queryExperiment)
//         routes.add(method: .get, uri: "/get-experiments", handler: queryExperiments)
//         routes.add(method: .options, uri: "/*", handler: sendOptions)

        
//         try HTTPServer.launch(
//             name: "localhost",
//             port: port,
//             routes: routes,
//             requestFilters: [
//                 (
//                     AuthenticationFilter(tokenMaxLifespan),
//                     HTTPFilterPriority.high
//                 )
//             ],
//             responseFilters: [
//                 (
//                     PerfectHTTPServer.HTTPFilter.contentCompression(data: [:]),
//                     HTTPFilterPriority.high
//                 )
//             ]
//         )
//     }
// }

// struct ObservatoryBackend: ParsableCommand {
//     static var configuration = CommandConfiguration(
//             abstract: "Backend components for managing experiments on the machine learning models",
//             subcommands: [StartServer.self],
//             defaultSubcommand: StartServer.self
//     )
// }

// ObservatoryBackend.main()

// import ArgumentParser

// struct TraceMarks: ParsableCommand {

//     @Argument(help: "The phrase to repeat.")
//     private var phrase: String

//     mutating func run() throws {
//         print(phrase)
//     }
// }

// struct TraceMarks: ParsableCommand {

//     @Argument(help: "User surname")
//     private var phrase: String

//     mutating func run() throws {
//         print("Fetching data for user \(phrase)...")
//     }
// }

Excellent.main()