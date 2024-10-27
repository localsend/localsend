import Foundation

class SecurityScopedResourceManager {
    static let shared = SecurityScopedResourceManager()
    private var openResources: [URL: Data] = [:]
    
    private init() {}
    
    func startAccessing(bookmark: Data) -> URL? {
        do {
            var isStale = false
            let url = try URL(resolvingBookmarkData: bookmark, options: .withoutUI, relativeTo: nil, bookmarkDataIsStale: &isStale)
            
            if url.startAccessingSecurityScopedResource() {
                openResources[url] = bookmark
                return url
            } else {
                print("Failed to start accessing security-scoped resource: \(url)")
                return nil
            }
        } catch {
            print("Failed to resolve security-scoped bookmark: \(error)")
            return nil
        }
    }
    
    func stopAccessing(url: URL) {
        // TODO: stop accessing when file is not needed anymore! See: https://developer.apple.com/documentation/foundation/url/1779698-startaccessingsecurityscopedreso#:~:text=resource%20in%20question.-,Warning,-If%20you%20fail
        if openResources.keys.contains(url) {
            url.stopAccessingSecurityScopedResource()
            openResources.removeValue(forKey: url)
        }
    }
}
