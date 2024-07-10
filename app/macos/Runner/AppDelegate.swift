import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    // LocalSend handles the close event manually
    return false
  }

  // START: method channel logic
  private var channel: FlutterMethodChannel?
  private var cachedFiles: [String]? = []

  override func applicationDidFinishLaunching(_ notification: Notification) {
    let controller = mainFlutterWindow?.contentViewController as! FlutterViewController
    channel = FlutterMethodChannel(name: "main-delegate-channel", binaryMessenger: controller.engine.binaryMessenger)
    channel?.setMethodCallHandler(handle)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "getFiles":
        result(cachedFiles ?? [])
        cachedFiles = nil // files has been fetched, no need to cache anymore
      default:
        result(FlutterMethodNotImplemented)
      }
    }

  // END: method channel logic

  // START: handle opened files

  override func application(_ sender: NSApplication, openFile filename: String) -> Bool {
    cachedFiles?.append(filename)
    channel?.invokeMethod("onFiles", arguments: [filename])
    return true
  }

  override func application(_ sender: NSApplication, openFiles filenames: [String]) {
    cachedFiles?.append(contentsOf: filenames)
    channel?.invokeMethod("onFiles", arguments: filenames)
  }
  // END: handle opened files
}
