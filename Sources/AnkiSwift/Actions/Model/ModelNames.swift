#if os(macOS)
enum ModelNames: AnkiAction {
    static let name = "modelNames"
    static let version = 6
    
    struct Params: Encodable {}
    
    typealias Result = [String]
}

extension Anki {
    public func modelNames() async throws -> [String] {
        return try await perform(ModelNames.self, params: .init())
    }
}
#endif
