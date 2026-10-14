import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/http_provider.dart';
import 'package:localsend_app/provider/network/auto_send_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/widget/dialogs/error_dialog.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:localsend_isolates/rust/api/model.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

final _logger = Logger('AutoSend');

/// Registers with the first favorite and starts a send session.
///
/// No-ops when there is no favorite, send mode is not single, [files] is empty,
/// a send is already in flight, or a session is already active for that target.
class TryAutoSendAction extends AsyncGlobalAction {
  final List<CrossFile> files;

  TryAutoSendAction(this.files);

  @override
  Future<void> reduce() async {
    final autoSend = ref.notifier(autoSendProvider);
    if (ref.read(autoSendProvider).inFlight) {
      return;
    }

    final sendMode = ref.read(settingsProvider).sendMode;
    if (sendMode != SendMode.single) {
      return;
    }

    final favorite = ref.read(favoritesProvider).firstOrNull;
    if (favorite == null) {
      return;
    }

    if (files.isEmpty) {
      return;
    }

    final existingSession = ref.read(sendProvider).values.firstWhereOrNull(
          (s) =>
              s.target.fingerprint == favorite.fingerprint &&
              (s.status == SessionStatus.waiting || s.status == SessionStatus.sending),
        );
    if (existingSession != null) {
      return;
    }

    autoSend.setInFlight(true);
    final https = ref.read(settingsProvider).https;

    try {
      final payload = ref.read(deviceFullInfoProvider).toRegisterDto();
      final response = await ref.read(httpProvider).discovery.register(
            protocol: https ? ProtocolType.https : ProtocolType.http,
            ip: favorite.ip,
            port: favorite.port,
            payload: payload,
          );

      final device = response.body.toDevice(favorite.ip, favorite.port, https);
      if (device.fingerprint != favorite.fingerprint) {
        throw Exception(
          'Linked PC unreachable: device at ${favorite.ip} does not match saved fingerprint.',
        );
      }

      await ref.notifier(sendProvider).startSession(
            target: device,
            files: files,
            background: false,
          );
      autoSend.setInFlight(false);
    } catch (e, stackTrace) {
      _logger.warning('Auto-send to ${favorite.alias} (${favorite.ip}) failed', e, stackTrace);
      final message = 'Linked PC unreachable (${favorite.alias} @ ${favorite.ip}): $e';
      autoSend.setError(message);
      try {
        // ignore: use_build_context_synchronously
        await showDialog<void>(
          context: Routerino.context,
          builder: (_) => ErrorDialog(error: message),
        );
      } catch (_) {
        // No navigator yet (e.g. very early share intent); error stays on autoSendProvider.
      }
    }
  }
}
