import XCTest
@testable import bundle_generator

private let repositoryRoot = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()
private let defaultGitPath: URL = .init(fileURLWithPath: "/usr/bin/git")

final class FetcherTests: XCTestCase {
    func testFetcher() throws {
        let fetcher = Fetcher(
            repositoryPath: repositoryRoot,
            gitExecutablePath: defaultGitPath
        )
        
        let revision = try fetcher.parse()
        XCTAssertNotNil(revision.lastCommit.subject)
    }
}
