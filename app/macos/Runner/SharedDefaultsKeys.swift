import Foundation
import Defaults

let sharedDefaults = UserDefaults(suiteName: "com.localsend.shared_group")!

extension Defaults.Keys {
    static let sharedURL = Key<URL?>("sharedURL", suite: sharedDefaults)
}
