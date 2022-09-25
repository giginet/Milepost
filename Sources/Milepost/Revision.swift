import Foundation

public struct Revision: Codable {
    public init(lastCommit: Revision.Commit, branch: String? = nil) {
        self.lastCommit = lastCommit
        self.branch = branch
    }
    
    public struct Commit: Codable {
        public init(author: Revision.Commit.User,
                    committer: Revision.Commit.User,
                    subject: String? = nil,
                    authorDate: Date,
                    commiteDate: Date,
                    shortHash: String,
                    hash: String) {
            self.author = author
            self.committer = committer
            self.subject = subject
            self.authorDate = authorDate
            self.commiteDate = commiteDate
            self.shortHash = shortHash
            self.hash = hash
        }
        
        public struct User: Codable {
            public init(name: String, email: String) {
                self.name = name
                self.email = email
            }
            
            public var name: String
            public var email: String
        }
        public var author: User
        public var committer: User
        public var subject: String?
        public var authorDate: Date
        public var commiteDate: Date
        public var shortHash: String
        public var hash: String
    }
    public var lastCommit: Commit
    public var branch: String?
}

extension Revision {
    public var hash: String {
        lastCommit.hash
    }
    
    public var shortHash: String {
        lastCommit.shortHash
    }
}

extension Revision.Commit.User: CustomStringConvertible {
    public var description: String {
        return "\(name) <\(email)>"
    }
}
