import Cocoa
import FlutterMacOS
import window_manager

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()

    // Register before installing the view controller: Dart can start before `applicationDidFinishLaunching`
    // and call this channel, causing MissingPluginException if registration waits until then.
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    appDelegate.registerMethodChannel(binaryMessenger: flutterViewController.engine.binaryMessenger)

    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }

  // window_manager: start hidden
  override public func order(_ place: NSWindow.OrderingMode, relativeTo otherWin: Int) {
    super.order(place, relativeTo: otherWin)
    hiddenWindowAtLaunch()
  }
}
