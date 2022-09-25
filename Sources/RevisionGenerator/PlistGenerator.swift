import Foundation

struct PlistGenerator {
    init(outputPath: URL) {
        self.outputPath = outputPath
    }
    
    private let fileManager: FileManager = .default
    private let outputPath: URL
    private let encoder = PropertyListEncoder()
    
    func generate(_ revision: Revision) throws {
        let data = try encoder.encode(revision)
        if fileManager.fileExists(atPath: outputPath.path) {
            try fileManager.removeItem(atPath: outputPath.path)
        }
        fileManager.createFile(atPath: outputPath.path, contents: data)
    }
}
