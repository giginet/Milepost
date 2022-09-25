import Foundation

public struct RevisionLoader {
    private static let decoder: PropertyListDecoder = .init()
    
    public static func load(bundle: Bundle = .main) -> Revision? {
        guard let url = bundle.url(forResource: "revision-plate", withExtension: "plist"), let data = try? Data(contentsOf: url) else {
            return nil
        }
        return try? decoder.decode(Revision.self, from: data)
    }
}
