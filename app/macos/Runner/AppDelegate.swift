import Cocoa
import FlutterMacOS
import Defaults
import DockProgress
import LaunchAtLogin
import WidgetKit

enum DockIcon: CaseIterable {
    case regular
    case error
    case success
}

@main
class AppDelegate: FlutterAppDelegate {
    private let controlNotification = "org.localsend.localsendApp.receivingControlRequest" as CFString
    private let controlKind = "org.localsend.localsendApp.receivingControl"
    private var channel: FlutterMethodChannel?
    private var flutterReady = false
    private var lastHandledControlRequestId: String?
    private var controlHeartbeatTimer: Timer?
    private var pendingFilesObservation: Defaults.Observation?
    private var pendingStringsObservation: Defaults.Observation?
    private var isLaunchedAsLoginItem: Bool?
    private lazy var incomingTransferPanel = IncomingTransferPanel { [weak self] sessionId, action in
        self?.channel?.invokeMethod("incomingTransferPanelAction", arguments: ["sessionId": sessionId, "action": action])
    }
    
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

        sharedDefaults.set(false, forKey: "receivingActive")
        updateControlHeartbeat()
        controlHeartbeatTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [weak self] _ in
            self?.updateControlHeartbeat()
        }
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), Unmanaged.passUnretained(self).toOpaque(), { _, observer, _, _, _ in
            guard let observer = observer else { return }
            let app = Unmanaged<AppDelegate>.fromOpaque(observer).takeUnretainedValue()
            DispatchQueue.main.async { app.handleControlRequest() }
        }, controlNotification, nil, .deliverImmediately)
        
        restoreDestinationFolderAccess()
    }

    override func applicationWillTerminate(_ notification: Notification) {
        controlHeartbeatTimer?.invalidate()
        CFNotificationCenterRemoveObserver(CFNotificationCenterGetDarwinNotifyCenter(), Unmanaged.passUnretained(self).toOpaque(), CFNotificationName(controlNotification), nil)
        sharedDefaults.set(false, forKey: "receivingActive")
        sharedDefaults.set(0, forKey: "controlHeartbeat")
        reloadReceivingControl()
        super.applicationWillTerminate(notification)
    }
    
    override func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        showLocalSend()
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
    
    @objc func showLocalSend() {
        channel?.invokeMethod("showLocalSend", arguments: nil)
    }

    private func updateControlHeartbeat() {
        sharedDefaults.set(Date().timeIntervalSince1970, forKey: "controlHeartbeat")
    }

    private func reloadReceivingControl() {
        if #available(macOS 26.0, *) {
            ControlCenter.shared.reloadControls(ofKind: controlKind)
        }
    }

    private func handleControlRequest() {
        guard flutterReady,
              let requestId = sharedDefaults.string(forKey: "controlRequestId"),
              sharedDefaults.double(forKey: "controlRequestTime") > Date().timeIntervalSince1970 - 30,
              requestId != lastHandledControlRequestId else { return }
        lastHandledControlRequestId = requestId
        let enabled = sharedDefaults.bool(forKey: "receivingRequested")
        channel?.invokeMethod("setReceivingFromControlCenter", arguments: enabled) { [weak self] result in
            if let active = result as? Bool {
                sharedDefaults.set(active, forKey: "receivingActive")
            }
            self?.reloadReceivingControl()
        }
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
        
        self.showLocalSend()
    }
    
    // START: handle opened files
    @MainActor private func handleFlutterCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "methodChannelInitialized":
            /// Any call to the channel is dropped until methodChannelInitialized is called from Flutter
            flutterReady = true
            setupPendingItemsObservation()
            handleControlRequest()
            result(nil)
        case "setReceivingControlState":
            let state = call.arguments as? [String: Bool] ?? [:]
            sharedDefaults.set(state["receiving"] == true, forKey: "receivingActive")
            sharedDefaults.set(state["busy"] == true, forKey: "receivingBusy")
            updateControlHeartbeat()
            reloadReceivingControl()
            result(nil)
        case "showIncomingTransferPanel":
            guard let args = call.arguments as? [String: Any],
                  let sessionId = args["sessionId"] as? String, !sessionId.isEmpty,
                  let sender = args["sender"] as? String,
                  let detail = args["detail"] as? String,
                  let accept = args["accept"] as? String,
                  let decline = args["decline"] as? String else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Expected transfer details", details: nil))
                return
            }
            result(incomingTransferPanel.show(
                sessionId: sessionId,
                sender: sender,
                detail: detail,
                fileCount: args["fileCount"] as? Int ?? 1,
                previewName: args["previewName"] as? String ?? "",
                previewType: args["previewType"] as? String ?? "other",
                previewData: (args["previewBytes"] as? FlutterStandardTypedData)?.data,
                accept: accept,
                decline: decline
            ))
        case "hideIncomingTransferPanel":
            incomingTransferPanel.dismiss(sessionId: call.arguments as? String)
            result(nil)
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
