import Cocoa
import LaunchAtLogin

extension LaunchAtLogin {
    /**
     Whether the app was launched at login (i.e. as login items).
     - Important: This property must only be checked in `NSApplicationDelegate#applicationDidFinishLaunching` method, otherwise the `NSAppleEventManager.shared().currentAppleEvent` will be `nil`.
     - Source: https://stackoverflow.com/a/19890943
     - Note: When we drop macOS 12 support and move to LaunchAtLogin-Modern package, this extension should be removed as it's already included - https://github.com/sindresorhus/LaunchAtLogin-Modern/blob/a04ec1c363be3627734f6dad757d82f5d4fa8fcc/Sources/LaunchAtLogin/LaunchAtLogin.swift#L34-L44
     */
    public static var wasLaunchedAtLogin: Bool {
        guard let event = NSAppleEventManager.shared().currentAppleEvent else { return false }
        return (event.eventID == kAEOpenApplication)
        && (event.paramDescriptor(forKeyword: keyAEPropData)?.enumCodeValue == keyAELaunchedAsLogInItem)
    }
}

func openFirewallSettings() {
    if #available(macOS 13, *) {
        let url = URL(string: "x-apple.systempreferences:com.apple.Network-Settings.extension?Firewall")!
        NSWorkspace.shared.open(url)
    } else {
        let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Firewall")!
        NSWorkspace.shared.open(url)
    }
}
