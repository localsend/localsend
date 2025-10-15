import Cocoa
import FlutterMacOS
import window_manager
import bitsdojo_window_macos  // used to make custom window bars on macOS (or any desktop operating system for that matter)

class MainFlutterWindow: BitsdojoWindow {
  // just following intructions from https://pub.dev/packages/bitsdojo_window
  override func bitsdojo_window_configure() -> UInt {
    return BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP
  }
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)
    // window_manager: start window hidden
    hiddenWindowAtLaunch()  

    super.awakeFromNib()
  }
}
