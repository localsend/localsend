import Cocoa

private final class TransferPreviewView: NSView {
    private let imageLayer = CALayer()

    override init(frame: NSRect) {
        super.init(frame: frame)
        wantsLayer = true
        layer?.cornerRadius = 10
        layer?.masksToBounds = true
        imageLayer.contentsGravity = .resizeAspectFill
        layer?.addSublayer(imageLayer)
        updateFill()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func layout() {
        super.layout()
        imageLayer.frame = bounds
    }

    func showImage(_ image: NSImage?) {
        imageLayer.contents = image?.cgImage(forProposedRect: nil, context: nil, hints: nil)
        imageLayer.isHidden = image == nil
    }

    override func viewDidChangeEffectiveAppearance() {
        super.viewDidChangeEffectiveAppearance()
        updateFill()
    }

    private func updateFill() {
        effectiveAppearance.performAsCurrentDrawingAppearance {
            layer?.backgroundColor = NSColor.tertiaryLabelColor.withAlphaComponent(0.16).cgColor
        }
    }
}

final class IncomingTransferPanel: NSPanel {
    private let senderLabel = NSTextField(labelWithString: "")
    private let descriptionLabel = NSTextField(labelWithString: "")
    private let preview = TransferPreviewView()
    private let previewIcon = NSImageView()
    private let previewName = NSTextField(labelWithString: "")
    private let acceptButton = NSButton()
    private let declineButton = NSButton()
    private let onAction: (String, String) -> Void
    private var sessionId: String?
    private var previewIconWidth: NSLayoutConstraint!
    private var previewIconHeight: NSLayoutConstraint!
    private var previewIconCenterY: NSLayoutConstraint!

    init(onAction: @escaping (String, String) -> Void) {
        self.onAction = onAction
        super.init(
            contentRect: NSRect(x: 0, y: 0, width: 388, height: 160),
            styleMask: [.titled, .fullSizeContentView, .nonactivatingPanel],
            backing: .buffered,
            defer: false
        )

        title = "Incoming LocalSend transfer"
        titleVisibility = .hidden
        titlebarAppearsTransparent = true
        standardWindowButton(.closeButton)?.isHidden = true
        standardWindowButton(.miniaturizeButton)?.isHidden = true
        standardWindowButton(.zoomButton)?.isHidden = true
        isFloatingPanel = true
        hidesOnDeactivate = false
        hasShadow = true
        level = .floating
        collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        backgroundColor = .clear
        isOpaque = false

        let background = NSView(frame: contentRect(forFrameRect: frame))
        if #available(macOS 26.0, *) {
            let glass = NSGlassEffectView(frame: background.frame)
            glass.style = .regular
            glass.cornerRadius = 20
            glass.contentView = background
            contentView = glass
        } else {
            let visualEffect = NSVisualEffectView(frame: background.frame)
            visualEffect.material = .popover
            visualEffect.blendingMode = .behindWindow
            visualEffect.state = .active
            visualEffect.wantsLayer = true
            visualEffect.layer?.cornerRadius = 20
            visualEffect.layer?.masksToBounds = true
            visualEffect.addSubview(background)
            contentView = visualEffect
        }

        let appIcon = NSImageView(image: NSImage(named: NSImage.applicationIconName) ?? NSImage())
        appIcon.imageScaling = .scaleProportionallyUpOrDown
        appIcon.translatesAutoresizingMaskIntoConstraints = false
        background.addSubview(appIcon)

        senderLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        senderLabel.textColor = .labelColor
        senderLabel.lineBreakMode = .byWordWrapping
        senderLabel.maximumNumberOfLines = 2
        senderLabel.cell?.truncatesLastVisibleLine = true
        senderLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        senderLabel.translatesAutoresizingMaskIntoConstraints = false
        background.addSubview(senderLabel)

        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .secondaryLabelColor
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.maximumNumberOfLines = 3
        descriptionLabel.cell?.truncatesLastVisibleLine = true
        descriptionLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        background.addSubview(descriptionLabel)

        preview.translatesAutoresizingMaskIntoConstraints = false
        background.addSubview(preview)

        previewIcon.imageScaling = .scaleProportionallyUpOrDown
        previewIcon.contentTintColor = .controlAccentColor
        previewIcon.translatesAutoresizingMaskIntoConstraints = false
        preview.addSubview(previewIcon)

        previewName.font = .systemFont(ofSize: 9, weight: .medium)
        previewName.textColor = .secondaryLabelColor
        previewName.alignment = .center
        previewName.lineBreakMode = .byTruncatingMiddle
        previewName.maximumNumberOfLines = 1
        previewName.translatesAutoresizingMaskIntoConstraints = false
        preview.addSubview(previewName)

        acceptButton.target = self
        acceptButton.action = #selector(accept)
        acceptButton.bezelStyle = .rounded
        acceptButton.font = .systemFont(ofSize: 13, weight: .semibold)
        acceptButton.keyEquivalent = "\r"

        declineButton.target = self
        declineButton.action = #selector(decline)
        declineButton.bezelStyle = .rounded
        declineButton.font = .systemFont(ofSize: 13, weight: .medium)

        let acceptControl: NSView
        let declineControl: NSView
        if #available(macOS 26.0, *) {
            let acceptGlass = NSGlassEffectView()
            acceptGlass.cornerRadius = 18
            acceptGlass.tintColor = .systemBlue
            acceptButton.isBordered = false
            acceptGlass.contentView = acceptButton
            acceptControl = acceptGlass

            let declineGlass = NSGlassEffectView()
            declineGlass.cornerRadius = 18
            declineButton.isBordered = false
            declineGlass.contentView = declineButton
            declineControl = declineGlass
        } else {
            acceptControl = acceptButton
            declineControl = declineButton
        }
        acceptControl.translatesAutoresizingMaskIntoConstraints = false
        declineControl.translatesAutoresizingMaskIntoConstraints = false
        background.addSubview(acceptControl)
        background.addSubview(declineControl)

        previewIconWidth = previewIcon.widthAnchor.constraint(equalToConstant: 32)
        previewIconHeight = previewIcon.heightAnchor.constraint(equalToConstant: 32)
        previewIconCenterY = previewIcon.centerYAnchor.constraint(equalTo: preview.centerYAnchor)

        NSLayoutConstraint.activate([
            appIcon.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 18),
            appIcon.topAnchor.constraint(equalTo: background.topAnchor, constant: 16),
            appIcon.widthAnchor.constraint(equalToConstant: 32),
            appIcon.heightAnchor.constraint(equalToConstant: 32),

            senderLabel.leadingAnchor.constraint(equalTo: appIcon.trailingAnchor, constant: 10),
            senderLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 16),
            senderLabel.trailingAnchor.constraint(equalTo: preview.leadingAnchor, constant: -12),

            descriptionLabel.leadingAnchor.constraint(equalTo: senderLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: senderLabel.bottomAnchor, constant: 3),
            descriptionLabel.trailingAnchor.constraint(equalTo: preview.leadingAnchor, constant: -12),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: declineControl.topAnchor, constant: -12),

            preview.topAnchor.constraint(equalTo: background.topAnchor, constant: 16),
            preview.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -18),
            preview.widthAnchor.constraint(equalToConstant: 78),
            preview.heightAnchor.constraint(equalToConstant: 78),
            previewIcon.centerXAnchor.constraint(equalTo: preview.centerXAnchor),
            previewIconCenterY,
            previewIconWidth,
            previewIconHeight,
            previewName.leadingAnchor.constraint(equalTo: preview.leadingAnchor, constant: 5),
            previewName.trailingAnchor.constraint(equalTo: preview.trailingAnchor, constant: -5),
            previewName.bottomAnchor.constraint(equalTo: preview.bottomAnchor, constant: -7),

            declineControl.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 18),
            declineControl.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -14),
            declineControl.heightAnchor.constraint(equalToConstant: 36),
            acceptControl.leadingAnchor.constraint(equalTo: declineControl.trailingAnchor, constant: 8),
            acceptControl.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -18),
            acceptControl.bottomAnchor.constraint(equalTo: declineControl.bottomAnchor),
            acceptControl.heightAnchor.constraint(equalTo: declineControl.heightAnchor),
            acceptControl.widthAnchor.constraint(equalTo: declineControl.widthAnchor),
        ])
    }

    func show(
        sessionId: String,
        sender: String,
        detail: String,
        fileCount: Int,
        previewName: String,
        previewType: String,
        previewData: Data?,
        accept: String,
        decline: String
    ) -> Bool {
        guard let screen = NSScreen.screens.first(where: { $0.frame.contains(NSEvent.mouseLocation) }) ?? NSScreen.main else { return false }
        self.sessionId = sessionId
        senderLabel.stringValue = sender.isEmpty ? "LocalSend" : sender
        senderLabel.toolTip = sender
        descriptionLabel.stringValue = detail
        let image = previewData.flatMap { $0.count <= 64 * 1024 ? NSImage(data: $0) : nil }
        preview.showImage(image)
        previewIcon.isHidden = image != nil
        previewIcon.image = image == nil ? NSImage(systemSymbolName: symbolName(for: previewType), accessibilityDescription: nil) : nil
        self.previewName.stringValue = fileCount > 1 && image == nil ? "\(fileCount)" : ""
        self.previewName.isHidden = fileCount <= 1 || image != nil
        previewIconCenterY.constant = fileCount > 1 && image == nil ? -7 : 0
        acceptButton.attributedTitle = NSAttributedString(
            string: accept,
            attributes: [.font: NSFont.systemFont(ofSize: 13, weight: .semibold), .foregroundColor: NSColor.labelColor]
        )
        declineButton.attributedTitle = NSAttributedString(
            string: decline,
            attributes: [.font: NSFont.systemFont(ofSize: 13, weight: .medium), .foregroundColor: NSColor.labelColor]
        )

        let visibleFrame = screen.visibleFrame
        setFrameOrigin(NSPoint(x: visibleFrame.maxX - frame.width - 20, y: visibleFrame.maxY - frame.height - 20))
        orderFrontRegardless()
        return true
    }

    func dismiss(sessionId: String? = nil) {
        guard sessionId == nil || sessionId == self.sessionId else { return }
        orderOut(nil)
        self.sessionId = nil
    }

    private func symbolName(for type: String) -> String {
        switch type {
        case "image": return "photo"
        case "video": return "play.rectangle"
        case "pdf": return "doc.richtext"
        case "text": return "text.alignleft"
        case "apk": return "app"
        case "multiple": return "square.stack.3d.up"
        default: return "doc"
        }
    }

    @objc private func accept() {
        respond(with: "accept")
    }

    @objc private func decline() {
        respond(with: "decline")
    }

    private func respond(with action: String) {
        guard let sessionId else { return }
        dismiss(sessionId: sessionId)
        onAction(sessionId, action)
    }
}
