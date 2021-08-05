import ArgumentParser

struct Excellent: ParsableCommand {
    static var configuration = CommandConfiguration(
            abstract: "Exam results analyzer",
            subcommands: [TraceMarks.self],
            defaultSubcommand: TraceMarks.self
    )
}

Excellent.main()
