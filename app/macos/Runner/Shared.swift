import Foundation
import Defaults

let sharedDefaults = UserDefaults(suiteName: "com.localsend.shared_group")!

typealias BookmarkData = Data
extension Defaults.Keys {
    static let pendingFiles = Key<[BookmarkData]>("pendingFiles", default: [], suite: sharedDefaults)
}

/**
 Creates a  minimal bookmark for a given file URL.
 
 That allows the main app to access the file as a "User Selected File" later. Otherwise, the file will be successfully selected but an attempt to send it (that is, actually read it) will fail.

 - Important: We intentionally avoid creating a security-scoped bookmark (`.withSecurityScope` option) here, as security-scoped bookmarks cannot be transferred between apps or app extensions. 
 - See:
 - - [Open Radar: Security scoped bookmarks don't work with app groups](https://openradar.appspot.com/43055392)
 - - [Reply from Apple DTS in Apple Developer Forums: Share security scoped bookmark in app group? (Alternative Answer)](https://developer.apple.com/forums/thread/66259?answerId=336402022#336402022)
 - - [Detailed instructions in Apple Developer Forums: Share security scoped bookmark in app group? (Alternative Answer)](https://developer.apple.com/forums/thread/66259?answerId=278355022#278355022)

  - Note: The main app and the sharing plugin must have
  The same level of "User Selected File" permission (Read Only or Read/Write)
 
 - Tag: create-bookmark-func
 */
func createBookmarkForFile(at url: URL) -> BookmarkData? {
    do {
        let securityScopedBookmark = try (url as NSURL).bookmarkData(
            options: .minimalBookmark,
            includingResourceValuesForKeys: nil,
            relativeTo: nil
        )
        return securityScopedBookmark
    } catch {
        print("Failed to create security-scoped bookmark for \(url): \(error)")
        return nil
    }
}
