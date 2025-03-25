#if os(macOS)
enum ModelFieldNames: AnkiAction {
    static let name = "modelFieldNames"
    static let version = 6
    
    struct Params: Encodable {
        let modelName: String
    }
    
    typealias Result = [String]
}

extension Anki {
    public func modelFieldNames(for modelName: String) async throws -> [String] {
        return try await perform(ModelFieldNames.self, params: .init(modelName: modelName))
    }
}
#endif
