import Foundation

public struct Revision: Encodable {
    public init(lastCommit: Revision.Commit, branch: String? = nil) {
        self.lastCommit = lastCommit
        self.branch = branch
    }
    
    public struct Commit: Encodable {
        public init(author: Revision.Commit.User,
                    commit: Revision.Commit.User,
                    subject: String? = nil,
                    authorDate: Date,
                    commiteDate: Date,
                    shortHash: String,
                    hash: String) {
            self.author = author
            self.commit = commit
            self.subject = subject
            self.authorDate = authorDate
            self.commiteDate = commiteDate
            self.shortHash = shortHash
            self.hash = hash
        }
        
        public struct User: Encodable {
            public init(name: String, email: String) {
                self.name = name
                self.email = email
            }
            
            public var name: String
            public var email: String
        }
        public var author: User
        public var commit: User
        public var subject: String?
        public var authorDate: Date
        public var commiteDate: Date
        public var shortHash: String
        public var hash: String
    }
    public var lastCommit: Commit
    public var branch: String?
}
