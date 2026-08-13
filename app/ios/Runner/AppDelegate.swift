import UIKit
import Flutter
#if canImport(WiFiAware) && canImport(DeviceDiscoveryUI)
import DeviceDiscoveryUI
import Network
import SwiftUI
import WiFiAware
#endif

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private var wifiAwareController: WifiAwareController?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    let channel = FlutterMethodChannel(
        name: "ios-delegate-channel",
        binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )
    wifiAwareController = WifiAwareController(channel: channel)
    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        switch call.method {
        case "isReduceMotionEnabled":
          result(UIAccessibility.isReduceMotionEnabled)
        case "isWifiAwareSupported":
          result(self.wifiAwareController?.isSupported ?? false)
        case "showWifiAwarePairing":
          self.wifiAwareController?.showPairing()
          result(nil)
        case "startWifiAware":
          guard
            let arguments = call.arguments as? [String: Any],
            let port = arguments["port"] as? Int,
            let https = arguments["https"] as? Bool,
            (1...65535).contains(port)
          else {
            result(FlutterError(code: "INVALID_ARGUMENT", message: "Missing port or https", details: nil))
            return
          }
          self.wifiAwareController?.start(port: UInt16(port), https: https)
          result(nil)
        case "stopWifiAware":
          self.wifiAwareController?.stop()
          result(nil)
        default:
          result(FlutterMethodNotImplemented)
        }
    }
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}

#if canImport(WiFiAware) && canImport(DeviceDiscoveryUI)
@available(iOS 26.0, *)
private extension WAPublishableService {
  static var localSend: WAPublishableService { allServices["_localsend._tcp"]! }
}

@available(iOS 26.0, *)
private extension WASubscribableService {
  static var localSend: WASubscribableService { allServices["_localsend._tcp"]! }
}

@available(iOS 26.0, *)
private struct LocalSendPairingView: View {
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      VStack(spacing: 24) {
        Text("Pair two nearby devices before using Wi-Fi Aware. One device should advertise while the other chooses it.")
          .multilineTextAlignment(.center)

        DevicePairingView(
          .wifiAware(.connecting(to: .localSend, from: .selected([])))
        ) {
          Label("Advertise this iPhone", systemImage: "dot.radiowaves.left.and.right")
        } fallback: {
          Text("Wi-Fi Aware pairing is unavailable on this device.")
        }

        DevicePicker(
          .wifiAware(.connecting(to: .userSpecifiedDevices, from: .localSend)),
          onSelect: { _ in dismiss() }
        ) {
          Label("Choose another device", systemImage: "iphone.gen3.radiowaves.left.and.right")
        } fallback: {
          Text("No compatible nearby-device picker is available.")
        }

        Spacer()
      }
      .padding()
      .navigationTitle("Wi-Fi Aware")
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button("Done") { dismiss() }
        }
      }
    }
  }
}

@available(iOS 26.0, *)
private final class IOS26WifiAwareTransport {
  private let channel: FlutterMethodChannel
  private let queue = DispatchQueue(label: "org.localsend.wifi-aware")
  private var publishTask: Task<Void, Never>?
  private var browseTask: Task<Void, Never>?
  private var proxyListeners: [String: NWListener] = [:]
  private var serverPort: UInt16 = 0
  private var https = true

  init(channel: FlutterMethodChannel) {
    self.channel = channel
  }

  func start(port: UInt16, https: Bool) {
    guard WACapabilities.supportedFeatures.contains(.wifiAware) else { return }
    if serverPort == port && self.https == https && publishTask != nil { return }
    stop()
    serverPort = port
    self.https = https
    startPublisher()
    startBrowser()
  }

  func stop() {
    publishTask?.cancel()
    browseTask?.cancel()
    publishTask = nil
    browseTask = nil
    proxyListeners.values.forEach { $0.cancel() }
    proxyListeners.removeAll()
  }

  private func startPublisher() {
    let localPort = serverPort
    publishTask = Task { [weak self] in
      do {
        let listener = try NetworkListener(
          for: .wifiAware(.connecting(to: .localSend, from: .allPairedDevices)),
          using: { TCP() }
        )
        try await listener.run { connection in
          guard let self else { return }
          try await self.bridgeToLocalServer(connection, port: localPort)
        }
      } catch is CancellationError {
      } catch {
        NSLog("LocalSend Wi-Fi Aware publisher failed: %@", String(describing: error))
      }
    }
  }

  private func startBrowser() {
    browseTask = Task { [weak self] in
      guard let self else { return }
      do {
        let browser = NetworkBrowser(
          for: .wifiAware(.connecting(to: .allPairedDevices, from: .localSend))
        )
        try await browser.run { endpoints in
          for endpoint in endpoints {
            self.addLoopbackProxy(for: endpoint)
          }
          return .continue
        }
      } catch is CancellationError {
      } catch {
        NSLog("LocalSend Wi-Fi Aware browser failed: %@", String(describing: error))
      }
    }
  }

  private func addLoopbackProxy(for endpoint: NWEndpoint) {
    let key = String(describing: endpoint)
    guard proxyListeners[key] == nil else { return }
    do {
      let parameters = NWParameters.tcp
      parameters.requiredLocalEndpoint = .hostPort(host: "127.0.0.1", port: .any)
      let listener = try NWListener(using: parameters)
      listener.newConnectionHandler = { [weak self] localConnection in
        guard let self else { return }
        let awareConnection = NetworkConnection(to: endpoint, using: { TCP() }).start()
        Task {
          do {
            try await self.bridge(localConnection, awareConnection)
          } catch {
            localConnection.cancel()
          }
        }
      }
      listener.stateUpdateHandler = { [weak self] state in
        guard let self, case .ready = state, let port = listener.port else { return }
        DispatchQueue.main.async {
          self.channel.invokeMethod(
            "wifiAwareEndpoint",
            arguments: ["host": "127.0.0.1", "port": Int(port.rawValue), "https": self.https]
          )
        }
      }
      proxyListeners[key] = listener
      listener.start(queue: queue)
    } catch {
      NSLog("LocalSend Wi-Fi Aware proxy failed: %@", String(describing: error))
    }
  }

  private func bridgeToLocalServer(_ awareConnection: NetworkConnection<TCP>, port: UInt16) async throws {
    guard let endpointPort = NWEndpoint.Port(rawValue: port) else { return }
    let localConnection = NWConnection(host: "127.0.0.1", port: endpointPort, using: .tcp)
    try await bridge(localConnection, awareConnection)
  }

  private func bridge(_ localConnection: NWConnection, _ awareConnection: NetworkConnection<TCP>) async throws {
    localConnection.start(queue: queue)
    try await withThrowingTaskGroup(of: Void.self) { group in
      group.addTask {
        while !Task.isCancelled {
          let message = try await awareConnection.receive(atLeast: 1, atMost: 64 * 1024)
          try await self.send(message.content, to: localConnection)
        }
      }
      group.addTask {
        while !Task.isCancelled {
          let data = try await self.receive(from: localConnection)
          try await awareConnection.send(data, endOfStream: false)
        }
      }
      _ = try await group.next()
      group.cancelAll()
    }
    localConnection.cancel()
  }

  private func receive(from connection: NWConnection) async throws -> Data {
    try await withCheckedThrowingContinuation { continuation in
      connection.receive(minimumIncompleteLength: 1, maximumLength: 64 * 1024) { data, _, complete, error in
        if let error {
          continuation.resume(throwing: error)
        } else if let data, !data.isEmpty {
          continuation.resume(returning: data)
        } else if complete {
          continuation.resume(throwing: CancellationError())
        } else {
          continuation.resume(throwing: CancellationError())
        }
      }
    }
  }

  private func send(_ data: Data, to connection: NWConnection) async throws {
    try await withCheckedThrowingContinuation { continuation in
      connection.send(content: data, completion: .contentProcessed { error in
        if let error {
          continuation.resume(throwing: error)
        } else {
          continuation.resume(returning: ())
        }
      })
    }
  }
}
#endif

private final class WifiAwareController {
  private let channel: FlutterMethodChannel
#if canImport(WiFiAware) && canImport(DeviceDiscoveryUI)
  private var transport: Any?
#endif

  init(channel: FlutterMethodChannel) {
    self.channel = channel
  }

  var isSupported: Bool {
#if canImport(WiFiAware) && canImport(DeviceDiscoveryUI)
    if #available(iOS 26.0, *) {
      return WACapabilities.supportedFeatures.contains(.wifiAware)
    }
#endif
    return false
  }

  func start(port: UInt16, https: Bool) {
#if canImport(WiFiAware) && canImport(DeviceDiscoveryUI)
    if #available(iOS 26.0, *) {
      let value = (transport as? IOS26WifiAwareTransport) ?? IOS26WifiAwareTransport(channel: channel)
      transport = value
      value.start(port: port, https: https)
    }
#endif
  }

  func stop() {
#if canImport(WiFiAware) && canImport(DeviceDiscoveryUI)
    if #available(iOS 26.0, *) {
      (transport as? IOS26WifiAwareTransport)?.stop()
      transport = nil
    }
#endif
  }

  func showPairing() {
#if canImport(WiFiAware) && canImport(DeviceDiscoveryUI)
    if #available(iOS 26.0, *), isSupported {
      guard let presenter = UIApplication.shared.connectedScenes
        .compactMap({ $0 as? UIWindowScene })
        .flatMap({ $0.windows })
        .first(where: { $0.isKeyWindow })?
        .rootViewController else { return }
      presenter.present(UIHostingController(rootView: LocalSendPairingView()), animated: true)
    }
#endif
  }
}
