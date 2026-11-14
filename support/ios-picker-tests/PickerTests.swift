import XCTest

final class PickerTests: XCTestCase {
  func testChooseFolders() throws {
    let app = XCUIApplication(bundleIdentifier: "org.localsend.localsendApp")
    app.activate()
    for _ in 0..<2 {
      guard app.buttons["Open"].waitForExistence(timeout: 30) else { XCTFail(app.debugDescription); return }
      let selected = app.buttons["LocalSendQA, Actions Menu"]
      let folder = app.cells["LocalSendQA, Folder"]
      if !selected.exists {
        if !folder.exists {
          let local = app.cells.matching(NSPredicate(format: "label == %@ OR label BEGINSWITH %@", "LocalSend", "LocalSend,")).firstMatch
          if local.exists { local.tap() }
        }
        guard folder.waitForExistence(timeout: 5) else { XCTFail(app.debugDescription); return }
        folder.tap()
      }
      guard selected.waitForExistence(timeout: 5) else { XCTFail(app.debugDescription); return }
      app.buttons["Open"].tap()
      sleep(2)
    }
  }
}
