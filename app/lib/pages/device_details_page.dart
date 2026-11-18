import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/pages/verify_page.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/util/favorites.dart';
import 'package:localsend_app/util/system_date_time_formatter.dart';
import 'package:localsend_app/util/ui/snackbar.dart';
import 'package:localsend_app/widget/big_button.dart';
import 'package:localsend_app/widget/dialogs/custom_bottom_sheet.dart';
import 'package:localsend_app/widget/dialogs/favorite_delete_dialog.dart';
import 'package:localsend_app/widget/dialogs/favorite_edit_dialog.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

/// Shows the general information of a discovered device, what is known about
/// each direction of its channels, and the log of its retained observations.
class DeviceDetailsPage extends StatefulWidget {
  final Device device;

  const DeviceDetailsPage({required this.device});

  @override
  State<DeviceDetailsPage> createState() => _DeviceDetailsPageState();
}

class _DeviceDetailsPageState extends State<DeviceDetailsPage> with Refena {
  List<DeviceLog> _logs = const [];

  @override
  void initState() {
    super.initState();

    ensureRef((ref) async {
      final logs = await ref
          .redux(parentIsolateProvider)
          .dispatchAsyncTakeResult(IsolateDiscoveryDeviceLogsAction(fingerprint: widget.device.fingerprint));
      if (mounted) {
        setState(() => _logs = logs);
      }
    });
  }

  Future<void> _toggleFavorite(FavoriteDevice? favoriteEntry) async {
    if (favoriteEntry != null) {
      final result = await showDialog<bool>(
        context: context,
        builder: (_) => FavoriteDeleteDialog(favoriteEntry),
      );
      if (result == true) {
        await ref.redux(favoritesProvider).dispatchAsync(RemoveFavoriteAction(deviceFingerprint: widget.device.fingerprint));
      }
    } else {
      await showDialog(
        context: context,
        builder: (_) => FavoriteEditDialog(prefilledDevice: widget.device),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final device = widget.device;
    final favoriteEntry = ref.watch(favoritesProvider).findDevice(device);
    final httpChannels = device.channels.whereType<HttpChannel>().toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(t.deviceDetailsPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigButton(
                icon: favoriteEntry != null ? Icons.favorite : Icons.favorite_border,
                label: t.deviceDetailsPage.favorite,
                filled: favoriteEntry != null,
                width: 120,
                onTap: () async => await _toggleFavorite(favoriteEntry),
              ),
              const SizedBox(width: 20),
              BigButton(
                icon: Icons.verified_user,
                label: t.deviceDetailsPage.verify,
                filled: false,
                width: 120,
                onTap: () async => await context.push(
                  () => VerifyPage(
                    fingerprint: CombinedFingerprint.load(context, device.fingerprint),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            children: [
              for (final entry in {
                t.deviceDetailsPage.info.name: device.alias,
                t.deviceDetailsPage.info.version: t.deviceDetailsPage.info.protocol(version: device.version),
              }.entries)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15, bottom: 5),
                      child: Text(entry.key, style: const TextStyle(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SelectableText(entry.value),
                    ),
                  ],
                ),
            ],
          ),
          if (httpChannels.isNotEmpty) ...[
            const SizedBox(height: 20),
            Text(t.deviceDetailsPage.channels.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            _HttpChannels(alias: device.alias, channels: httpChannels),
          ],
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text(t.deviceDetailsPage.logs.title, style: Theme.of(context).textTheme.titleMedium)),
              IconButton(
                tooltip: t.general.copy,
                icon: const Icon(Icons.copy),
                onPressed: _logs.isEmpty
                    ? null
                    : () async {
                        try {
                          await Clipboard.setData(
                            ClipboardData(
                              text: _logs.map((log) => '[${SystemDateTimeFormatter.time(context, log.timestamp)}] ${log.description}').join('\n'),
                            ),
                          );
                          if (context.mounted) {
                            context.showSnackBar(t.general.copiedToClipboard);
                          }
                        } catch (e) {
                          if (context.mounted) {
                            context.showSnackBar('${t.general.error}: $e');
                          }
                        }
                      },
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (_logs.isEmpty)
            Text(t.deviceDetailsPage.logs.empty, style: const TextStyle(color: Colors.grey))
          else
            ..._logs.map(
              (log) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('[${SystemDateTimeFormatter.time(context, log.timestamp)}]'),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(log.description),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// The HTTP channels of the device, condensed into one arrow per direction
/// between this device and the peer.
class _HttpChannels extends StatelessWidget {
  final String alias;
  final List<HttpChannel> channels;

  const _HttpChannels({required this.alias, required this.channels});

  @override
  Widget build(BuildContext context) {
    final outgoing = _outgoingState(channels);
    final incoming = channels.any((c) => c.inbound != null) ? _ArrowState.works : _ArrowState.unknown;
    // The row starts with this device, so in RTL the outgoing arrow points left.
    final outgoingRightwards = Directionality.of(context) == TextDirection.ltr;
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).colorScheme.secondaryContainerIfDark,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TransmissionMethod.http.label, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(t.deviceDetailsPage.channels.you),
                const SizedBox(width: 4),
                InkWell(
                  key: const ValueKey('device_details.http_channels'),
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async => await context.pushBottomSheet(() => _HttpChannelsSheet(channels: channels)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    // Stacked and shifted apart like a "swap" icon: each head reaches
                    // past the tail of the other arrow.
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: _swapShift),
                          child: _DirectionArrow(
                            state: outgoing,
                            rightwards: outgoingRightwards,
                            tooltip:
                                '${t.deviceDetailsPage.channels.outgoing}: ${switch (outgoing) {
                                  _ArrowState.works => t.deviceDetailsPage.channels.works,
                                  _ArrowState.unknown => t.deviceDetailsPage.channels.notTested,
                                  _ArrowState.failed => t.deviceDetailsPage.channels.failed,
                                }}',
                          ),
                        ),
                        const SizedBox(height: 2),
                        _DirectionArrow(
                          state: incoming,
                          rightwards: !outgoingRightwards,
                          tooltip:
                              '${t.deviceDetailsPage.channels.incoming}: ${incoming == _ArrowState.works ? t.deviceDetailsPage.channels.works : t.deviceDetailsPage.channels.notSeen}',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(alias, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Every HTTP channel of the device with the status of each direction.
class _HttpChannelsSheet extends StatelessWidget {
  final List<HttpChannel> channels;

  const _HttpChannelsSheet({required this.channels});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: TransmissionMethod.http.label,
      description: null,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.4),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final channel in channels) _ChannelInfo(channel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// One address of the device with the status of each direction as text.
class _ChannelInfo extends StatelessWidget {
  final HttpChannel channel;

  const _ChannelInfo(this.channel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText('${channel.host}:${channel.port}'),
          const SizedBox(height: 5),
          Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            children: [
              for (final entry in {
                t.deviceDetailsPage.channels.outgoing: channel.outgoingStatus,
                t.deviceDetailsPage.channels.incoming: channel.incomingStatus,
              }.entries)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15, bottom: 5),
                      child: Text(entry.key, style: const TextStyle(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(entry.value),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// How far the two arrows of the swap icon are shifted apart.
const _swapShift = 10.0;

/// This device → the peer: works as soon as one channel works, and only
/// counts as failed when no channel works and at least one failed.
_ArrowState _outgoingState(List<HttpChannel> channels) {
  if (channels.any((c) => c.outbound == ChannelOutbound.reachable)) {
    return _ArrowState.works;
  }
  if (channels.any((c) => c.outbound == ChannelOutbound.failed)) {
    return _ArrowState.failed;
  }
  return _ArrowState.unknown;
}

enum _ArrowState {
  /// At least one channel works in this direction.
  works,

  /// Nothing is known about this direction.
  unknown,

  /// Every tested channel failed in this direction.
  failed,
}

class _DirectionArrow extends StatelessWidget {
  final _ArrowState state;
  final bool rightwards;
  final String tooltip;

  const _DirectionArrow({required this.state, required this.rightwards, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Tooltip(
      message: tooltip,
      child: Semantics(
        label: tooltip,
        child: CustomPaint(
          size: const Size(30, 12),
          painter: _ArrowPainter(
            state: state,
            rightwards: rightwards,
            color: switch (state) {
              _ArrowState.works => colorScheme.primary,
              _ArrowState.unknown => colorScheme.outline,
              _ArrowState.failed => colorScheme.error,
            },
          ),
        ),
      ),
    );
  }
}

/// A horizontal arrow with a triangular head: bold with a filled head when
/// the direction works, thin with a hollow head when it is unknown, and
/// thin, dashed with a hollow head when it failed.
class _ArrowPainter extends CustomPainter {
  final _ArrowState state;
  final bool rightwards;
  final Color color;

  const _ArrowPainter({required this.state, required this.rightwards, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (!rightwards) {
      canvas.translate(size.width, 0);
      canvas.scale(-1, 1);
    }

    final bold = state == _ArrowState.works;
    final strokeWidth = bold ? 2.5 : 1.5;
    final y = size.height / 2;
    final headLength = size.height * 0.6;
    final headHalfHeight = size.height / 2 - (bold ? 0 : strokeWidth / 2);
    final headStart = size.width - headLength;
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    if (state == _ArrowState.failed) {
      const dash = 3.0;
      const gap = 2.0;
      for (var x = 0.0; x < headStart; x += dash + gap) {
        canvas.drawLine(Offset(x, y), Offset((x + dash).clamp(0.0, headStart), y), paint);
      }
    } else {
      canvas.drawLine(Offset(0, y), Offset(headStart, y), paint);
    }

    final head = Path()
      ..moveTo(headStart, y - headHalfHeight)
      ..lineTo(size.width - (bold ? 0 : strokeWidth / 2), y)
      ..lineTo(headStart, y + headHalfHeight)
      ..close();
    canvas.drawPath(head, bold ? (Paint()..color = color) : paint);
  }

  @override
  bool shouldRepaint(_ArrowPainter oldDelegate) {
    return state != oldDelegate.state || rightwards != oldDelegate.rightwards || color != oldDelegate.color;
  }
}

extension on HttpChannel {
  String get protocolLabel => https ? 'HTTPS' : 'HTTP';

  /// This device → the peer.
  String get outgoingStatus {
    return switch (outbound) {
      ChannelOutbound.reachable => t.deviceDetailsPage.channels.works,
      ChannelOutbound.untested => t.deviceDetailsPage.channels.notTested,
      ChannelOutbound.failed => t.deviceDetailsPage.channels.failed,
    };
  }

  /// The peer → this device.
  String get incomingStatus {
    return inbound != null ? t.deviceDetailsPage.channels.works : t.deviceDetailsPage.channels.notSeen;
  }
}

extension on DeviceLog {
  String get description {
    return switch (event) {
      DeviceLogOutbound(:final channel) => t.deviceDetailsPage.logs.outbound(protocol: channel.protocolLabel, host: channel.host),
      DeviceLogOutboundFailed(:final channel, :final error) => t.deviceDetailsPage.logs.outboundFailed(
        protocol: channel.protocolLabel,
        host: channel.host,
        error: error,
      ),
      DeviceLogInbound(:final channel) => t.deviceDetailsPage.logs.inbound(protocol: channel.protocolLabel, host: channel.host),
      DeviceLogMulticastInbound(:final host) => t.deviceDetailsPage.logs.multicastInbound(host: host),
    };
  }
}
