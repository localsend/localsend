import UIKit
import Flutter
import UniformTypeIdentifiers
import Darwin

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate, UIDocumentPickerDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Cold-start ownership: no selection or transfer can reference an older
    // process's snapshots. Never remove them during an active folder picker.
    if let cache = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
      try? FileManager.default.removeItem(at: cache.appendingPathComponent("localsend-folders"))
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    let channel = FlutterMethodChannel(
        name: "ios-delegate-channel",
        binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )
    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        if call.method == "isReduceMotionEnabled" {
          result(UIAccessibility.isReduceMotionEnabled)
        } else if call.method == "pickFolder" {
          self.pickFolder(call.arguments as? [String: Any] ?? [:], result: result)
        } else if call.method == "prepareReceivedFile" {
          self.prepareReceivedFile(call.arguments as? [String: Any] ?? [:], result: result)
        } else if call.method == "finishReceivedFile" {
          let arguments = call.arguments as? [String: Any] ?? [:]
          if let id = arguments["id"] as? String { self.writes.removeValue(forKey: id)?.signal() }
          result(nil)
        } else {
          result(FlutterMethodNotImplemented)
        }
    }
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
  private var folderResult: FlutterResult?
  private var folderPurpose = "send"
  private var persistFolder = false
  private var folderBookmarks: [String: Data] = [:]
  private var writes: [String: DispatchSemaphore] = [:]
  private let fileQueue = DispatchQueue(label: "localsend.file-coordination", attributes: .concurrent)

  private func pickFolder(_ arguments: [String: Any], result: @escaping FlutterResult) {
    guard folderResult == nil else {
      result(FlutterError(code: "BUSY", message: "A folder picker is already open", details: nil)); return
    }
    folderResult = result
    folderPurpose = arguments["purpose"] as? String ?? "send"
    persistFolder = arguments["persist"] as? Bool ?? false
    let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.folder], asCopy: false)
    picker.delegate = self
    let activeWindow = UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .filter { $0.activationState == .foregroundActive }
      .flatMap { $0.windows }
      .first { $0.isKeyWindow }
    guard let presenter = activeWindow?.rootViewController else {
      folderResult = nil
      result(FlutterError(code: "NO_WINDOW", message: "Cannot open the folder picker", details: nil)); return
    }
    var top = presenter
    while let presented = top.presentedViewController { top = presented }
    top.present(picker, animated: true)
  }

  func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
    let callback = folderResult; folderResult = nil; callback?(nil)
  }

  func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
    guard let callback = folderResult else { return }
    folderResult = nil
    guard let url = urls.first else { callback(nil); return }
    let sending = folderPurpose == "send"
    let persist = persistFolder
    fileQueue.async {
      let scoped = url.startAccessingSecurityScopedResource()
      defer { if scoped { url.stopAccessingSecurityScopedResource() } }
      do {
        if sending {
          // Materialize provider files under coordinated reads. Dart and Rust
          // subsequently read only the private snapshot, without a stale grant.
          let staging = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
            .appendingPathComponent("localsend-folders").appendingPathComponent(UUID().uuidString)
          try FileManager.default.createDirectory(at: staging, withIntermediateDirectories: true)
          let target = staging.appendingPathComponent(url.lastPathComponent)
          var coordinationError: NSError?
          var copyError: Error?
          NSFileCoordinator().coordinate(readingItemAt: url, options: [], error: &coordinationError) { source in
            do { try FileManager.default.copyItem(at: source, to: target) } catch { copyError = error }
          }
          if let error = coordinationError ?? copyError as NSError? {
            try? FileManager.default.removeItem(at: staging)
            throw error
          }
          DispatchQueue.main.async { callback(target.path) }
        } else {
          let bookmark = try url.bookmarkData(options: .minimalBookmark, includingResourceValuesForKeys: nil, relativeTo: nil)
          DispatchQueue.main.async {
            self.folderBookmarks[url.path] = bookmark
            if persist {
              var saved = UserDefaults.standard.dictionary(forKey: "receiveFolderBookmarks") as? [String: Data] ?? [:]
              saved[url.path] = bookmark
              UserDefaults.standard.set(saved, forKey: "receiveFolderBookmarks")
            }
            callback(url.path)
          }
        }
      } catch {
        DispatchQueue.main.async { callback(FlutterError(code: "FOLDER_ACCESS", message: error.localizedDescription, details: nil)) }
      }
    }
  }

  private func prepareReceivedFile(_ arguments: [String: Any], result: @escaping FlutterResult) {
    guard let directory = arguments["directory"] as? String,
          let name = arguments["name"] as? String else {
      result(FlutterError(code: "INVALID_ARGUMENT", message: "Missing destination or file name", details: nil)); return
    }
    let overwrite = arguments["overwrite"] as? Bool ?? false
    let bookmarks = folderBookmarks.merging(
      UserDefaults.standard.dictionary(forKey: "receiveFolderBookmarks") as? [String: Data] ?? [:]
    ) { current, _ in current }
    fileQueue.async {
      var accessed: URL?
      do {
        var root = URL(fileURLWithPath: directory, isDirectory: true)
        // A bookmark's resolved URL can change after relaunch or provider moves.
        if let key = bookmarks.keys.filter({ directory == $0 || directory.hasPrefix($0 + "/") }).max(by: { $0.count < $1.count }),
           let data = bookmarks[key] {
          var stale = false
          let resolved = try URL(resolvingBookmarkData: data, options: .withoutUI, relativeTo: nil, bookmarkDataIsStale: &stale)
          let scoped = resolved.startAccessingSecurityScopedResource()
          guard scoped || self.isInsideAppContainer(resolved) else {
            throw NSError(domain: "LocalSend", code: 1, userInfo: [NSLocalizedDescriptionKey: "Folder access expired. Select the destination again."])
          }
          if scoped { accessed = resolved }
          let suffix = String(directory.dropFirst(key.count)).trimmingCharacters(in: CharacterSet(charactersIn: "/"))
          root = suffix.isEmpty ? resolved : resolved.appendingPathComponent(suffix)
          DispatchQueue.main.async { self.folderBookmarks[resolved.path] = data }
        } else if !self.isInsideAppContainer(root) {
          throw NSError(domain: "LocalSend", code: 1, userInfo: [NSLocalizedDescriptionKey: "Select this destination again to grant folder access."])
        }
        defer { accessed?.stopAccessingSecurityScopedResource() }
        let parts = name.split(separator: "/", omittingEmptySubsequences: false).map(String.init)
        guard !parts.isEmpty, parts.allSatisfy({ !$0.isEmpty && $0 != "." && $0 != ".." }) else {
          throw NSError(domain: "LocalSend", code: 2, userInfo: [NSLocalizedDescriptionKey: "Invalid relative file name"])
        }
        var coordinationError: NSError?
        var operationError: Error?
        let coordinator = NSFileCoordinator()
        coordinator.coordinate(writingItemAt: root, options: .forMerging, error: &coordinationError) { coordinatedRoot in
          do {
            let parent = parts.dropLast().reduce(coordinatedRoot) { $0.appendingPathComponent($1, isDirectory: true) }
            let resolvedRoot = coordinatedRoot.resolvingSymlinksInPath().path
            let resolvedParent = parent.resolvingSymlinksInPath().path
            guard resolvedParent == resolvedRoot || resolvedParent.hasPrefix(resolvedRoot + "/") else {
              throw NSError(domain: "LocalSend", code: 2, userInfo: [NSLocalizedDescriptionKey: "Destination escapes the selected folder"])
            }
            try FileManager.default.createDirectory(at: parent, withIntermediateDirectories: true)
            let leaf = parts.last!
            var target = parent.appendingPathComponent(leaf)
            var count = 2
            while !overwrite && self.entryExists(target.path) {
              let original = URL(fileURLWithPath: leaf)
              let ext = original.pathExtension
              let stem = original.deletingPathExtension().lastPathComponent
              target = parent.appendingPathComponent("\(stem) (\(count))" + (ext.isEmpty ? "" : ".\(ext)"))
              count += 1
            }
            // Reserve a new name while coordinated, and reject links before the
            // Rust writer opens the path. Existing retries keep their own name.
            if overwrite {
              let values = try target.resourceValues(forKeys: [.isSymbolicLinkKey])
              guard values.isSymbolicLink != true else { throw CocoaError(.fileWriteNoPermission) }
            } else {
              let descriptor = Darwin.open(target.path, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW, 0o600)
              guard descriptor >= 0 else { throw NSError(domain: NSPOSIXErrorDomain, code: Int(errno)) }
              Darwin.close(descriptor)
            }
            let id = UUID().uuidString
            let finished = DispatchSemaphore(value: 0)
            let finalPath = target.path
            DispatchQueue.main.async {
              self.writes[id] = finished
              result(["id": id, "path": finalPath])
            }
            // Hold coordination until the Rust write (including verification)
            // finishes. This wait is on a background queue, never the UI thread.
            finished.wait()
          } catch { operationError = error }
        }
        if let error = coordinationError ?? operationError as NSError? { throw error }
      } catch {
        DispatchQueue.main.async { result(FlutterError(code: "SAVE_FAILED", message: error.localizedDescription, details: nil)) }
      }
    }
  }
  private func isInsideAppContainer(_ url: URL) -> Bool {
    let home = URL(fileURLWithPath: NSHomeDirectory(), isDirectory: true).resolvingSymlinksInPath().standardizedFileURL.path
    let path = url.resolvingSymlinksInPath().standardizedFileURL.path
    return path == home || path.hasPrefix(home + "/")
  }

  private func entryExists(_ path: String) -> Bool {
    var info = stat()
    return Darwin.lstat(path, &info) == 0
  }
}
