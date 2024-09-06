import Foundation
import Defaults

let sharedDefaults = UserDefaults(suiteName: "com.localsend.shared_group")!

extension Defaults.Keys {
    static let pendingFiles = Key<[URL]>("pendingFiles", default: [], suite: sharedDefaults)
}
