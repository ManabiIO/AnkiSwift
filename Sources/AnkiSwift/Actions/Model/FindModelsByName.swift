#if os(macOS)
public struct Model: Decodable {
    let id: Int64
    let name: String
    let type: Int
    let mod: Int
    let usn: Int
    let sortf: Int
    let did: Int?
    let tmpls: [Template]
    let flds: [Field]
    let css: String
    let latexPre: String
    let latexPost: String
    let latexsvg: Bool
    let req: [[Model.RequiredField]]
    let originalStockKind: Int
    
    struct Template: Decodable {
        let name: String
        let ord: Int
        let qfmt: String
        let afmt: String
        let bqfmt: String
        let bafmt: String
        let did: Int?
        let bfont: String
        let bsize: Int
        let id: Int64
    }
    
    struct Field: Decodable {
        let name: String
        let ord: Int
        let sticky: Bool
        let rtl: Bool
        let font: String
        let size: Int
        let description: String
        let plainText: Bool
        let collapsed: Bool
        let excludeFromSearch: Bool
        let id: Int64
        let tag: String?
        let preventDeletion: Bool
    }
    
    struct RequiredField: Decodable {
        let index: Int
        let requirement: String
        let fieldIndexes: [Int]
        
        init(from decoder: Decoder) throws {
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
