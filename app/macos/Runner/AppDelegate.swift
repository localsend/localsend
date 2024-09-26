import Cocoa
import FlutterMacOS
import Defaults
import DockProgress
import LaunchAtLogin

enum DockIcon: CaseIterable {
    case regular
    case error
    case success
}

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

@main
class AppDelegate: FlutterAppDelegate {
    private var statusItem: NSStatusItem?
    private var channel: FlutterMethodChannel?
    private var pendingFilesObservation: Defaults.Observation?
    private var pendingStringsObservation: Defaults.Observation?
    private var isLaunchedAsLoginItem: Bool?
    
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        // LocalSend handles the close event manually
        return false
    }
    
    override func applicationDidFinishLaunching(_ notification: Notification) {
        let controller = mainFlutterWindow?.contentViewController as! FlutterViewController
        channel = FlutterMethodChannel(name: "main-delegate-channel", binaryMessenger: controller.engine.binaryMessenger)
        channel?.setMethodCallHandler(handleFlutterCall)
        
        self.setupDockIconTextDropEventListener()
        
        let localsendBrandColor = NSColor(red: 0, green: 0.392, blue: 0.353, alpha: 0.8) // #00645a
        DockProgress.style = .squircle(color: localsendBrandColor)
        
        isLaunchedAsLoginItem = LaunchAtLogin.wasLaunchedAtLogin
    }
    
    override func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        showLocalSendFromMenuBar()
        return false
    }
    
    private func setupPendingItemsObservation() {
        self.pendingFilesObservation = Defaults.observe(.pendingFiles) { change in
            guard !Defaults[.pendingFiles].isEmpty else { return }
            self.sendPendingItemsToFlutter()
        }
        
        self.pendingStringsObservation = Defaults.observe(.pendingStrings) { change in
            guard !Defaults[.pendingStrings].isEmpty else { return }
            self.sendPendingItemsToFlutter()
        }
    }
    
    private func setDockIcon(icon: DockIcon) {
        switch icon {
        case .regular:
            NSApplication.shared.applicationIconImage = NSImage(named: NSImage.applicationIconName)
        case .error:
            NSApplication.shared.applicationIconImage = NSImage(named: "AppIconWithErrorMark")!
        case .success:
            NSApplication.shared.applicationIconImage = NSImage(named: "AppIconWithSuccessMark")!
        }
    }
    
    private func setupDockIconTextDropEventListener() {
        let appleEventManager = NSAppleEventManager.shared()
        
        appleEventManager.setEventHandler(
            self,
            andSelector: #selector(handleOpenContentsEvent(_:withReplyEvent:)),
            forEventClass: AEEventClass(kCoreEventClass),
            andEventID: AEEventID(kAEOpenContents)
        )
    }
    
    private func setupStatusBarItem(i18n: [String: String]) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusItem?.button {
            let image = NSImage(named: "StatusBarItemIcon")
            image!.size = NSSize(width: 18, height: 18)
            image!.isTemplate = true
            button.image = image
            
            let menu = NSMenu()
            
            let openString = i18n["open"]!
            let openItem = NSMenuItem(title: openString, action: #selector(showLocalSendFromMenuBar), keyEquivalent: "o")
            menu.addItem(openItem)
            
            let quitString = i18n["quit"]!
            let quitItem = NSMenuItem(title: quitString, action: #selector(quitApp), keyEquivalent: "q")
            menu.addItem(quitItem)
            
            statusItem?.menu = menu
            
            let dragView = ContentDropView(frame: button.bounds)
            button.addSubview(dragView)
            
            dragView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                dragView.topAnchor.constraint(equalTo: button.topAnchor),
                dragView.leadingAnchor.constraint(equalTo: button.leadingAnchor),
                dragView.trailingAnchor.constraint(equalTo: button.trailingAnchor),
                dragView.bottomAnchor.constraint(equalTo: button.bottomAnchor)
            ])
        }
    }
    
    @objc func showLocalSendFromMenuBar() {
        channel?.invokeMethod("showLocalSendFromMenuBar", arguments: nil)
    }
    
    @objc private func quitApp() {
        NSApp.terminate(nil)
    }
    
    func sendPendingItemsToFlutter() {
        let pendingFileBookmarks = Defaults[.pendingFiles]
        let pendingStrings = Defaults[.pendingStrings]
        var filePaths: [String] = []
        
        for bookmark in pendingFileBookmarks {
            if let url = SecurityScopedResourceManager.shared.startAccessing(bookmark: bookmark) {
                filePaths.append(url.path)
            }
        }
        
        if !filePaths.isEmpty {
            channel?.invokeMethod("onPendingFiles", arguments: filePaths)
        }
        if !pendingStrings.isEmpty {
            channel?.invokeMethod("onPendingStrings", arguments: pendingStrings)
        }
        
        Defaults[.pendingFiles] = []
        Defaults[.pendingStrings] = []
        
        self.showLocalSendFromMenuBar()
    }
    
    // START: handle opened files
    @MainActor private func handleFlutterCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "methodChannelInitialized":
            /// Any call to the channel is dropped until methodChannelInitialized is called from Flutter
            setupPendingItemsObservation()
            result(nil)
        case "setupStatusBar":
            let i18n = call.arguments as! [String: String]
            setupStatusBarItem(i18n: i18n)
            result(nil)
        case "updateDockProgress":
            let progress = call.arguments as! Double
            DockProgress.progress = progress
            result(nil)
        case "setDockIcon":
            let newIconIndex = call.arguments as! Int
            let newIcon = DockIcon.allCases[newIconIndex]
            setDockIcon(icon: newIcon)
        case "getLaunchAtLogin":
            result(LaunchAtLogin.isEnabled)
        case "setLaunchAtLogin":
            if let launchAtLogin = call.arguments as? Bool {
                LaunchAtLogin.isEnabled = launchAtLogin
                result(nil)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Expected a boolean value", details: nil))
            }
        case "getLaunchAtLoginMinimized":
            result(UserDefaults.standard.bool(forKey: "launchAtLoginMinimized"))
        case "setLaunchAtLoginMinimized":
            if let launchAtLoginMinimized = call.arguments as? Bool {
                UserDefaults.standard.set(launchAtLoginMinimized, forKey: "launchAtLoginMinimized")
                result(nil)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Expected a boolean value", details: nil))
            }
        case "isLaunchedAsLoginItem":
            result(isLaunchedAsLoginItem)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    override func application(_ sender: NSApplication, openFile filename: String) -> Bool {
        /**
         Although file URLs shared via the dock icon or the "open with" file menu item already contain access permission, we pass this through the bookmark mechanism for uniformity and readability of the code with URLs shared from the share extension.
         - SeeAlso: [Enabling App Sandbox#Enabling User-Selected File Access](https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/EntitlementKeyReference/Chapters/EnablingAppSandbox.html#//apple_ref/doc/uid/TP40011195-CH4-SW6)
         - SeeAlso: [``Shared/createBookmarkForFile(at:)``](x-source-tag://create-bookmark-func)
         */
        if let fileBookmark = createBookmarkForFile(at: URL(fileURLWithPath: filename)) {
            Defaults[.pendingFiles].append(fileBookmark)
        }
        return true
    }
    
    override func application(_ sender: NSApplication, openFiles filenames: [String]) {
        for filename in filenames {
            if let fileBookmark = createBookmarkForFile(at: URL(fileURLWithPath: filename)) {
                Defaults[.pendingFiles].append(fileBookmark)
            }
        }
    }
    // END: handle opened files
    
    /// Handle **text** dropped onto the Dock icon
    @objc func handleOpenContentsEvent(_ event: NSAppleEventDescriptor, withReplyEvent replyEvent: NSAppleEventDescriptor) {
        if let string = event.paramDescriptor(forKeyword: AEKeyword(keyDirectObject))?.stringValue {
            Defaults[.pendingStrings].append(string)
        }
    }
}
