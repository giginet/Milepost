import Foundation

struct PlistGenerator {
    init(outputPath: URL) {
        self.outputPath = outputPath
    }
    
    private let fileManager: FileManager = .default
    private let outputPath: URL
    
    func generate(_ revision: Revision) throws {
        
    }
}
