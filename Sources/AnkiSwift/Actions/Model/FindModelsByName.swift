#if os(macOS)
public struct Model: Decodable {
    public let id: Int64
    public let name: String
    public let type: Int
    public let mod: Int
    public let usn: Int
    public let sortf: Int
    public let did: Int?
    public let tmpls: [Template]
    public let flds: [Field]
    public let css: String
    public let latexPre: String
    public let latexPost: String
    public let latexsvg: Bool
    public let req: [Model.RequiredField]
    public let originalStockKind: Int?
    
    public struct Template: Decodable {
        public let name: String
        public let ord: Int
        public let qfmt: String
        public let afmt: String
        public let bqfmt: String
        public let bafmt: String
        public let did: Int?
        public let bfont: String
        public let bsize: Int
        public let id: Int64?
    }
    
    public struct Field: Decodable {
        public let name: String
        public let ord: Int
        public let sticky: Bool
        public let rtl: Bool
        public let font: String
        public let size: Int
        public let description: String
        public let plainText: Bool
        public let collapsed: Bool
        public let excludeFromSearch: Bool
        public let id: Int64?
        public let tag: String?
        public let preventDeletion: Bool
    }
    
    public struct RequiredField: Decodable {
        public let index: Int
        public let requirement: String
        public let fieldIndexes: [Int]
        
        public init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            index = try container.decode(Int.self)
            requirement = try container.decode(String.self)
            fieldIndexes = try container.decode([Int].self)
        }
    }
}

enum FindModelsByName: AnkiAction {
    static let name = "findModelsByName"
    static let version = 6
    
    struct Params: Encodable {
        let modelNames: [String]
    }
    
    typealias Result = [Model]
}

extension Anki {
    public func findModelsByName(_ names: [String]) async throws -> [Model] {
        return try await perform(FindModelsByName.self, params: .init(modelNames: names))
    }
}
#endif
