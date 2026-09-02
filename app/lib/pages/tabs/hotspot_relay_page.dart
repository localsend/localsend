import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/network/prp_provider.dart';
import 'package:localsend_app/util/transport/transports.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// PRP (Peer Relay Protocol) Page
///
/// Allows devices to establish a temporary local network via WiFi hotspot
/// or USB tethering for peer-to-peer file transfer.
class PrpPage extends StatefulWidget {
  const PrpPage({super.key});

  @override
  State<PrpPage> createState() => _PrpPageState();
}

class _PrpPageState extends State<PrpPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // Client mode form fields
  final _ssidController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  TransportType _selectedTransport = TransportType.wifiHotspot;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _ssidController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.hotspotRelayPage.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: const Icon(Icons.wifi_tethering), text: t.hotspotRelayPage.hostTab),
            Tab(icon: const Icon(Icons.wifi_find), text: t.hotspotRelayPage.clientTab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildHostTab(theme),
          _buildClientTab(theme),
        ],
      ),
    );
  }

  // ============================================================
  //  TRANSPORT SELECTOR
  // ============================================================

  Widget _buildTransportSelector() {
    final prpService = context.redux(prpProvider);
    final available = prpService.notifier.availableTransports;
    if (available.length <= 1) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Text('Transport:', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(width: 12),
            ...available.map(
              (type) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(_transportLabel(type)),
                  selected: _selectedTransport == type,
                  onSelected: (_) {
                    setState(() => _selectedTransport = type);
                    prpService.dispatch(SwitchTransportAction(type));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _transportLabel(TransportType type) {
    switch (type) {
      case TransportType.wifiHotspot:
        return 'WiFi';
      case TransportType.usbTethering:
        return 'USB';
      case TransportType.localNetwork:
        return 'LAN';
    }
  }

  // ============================================================
  //  HOST TAB
  // ============================================================

  Widget _buildHostTab(ThemeData theme) {
    final prpState = context.ref.watch(prpProvider);
    final prpService = context.redux(prpProvider);
    final isHosting = prpState.mode == PrpMode.host;
    final isConnected = prpState.state == PrpConnectionState.connected;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildTransportSelector(),
          const SizedBox(height: 12),

          // Status indicator
          _buildStatusCard(theme, prpState),

          const SizedBox(height: 16),

          if (isHosting && isConnected) ...[
            // QR Code showing connection info
            _buildQrCode(theme, prpState),

            const SizedBox(height: 16),

            // Connection info card
            _buildConnectionInfoCard(theme, prpState),

            const SizedBox(height: 16),

            // Stop host mode button
            _buildActionButton(
              theme: theme,
              label: t.hotspotRelayPage.stopHotspot,
              icon: Icons.stop_circle_outlined,
              color: theme.colorScheme.error,
              onPressed: () => prpService.dispatchAsync(StopHostAction()),
            ),
          ] else ...[
            // Start host mode button
            _buildActionButton(
              theme: theme,
              label: _selectedTransport == TransportType.usbTethering ? 'Start USB Relay' : t.hotspotRelayPage.startHotspot,
              icon: _selectedTransport == TransportType.usbTethering ? Icons.usb : Icons.wifi_tethering,
              color: theme.colorScheme.primary,
              onPressed: () => prpService.dispatchAsync(
                StartHostAction(transportType: _selectedTransport),
              ),
            ),

            const SizedBox(height: 12),

            // Info text
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(Icons.info_outline, color: theme.colorScheme.primary, size: 32),
                    const SizedBox(height: 8),
                    Text(
                      _selectedTransport == TransportType.usbTethering
                          ? 'Connect your device via USB cable and enable USB tethering in system settings.\n\nData is transferred over the USB connection.'
                          : t.hotspotRelayPage.hostInfoText,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ============================================================
  //  CLIENT TAB
  // ============================================================

  Widget _buildClientTab(ThemeData theme) {
    final prpState = context.ref.watch(prpProvider);
    final prpService = context.redux(prpProvider);
    final isConnected = prpState.state == PrpConnectionState.connected;
    final isLoading = prpState.state == PrpConnectionState.connecting;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildTransportSelector(),
          const SizedBox(height: 12),

          // Status indicator
          _buildStatusCard(theme, prpState),

          const SizedBox(height: 16),

          if (isConnected) ...[
            // Connected state
            Card(
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(
                      prpState.transportType == TransportType.usbTethering ? Icons.usb : Icons.wifi,
                      size: 48,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      prpState.transportType == TransportType.usbTethering
                          ? 'Connected via USB'
                          : t.hotspotRelayPage.connectedTo(ssid: prpState.networkName ?? ''),
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      t.hotspotRelayPage.openLocalsendHint,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            _buildActionButton(
              theme: theme,
              label: t.hotspotRelayPage.disconnect,
              icon: Icons.wifi_off,
              color: theme.colorScheme.error,
              onPressed: () => prpService.dispatchAsync(DisconnectPeerAction()),
            ),
          ] else ...[
            // Input form
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      prpState.transportType == TransportType.usbTethering ? 'USB Tethering' : t.hotspotRelayPage.enterHotspotInfo,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    if (prpState.transportType != TransportType.usbTethering) ...[
                      // SSID input (WiFi only)
                      TextField(
                        controller: _ssidController,
                        decoration: InputDecoration(
                          labelText: t.hotspotRelayPage.hotspotSsid,
                          prefixIcon: const Icon(Icons.wifi),
                          border: const OutlineInputBorder(),
                        ),
                        enabled: !isLoading,
                      ),

                      const SizedBox(height: 12),

                      // Password input (WiFi only)
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: t.hotspotRelayPage.password,
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                          ),
                        ),
                        obscureText: _obscurePassword,
                        enabled: !isLoading,
                      ),

                      const SizedBox(height: 16),
                    ],
                    if (prpState.transportType == TransportType.usbTethering) ...[
                      // USB info text
                      Card(
                        color: theme.colorScheme.tertiaryContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline, color: theme.colorScheme.onTertiaryContainer),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Connect your device via USB cable. '
                                  'Make sure USB tethering is enabled on the host device.',
                                  style: TextStyle(color: theme.colorScheme.onTertiaryContainer),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    _buildActionButton(
                      theme: theme,
                      label: isLoading ? t.hotspotRelayPage.connecting : t.hotspotRelayPage.connect,
                      icon: isLoading ? Icons.hourglass_top : (prpState.transportType == TransportType.usbTethering ? Icons.usb : Icons.wifi_find),
                      color: theme.colorScheme.primary,
                      onPressed: _canConnect(prpState)
                          ? () => prpService.dispatchAsync(
                              ConnectToPeerAction(
                                transportType: _selectedTransport,
                                ssid: _ssidController.text.trim(),
                                password: _passwordController.text.trim(),
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Error message
            if (prpState.errorMessage != null) ...[
              const SizedBox(height: 12),
              Card(
                color: theme.colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: theme.colorScheme.onErrorContainer),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          prpState.errorMessage!,
                          style: TextStyle(color: theme.colorScheme.onErrorContainer),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  bool _canConnect(PrpState prpState) {
    if (prpState.transportType == TransportType.usbTethering) {
      return prpState.state != PrpConnectionState.connecting;
    }
    return _ssidController.text.isNotEmpty && prpState.state != PrpConnectionState.connecting;
  }

  // ============================================================
  //  REUSABLE WIDGETS
  // ============================================================

  Widget _buildStatusCard(ThemeData theme, PrpState prpState) {
    final isConnected = prpState.state == PrpConnectionState.connected;
    final isActive = prpState.state == PrpConnectionState.connecting;

    return Card(
      color: isConnected
          ? theme.colorScheme.primaryContainer
          : isActive
          ? theme.colorScheme.tertiaryContainer
          : theme.colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              isConnected
                  ? Icons.check_circle
                  : isActive
                  ? Icons.hourglass_top
                  : Icons.info_outline,
              color: isConnected
                  ? theme.colorScheme.onPrimaryContainer
                  : isActive
                  ? theme.colorScheme.onTertiaryContainer
                  : theme.colorScheme.onSurfaceVariant,
              size: 32,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getStatusTitle(prpState),
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(
                    _getStatusSubtitle(prpState),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStatusTitle(PrpState prpState) {
    if (prpState.state == PrpConnectionState.connected) return t.hotspotRelayPage.statusConnected;
    if (prpState.state == PrpConnectionState.connecting) return t.hotspotRelayPage.statusConnecting;
    return t.hotspotRelayPage.statusReady;
  }

  String _getStatusSubtitle(PrpState prpState) {
    final viaUsb = prpState.transportType == TransportType.usbTethering;
    if (prpState.mode == PrpMode.host) {
      if (prpState.state == PrpConnectionState.connected) {
        return viaUsb ? 'USB tethering active' : t.hotspotRelayPage.statusHostActive;
      }
      if (prpState.state == PrpConnectionState.connecting) {
        return viaUsb ? 'Starting USB tethering...' : t.hotspotRelayPage.statusHostStarting;
      }
      return viaUsb ? 'Enable USB tethering to start' : t.hotspotRelayPage.statusHostReady;
    }
    if (prpState.mode == PrpMode.client) {
      if (prpState.state == PrpConnectionState.connected) {
        return viaUsb ? 'Connected via USB' : t.hotspotRelayPage.statusClientConnected;
      }
      if (prpState.state == PrpConnectionState.connecting) {
        return viaUsb ? 'Connecting via USB...' : t.hotspotRelayPage.statusClientConnecting;
      }
      return viaUsb ? 'Connect USB cable and enable tethering' : t.hotspotRelayPage.statusClientReady;
    }
    return t.hotspotRelayPage.statusSelectMode;
  }

  Widget _buildQrCode(ThemeData theme, PrpState prpState) {
    // Encode hotspot connection info as URL-like string
    final connectionData =
        'localsend://prp?ssid=${Uri.encodeComponent(prpState.networkName ?? '')}&password=${Uri.encodeComponent(prpState.networkPassword ?? '')}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(t.hotspotRelayPage.scanToConnect, style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            SizedBox(
              width: 220,
              height: 220,
              child: PrettyQrView.data(
                errorCorrectLevel: QrErrorCorrectLevel.Q,
                data: connectionData,
                decoration: PrettyQrDecoration(
                  shape: PrettyQrSmoothSymbol(
                    roundFactor: 0,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              t.hotspotRelayPage.scanQrHint,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionInfoCard(ThemeData theme, PrpState prpState) {
    final isUsb = prpState.transportType == TransportType.usbTethering;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(isUsb ? Icons.usb : Icons.info, size: 20, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(isUsb ? 'USB Connection' : t.hotspotRelayPage.connectionInfo, style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 12),
            if (isUsb) ...[
              _infoRow(theme, 'IP', prpState.ipAddress ?? 'N/A'),
              const SizedBox(height: 8),
              _infoRow(theme, 'Status', prpState.state == PrpConnectionState.connected ? 'Active' : 'Idle'),
            ] else ...[
              _infoRow(theme, t.hotspotRelayPage.ssid, prpState.networkName ?? ''),
              const SizedBox(height: 8),
              _infoRow(theme, t.hotspotRelayPage.password, prpState.networkPassword ?? ''),
            ],
          ],
        ),
      ),
    );
  }

  Widget _infoRow(ThemeData theme, String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: value));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(t.hotspotRelayPage.copiedToClipboard(label: label))),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(value, style: theme.textTheme.bodySmall, overflow: TextOverflow.ellipsis),
                  ),
                  Icon(Icons.copy, size: 14, color: theme.colorScheme.primary),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required ThemeData theme,
    required String label,
    required IconData icon,
    required Color color,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: color,
          foregroundColor: theme.colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
