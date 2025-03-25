#if os(macOS)
enum GetActiveProfile: AnkiAction {
    static let name = "getActiveProfile"
    static let version = 6
    
    struct Params: Encodable {}
    
    typealias Result = String
}

extension Anki {
    public func getActiveProfile() async throws -> String {
        return try await perform(GetActiveProfile.self, params: .init())
    }
}
#endif
