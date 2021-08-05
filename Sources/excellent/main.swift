import ArgumentParser

struct Excellent: ParsableCommand {
    static var configuration = CommandConfiguration(
            abstract: "Exam results analyzer",
            subcommands: [
                TraceMarks.self,
                TraceApplications.self    
            ],
            defaultSubcommand: TraceMarks.self
    )
}

Excellent.main()
