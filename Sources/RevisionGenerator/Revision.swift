import Foundation

struct Revision: Encodable {
    struct Commit: Encodable {
        struct User: Encodable {
            var name: String
            var email: String
        }
        var author: User
        var commit: User
        var subject: String?
        var authorDate: Date
        var commiteDate: Date
        var shortHash: String
        var hash: String
    }
    var lastCommit: Commit
    var branch: String?
}
