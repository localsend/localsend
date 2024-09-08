import Cocoa
import FlutterMacOS
import Defaults

@main
class AppDelegate: FlutterAppDelegate {
    private var statusItem: NSStatusItem?
    private var channel: FlutterMethodChannel?
    private var pendingFilesObservation: Defaults.Observation?
    private var pendingStringsObservation: Defaults.Observation?
    
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        // LocalSend handles the close event manually
        return false
    }
    
    override func applicationDidFinishLaunching(_ notification: Notification) {
        let controller = mainFlutterWindow?.contentViewController as! FlutterViewController
        channel = FlutterMethodChannel(name: "main-delegate-channel", binaryMessenger: controller.engine.binaryMessenger)
        channel?.setMethodCallHandler(handle)
        
        self.setupPendingItemsObservation()
        
        self.setupDockIconTextDropEventListener()
    }
    
    private func setupPendingItemsObservation() {
        self.pendingFilesObservation = Defaults.observe(.pendingFiles) { change in
            let pendingFileBookmarks = Defaults[.pendingFiles]
            guard !pendingFileBookmarks.isEmpty else { return }
            self.sendPendingItemsToFlutter()
        }
        
        self.pendingStringsObservation = Defaults.observe(.pendingStrings) { change in
            let pendingStrings = Defaults[.pendingStrings]
            guard !pendingStrings.isEmpty else { return }
            self.sendPendingItemsToFlutter()
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
            let openItem = NSMenuItem(title: openString, action: #selector(openApp), keyEquivalent: "o")
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
    
    @objc func openApp() {
        NSApp.activate(ignoringOtherApps: true)
        mainFlutterWindow?.makeKeyAndOrderFront(nil)
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
        
        if !filePaths.isEmpty{
            channel?.invokeMethod("onPendingFiles", arguments: filePaths)
        }
        if !pendingStrings.isEmpty     {
            channel?.invokeMethod("onPendingStrings", arguments: pendingStrings)
        }
        
        Defaults[.pendingFiles] = []
        Defaults[.pendingStrings] = []
        openApp()
    }
    
    // START: handle opened files
    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPendingFiles":
            let pendingFileBookmarks = Defaults[.pendingFiles]
            var filePaths: [String] = []
            
            for bookmark in pendingFileBookmarks {
                if let url = SecurityScopedResourceManager.shared.startAccessing(bookmark: bookmark) {
                    filePaths.append(url.path)
                }
            }
            
            result(filePaths)
            Defaults[.pendingFiles] = []
            openApp()
        case "getPendingStrings":
            let pendingStrings = Defaults[.pendingStrings]
            result(pendingStrings)
            Defaults[.pendingStrings] = []
            openApp()
        case "setupStatusBar":
            let i18n = call.arguments as! [String: String]
            setupStatusBarItem(i18n: i18n)
            result(nil)
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
    
    /// Handle **text** droped onto the Dock icon
    @objc func handleOpenContentsEvent(_ event: NSAppleEventDescriptor, withReplyEvent replyEvent: NSAppleEventDescriptor) {
        if let string = event.paramDescriptor(forKeyword: AEKeyword(keyDirectObject))?.stringValue {
            Defaults[.pendingStrings].append(string)
        }
    }
}
