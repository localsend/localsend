import Cocoa
import FlutterMacOS
import Defaults

@main
class AppDelegate: FlutterAppDelegate {
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        // LocalSend handles the close event manually
        return false
    }
    
    private var statusItem: NSStatusItem?
    private var channel: FlutterMethodChannel?
    private var pendingFilesObservation: Defaults.Observation?
    
    override func applicationDidFinishLaunching(_ notification: Notification) {
        let controller = mainFlutterWindow?.contentViewController as! FlutterViewController
        channel = FlutterMethodChannel(name: "main-delegate-channel", binaryMessenger: controller.engine.binaryMessenger)
        channel?.setMethodCallHandler(handle)
        
        self.setupPendingItemsObservation()
    }
    
    private func setupPendingItemsObservation() {
        self.pendingFilesObservation = Defaults.observe(.pendingFiles) { change in
            let pendingFiles = Defaults[.pendingFiles]
            guard !pendingFiles.isEmpty else { return }
            self.sendPendingItemsToFlutter()
        }
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
            
            let dragView = FileDropView(frame: button.bounds)
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
        channel?.invokeMethod("onPendingFiles", arguments: Defaults[.pendingFiles].map { $0.path })
        Defaults[.pendingFiles] = []
        openApp()
    }
    
    // START: handle opened files
    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPendingFiles":
            result(Defaults[.pendingFiles].map { $0.path })
            Defaults[.pendingFiles] = []
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
        Defaults[.pendingFiles].append(URL(string: filename)!)
        return true
    }
    
    override func application(_ sender: NSApplication, openFiles filenames: [String]) {
        Defaults[.pendingFiles].append(contentsOf: filenames.map { URL(string: $0)! })
    }
    // END: handle opened files
}
