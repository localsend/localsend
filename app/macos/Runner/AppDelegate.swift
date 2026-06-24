import Cocoa
import FlutterMacOS
import Defaults
import DockProgress
import LaunchAtLogin
import bitsdojo_window_macos

enum DockIcon: CaseIterable {
    case regular
    case error
    case success
}

@main
class AppDelegate: FlutterAppDelegate {
    private var statusItem: NSStatusItem?
    private var channel: FlutterMethodChannel?
    private var pendingFilesObservation: Defaults.Observation?
    private var pendingStringsObservation: Defaults.Observation?
    private var isLaunchedAsLoginItem: Bool?
    private var statusBarI18n: [String: String]?
    private var statusBarRecreateAttempted = false
    private static let statusItemAutosaveName = "org.localsend.localsend_app.status-item"
    
    override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        // LocalSend handles the close event manually
        return false
    }
    
    override func applicationDidFinishLaunching(_ notification: Notification) {
        let controller = mainFlutterWindow?.contentViewController as! FlutterViewController
        channel = FlutterMethodChannel(name: "main-delegate-channel", binaryMessenger: controller.engine.binaryMessenger)
        channel?.setMethodCallHandler(handleFlutterCall)
        
        NSApplication.shared.servicesProvider = self
        
        let localsendBrandColor = NSColor(red: 0, green: 0.392, blue: 0.353, alpha: 0.8) // #00645a
        DockProgress.style = .squircle(color: localsendBrandColor)
        
        isLaunchedAsLoginItem = LaunchAtLogin.wasLaunchedAtLogin
        
        restoreDestinationFolderAccess()
    }
    
    override func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        showLocalSendFromMenuBar()
        return false
    }

    override func applicationDidBecomeActive(_ notification: Notification) {
        ensureStatusBarVisible()
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
    
    private func removeStatusBarItem() {
        if let item = statusItem {
            NSStatusBar.system.removeStatusItem(item)
            statusItem = nil
        }
    }

    private func configureStatusBarButton(_ button: NSStatusBarButton, i18n: [String: String]) {
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

        button.subviews.forEach { $0.removeFromSuperview() }

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

    private func setupStatusBarItem(i18n: [String: String], forceNewIdentity: Bool = false) {
        statusBarI18n = i18n
        removeStatusBarItem()

        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if forceNewIdentity {
            item.autosaveName = NSStatusItem.AutoSaveName("\(Self.statusItemAutosaveName).\(UUID().uuidString)")
        } else {
            item.autosaveName = NSStatusItem.AutoSaveName(Self.statusItemAutosaveName)
        }
        item.isVisible = true
        statusItem = item

        if let button = item.button {
            configureStatusBarButton(button, i18n: i18n)
        }

        scheduleStatusBarVisibilityCheck()
    }

    private func scheduleStatusBarVisibilityCheck() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.ensureStatusBarVisible()
        }
    }

    private func isStatusBarItemActuallyVisible() -> Bool {
        guard let item = statusItem, item.isVisible else { return false }
        guard let button = item.button else { return false }

        // On macOS Tahoe, Control Center may keep isVisible=true while placing the item off-screen.
        if let window = button.window {
            if window.screen == nil {
                return false
            }
            if window.frame.origin.y < 0 {
                return false
            }
        }

        return true
    }

    private func ensureStatusBarVisible() {
        guard let i18n = statusBarI18n else { return }

        if statusItem == nil {
            setupStatusBarItem(i18n: i18n)
            return
        }

        if isStatusBarItemActuallyVisible() {
            return
        }

        // macOS Control Center can hide removed menu bar items until they are recreated.
        // Try once with a fresh autosave identity before giving up.
        if !statusBarRecreateAttempted {
            statusBarRecreateAttempted = true
            setupStatusBarItem(i18n: i18n, forceNewIdentity: true)
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
            statusBarRecreateAttempted = false
            setupStatusBarItem(i18n: i18n)
            result(nil)
        case "ensureStatusBarVisible":
            ensureStatusBarVisible()
            result(isStatusBarItemActuallyVisible())
        case "removeDestinationFolderAccess":
            removeExistingDestinationAccess()
            result(nil)
        case "persistDestinationFolderAccess":
            let folderPath = call.arguments as! String
            do {
                try saveDestinationFolderAccess(folderPath)
                result(nil)
            } catch {
                result(FlutterError(code: "REQUEST_FOLDER_ACCESS_FAILED", message: "An error occurred while requesting folder access", details: nil))
            }
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
        case "isReduceMotionEnabled":
            result(NSWorkspace.shared.accessibilityDisplayShouldReduceMotion)
        case "openFirewallSettings":
            openFirewallSettings()
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func saveDestinationFolderAccess(_ folderPath: String) throws {
        let folderURL = URL(fileURLWithPath: folderPath)
        let bookmarkData = try folderURL.bookmarkData(
            options: [.withSecurityScope],
            includingResourceValuesForKeys: nil,
            relativeTo: nil
        )
        Defaults[.destinationFolderBookmark] = bookmarkData
    }
    
    private func removeExistingDestinationAccess() {
        guard let existingBookmarkData = Defaults[.destinationFolderBookmark] else { return }
        if let url = SecurityScopedResourceManager.shared.startAccessing(bookmark: existingBookmarkData) {
            SecurityScopedResourceManager.shared.stopAccessing(url: url)
            Defaults[.destinationFolderBookmark] = nil
        }
    }
    
    private func restoreDestinationFolderAccess() {
        guard let bookmarkData = Defaults[.destinationFolderBookmark] else { return }
        do {
            var isStale = false
            let url = try URL(resolvingBookmarkData: bookmarkData, options: .withSecurityScope, bookmarkDataIsStale: &isStale)
            if !isStale {
                let _ = url.startAccessingSecurityScopedResource()
            }
        } catch {
            print("Failed to restore folder access: \(error)")
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

    override func application(_ application: NSApplication, open urls: [URL]) {
        for url in urls {
            if url.isFileURL {
                if let fileBookmark = createBookmarkForFile(at: url) {
                    Defaults[.pendingFiles].append(fileBookmark)
                }
            } else {
                Defaults[.pendingStrings].append(url.absoluteString)
            }
        }
    }
    // END: handle opened files

    /// Also handles text dropped on the Dock icon
    @objc func handleSendTextService(_ pasteboard: NSPasteboard, userData: String, error: NSErrorPointer) {
        guard let string = pasteboard.string(forType: .string) else { return }
        Defaults[.pendingStrings].append(string)
    }
}
