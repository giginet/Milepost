import Foundation

let defaultGitExecutable: URL = .init(fileURLWithPath: "/usr/bin/git")
let fetcher = Fetcher(gitExecutablePath: defaultGitExecutable)

do {
    let revision = try fetcher.parse()
} catch {
    exit(1)
}
