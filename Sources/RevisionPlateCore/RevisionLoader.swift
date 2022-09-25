import Foundation

public struct RevisionLoader {
    public init(bundle: Bundle = .main) {
        self.bundle = bundle
    }
    
    private let bundle: Bundle
    private let decoder: PropertyListDecoder = .init()
    
    public func load() -> Revision? {
        guard let url = bundle.url(forResource: "revision-plate", withExtension: "plist"), let data = try? Data(contentsOf: url) else {
            return nil
        }
        return try? decoder.decode(Revision.self, from: data)
    }
}
