import Foundation
import ArgumentParser

@main
struct GeneratorCommand: ParsableCommand {
    @Argument
    var targetRootPath: String
    
    @Option(name: [.customLong("git-executable-path")])
    var gitExecutablePath: String = "/usr/bin/git"
    
    @Option(
        name: [.short, .customLong("output-path")]
    )
    var outputPath: String
    
    
    func run() throws {
        let repositoryPath: URL = .init(fileURLWithPath: targetRootPath)
        let gitExecutable: URL = .init(fileURLWithPath: gitExecutablePath)
        do {
            let fetcher = Fetcher(repositoryPath: repositoryPath, gitExecutablePath: gitExecutable)
            let revision = try fetcher.parse()
            
            let outputPath = URL(fileURLWithPath: outputPath)
            let generator = PlistGenerator(outputPath: outputPath)
            try generator.generate(revision)
        } catch {
            Self.exit(withError: error)
        }
    }
}
