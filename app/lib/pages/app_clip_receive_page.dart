import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/http_provider.dart';
import 'package:localsend_app/provider/receive_history_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart';
import 'package:localsend_app/util/native/directories.dart';
import 'package:localsend_isolates/file_saver.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/rust/api/cancel.dart';
import 'package:localsend_isolates/rust/api/http.dart' as rust_http;
import 'package:localsend_isolates/rust/api/model.dart' as rust_model;
import 'package:localsend_isolates/util/file_size_helper.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';
import 'package:uuid/uuid.dart';

enum _DirectFilePhase { queued, receiving, completed, failed }

class _DirectFile {
  final rust_model.FileDto source;
  final FileDto display;
  _DirectFilePhase phase = _DirectFilePhase.queued;
  double progress = 0;
  FileSaveTarget? target;
  bool savedToGallery = false;
  String? finalPath;
  RsCancellationToken? cancelToken;

  _DirectFile(this.source) : display = source.toDart();
}

/// Android's direct-receive surface for an iOS App Clip sender.
///
/// Hotspot and NFC ownership stay in the native `AppClipHostService` through the
/// channel. This page retains only redacted state plus the QR capability while
/// visible, confirms the whole offer, and streams files through the Rust v2
/// client into LocalSend's existing incoming-file saver.
class AppClipReceivePage extends StatefulWidget {
  const AppClipReceivePage({super.key});

  @override
  State<AppClipReceivePage> createState() => _AppClipReceivePageState();
}

class _AppClipReceivePageState extends State<AppClipReceivePage> with Refena {
  StreamSubscription<AppClipHostState>? _hostSubscription;
  AppClipHostState _hostState = const AppClipHostState(state: 'idle', hceAvailable: false);
  AppClipBootstrap? _bootstrap;
  rust_http.RsPrepareDownloadResponse? _offer;
  rust_http.RsHttpClient? _client;
  RsCancellationToken? _prepareCancelToken;
  List<_DirectFile> _files = const [];
  String? _invocationUrl;
  String? _failureCode;
  bool _starting = true;
  bool _loadingOffer = false;
  bool _transferring = false;
  bool _completed = false;
  bool _disposed = false;
  bool _nativeAcknowledged = false;
  String? _destinationDirectory;
  String? _cacheDirectory;
  bool _saveToGallery = false;
  int? _androidSdkInt;
  final Set<String> _createdDirectories = {};
  Future<void>? _teardownFuture;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => unawaited(_begin()));
  }

  Future<void> _begin() async {
    try {
      await _beginSession();
    } catch (_) {
      _setFailure('START_FAILED');
    }
  }

  Future<void> _beginSession() async {
    await _teardown(notifyPeer: true);
    if (!mounted) return;
    await _hostSubscription?.cancel();
    _hostSubscription = null;
    _teardownFuture = null;
    _createdDirectories.clear();
    setState(() {
      _hostState = const AppClipHostState(state: 'idle', hceAvailable: false);
      _bootstrap = null;
      _offer = null;
      _client = null;
      _files = const [];
      _invocationUrl = null;
      _failureCode = null;
      _starting = true;
      _loadingOffer = false;
      _transferring = false;
      _completed = false;
      _nativeAcknowledged = false;
      _destinationDirectory = null;
      _cacheDirectory = null;
      _saveToGallery = false;
      _androidSdkInt = null;
    });

    var prerequisites = await getAppClipHostPrerequisitesAndroid();
    if (prerequisites.missing.contains('APP_CLIP_URL_NOT_CONFIGURED')) {
      _setFailure('APP_CLIP_URL_NOT_CONFIGURED');
      return;
    }
    final permissions = <Permission>[];
    if (prerequisites.missing.contains('android.permission.NEARBY_WIFI_DEVICES')) {
      permissions.add(Permission.nearbyWifiDevices);
    }
    if (prerequisites.missing.contains('android.permission.ACCESS_FINE_LOCATION')) {
      permissions.add(Permission.location);
    }
    if (prerequisites.missing.contains('android.permission.POST_NOTIFICATIONS')) {
      permissions.add(Permission.notification);
    }
    if (permissions.isNotEmpty) {
      await permissions.request();
      prerequisites = await getAppClipHostPrerequisitesAndroid();
    }
    if (!prerequisites.available) {
      _setFailure(prerequisites.missing.any((value) => value.startsWith('android.permission.')) ? 'PERMISSION_DENIED' : 'UNAVAILABLE');
      return;
    }

    _hostSubscription = watchAppClipHostStateAndroid().listen(
      _onHostState,
      onError: (_) => _setFailure('EVENT_CHANNEL_FAILED'),
    );
    final alias = ref.read(settingsProvider).alias;
    final state = await startAppClipHostAndroid(alias);
    _onHostState(state);
  }

  void _onHostState(AppClipHostState state) {
    if (!mounted || _disposed) return;
    final previousState = _hostState.state;
    setState(() {
      _hostState = state;
      _starting = state.state == 'startingHotspot';
    });
    if (state.state == 'failed') {
      _setFailure(state.message ?? 'FAILED');
    } else if (state.state == 'unavailable') {
      _setFailure(state.message ?? 'UNAVAILABLE');
    } else if (state.state == 'idle' && previousState != 'idle' && !_completed) {
      _setFailure('SESSION_STOPPED');
    } else if (state.state == 'readyForTap') {
      unawaited(_loadInvocationUrl());
    } else if (state.state == 'waitingForApproval') {
      unawaited(_loadOffer());
    }
  }

  Future<void> _loadInvocationUrl() async {
    try {
      final value = await getAppClipInvocationUrlAndroid();
      if (!mounted || value == null) return;
      setState(() => _invocationUrl = value);
    } catch (_) {
      _setFailure('INVOCATION_URL_UNAVAILABLE');
    }
  }

  Future<void> _loadOffer() async {
    if (_loadingOffer || _offer != null) return;
    setState(() => _loadingOffer = true);
    try {
      final bootstrap = await getAppClipBootstrapAndroid();
      if (bootstrap == null) throw StateError('BOOTSTRAP_MISSING');
      final client = ref.read(httpProvider).appClipAuthenticated();
      final cancelToken = createCancellationToken();
      _prepareCancelToken = cancelToken;
      final offer = await client.prepareDownload(
        protocol: rust_model.ProtocolType.http,
        ip: bootstrap.peerIp,
        port: bootstrap.peerPort,
        pin: bootstrap.downloadToken,
        cancelToken: cancelToken,
      );
      final files = _validateOffer(offer);
      if (!mounted) return;
      setState(() {
        _bootstrap = bootstrap;
        _client = client;
        _offer = offer;
        _files = files;
        _loadingOffer = false;
      });
    } catch (_) {
      _setFailure('PREPARE_DOWNLOAD_FAILED');
    }
  }

  List<_DirectFile> _validateOffer(rust_http.RsPrepareDownloadResponse offer) {
    if (!offer.info.download || offer.files.isEmpty || offer.files.length > 10_000) {
      throw StateError('INVALID_OFFER');
    }
    final maxFileSize = BigInt.from(4) * BigInt.from(1024).pow(3);
    final maxSessionSize = BigInt.from(20) * BigInt.from(1024).pow(3);
    var total = BigInt.zero;
    final files = <_DirectFile>[];
    for (final entry in offer.files.entries) {
      final file = entry.value;
      if (entry.key != file.id || file.size < BigInt.zero || file.size > maxFileSize || !utf8.encode(file.fileName).length.inRange(1, 255)) {
        throw StateError('INVALID_FILE');
      }
      final direct = _DirectFile(file);
      if (direct.display.fileType != FileType.image && direct.display.fileType != FileType.video) {
        throw StateError('UNSUPPORTED_FILE_TYPE');
      }
      total += file.size;
      files.add(direct);
    }
    if (total > maxSessionSize) throw StateError('SESSION_TOO_LARGE');
    return files;
  }

  Future<void> _accept() async {
    try {
      await _acceptOffer();
    } catch (_) {
      _setFailure('RECEIVE_SETUP_FAILED');
    }
  }

  Future<void> _acceptOffer() async {
    final bootstrap = _bootstrap;
    final offer = _offer;
    if (_transferring || bootstrap == null || offer == null) return;
    if (!_nativeAcknowledged) {
      if (!await acknowledgeAppClipBootstrapAndroid(bootstrap.sessionId)) {
        _setFailure('BOOTSTRAP_EXPIRED');
        return;
      }
      _nativeAcknowledged = true;
    }

    _androidSdkInt ??= ref.read(deviceInfoProvider).androidSdkInt;
    if (_androidSdkInt != null && _androidSdkInt! < 33) await Permission.storage.request();
    final settings = ref.read(settingsProvider);
    _destinationDirectory ??= settings.destination ?? await getDefaultDestinationDirectory();
    _cacheDirectory ??= await getCacheDirectory();
    _saveToGallery = settings.saveToGallery && _files.every((file) => !file.display.fileName.contains('/'));
    await _runTransfers(_files.where((file) => file.phase != _DirectFilePhase.completed));
  }

  Future<void> _runTransfers(Iterable<_DirectFile> files) async {
    if (_transferring || _destinationDirectory == null || _cacheDirectory == null) return;
    setState(() => _transferring = true);
    for (final file in files) {
      await _downloadFile(
        file,
        destinationDirectory: _destinationDirectory!,
        cacheDirectory: _cacheDirectory!,
        saveToGallery: _saveToGallery,
        createdDirectories: _createdDirectories,
        androidSdkInt: _androidSdkInt,
      );
      if (_disposed) return;
    }
    if (!mounted) return;
    final allCompleted = _files.every((file) => file.phase == _DirectFilePhase.completed);
    setState(() {
      _transferring = false;
      _completed = allCompleted;
    });
    if (allCompleted) await _teardown(notifyPeer: false);
  }

  Future<void> _downloadFile(
    _DirectFile file, {
    required String destinationDirectory,
    required String cacheDirectory,
    required bool saveToGallery,
    required Set<String> createdDirectories,
    required int? androidSdkInt,
  }) async {
    final bootstrap = _bootstrap!;
    final offer = _offer!;
    final client = _client!;
    final cancelToken = createCancellationToken();
    file.cancelToken = cancelToken;
    try {
      file.target = file.target == null
          ? await prepareFileSaveTarget(
              destinationDirectory: destinationDirectory,
              cacheDirectory: cacheDirectory,
              fileName: file.display.fileName,
              saveToGallery: saveToGallery,
              isImage: file.display.fileType == FileType.image,
              createdDirectories: createdDirectories,
              androidSdkInt: androidSdkInt,
            )
          : await reopenFileSaveTarget(file.target!);
      _updateFile(file, phase: _DirectFilePhase.receiving, progress: 0);
      var failed = false;
      await for (final event in client.downloadToTarget(
        protocol: rust_model.ProtocolType.http,
        ip: bootstrap.peerIp,
        port: bootstrap.peerPort,
        sessionId: offer.sessionId,
        fileId: file.source.id,
        path: file.target!.path,
        fileDescriptor: file.target!.fileDescriptor,
        expectedSize: file.source.size,
        cancelToken: cancelToken,
      )) {
        if (event is rust_http.RsDownloadEvent_Progress) {
          _updateFile(file, progress: event.progress);
        } else if (event is rust_http.RsDownloadEvent_Failed) {
          failed = true;
        }
      }
      if (failed) throw StateError('DOWNLOAD_FAILED');

      var finalPath = file.target!.displayPath;
      var savedToGallery = false;
      if (saveToGallery) {
        final gallery = await saveCachedFileToGallery(
          cachedPath: file.target!.path!,
          destinationDirectory: destinationDirectory,
          fileName: file.display.fileName,
          isImage: file.display.fileType == FileType.image,
          createdDirectories: createdDirectories,
        );
        savedToGallery = gallery.$1;
        finalPath = gallery.$2 ?? finalPath;
      }
      file.finalPath = finalPath;
      file.savedToGallery = savedToGallery;
      _updateFile(file, phase: _DirectFilePhase.completed, progress: 1);
      await ref
          .redux(receiveHistoryProvider)
          .dispatchAsync(
            AddHistoryEntryAction(
              entryId: const Uuid().v4(),
              fileName: file.display.fileName,
              fileType: file.display.fileType,
              path: savedToGallery ? null : finalPath,
              savedToGallery: savedToGallery,
              isMessage: false,
              fileSize: file.display.size,
              senderAlias: offer.info.alias,
              timestamp: DateTime.now().toUtc(),
            ),
          );
    } catch (_) {
      _updateFile(file, phase: _DirectFilePhase.failed);
    } finally {
      file.cancelToken = null;
    }
  }

  Future<void> _retryFailed() async {
    await _runTransfers(_files.where((file) => file.phase == _DirectFilePhase.failed));
  }

  Future<void> _teardown({required bool notifyPeer}) {
    return _teardownFuture ??= _performTeardown(notifyPeer: notifyPeer);
  }

  Future<void> _performTeardown({required bool notifyPeer}) async {
    _prepareCancelToken?.cancel();
    for (final file in _files) {
      file.cancelToken?.cancel();
    }
    final bootstrap = _bootstrap;
    final offer = _offer;
    final client = _client;
    if (notifyPeer && bootstrap != null && offer != null && client != null) {
      try {
        await client.cancel(
          protocol: rust_model.ProtocolType.http,
          ip: bootstrap.peerIp,
          port: bootstrap.peerPort,
          sessionId: offer.sessionId,
        );
      } catch (_) {
        // Best effort: native teardown below still revokes the hotspot capability.
      }
    }
    await stopAppClipHostAndroid();
  }

  void _updateFile(_DirectFile file, {_DirectFilePhase? phase, double? progress}) {
    if (!mounted || _disposed) return;
    setState(() {
      if (phase != null) file.phase = phase;
      if (progress != null) file.progress = progress.clamp(0, 1);
    });
  }

  void _setFailure(String code) {
    if (!mounted || _disposed) return;
    setState(() {
      _failureCode = code;
      _starting = false;
      _loadingOffer = false;
      _transferring = false;
    });
    unawaited(_teardown(notifyPeer: true));
  }

  @override
  void dispose() {
    _disposed = true;
    _prepareCancelToken?.cancel();
    for (final file in _files) {
      file.cancelToken?.cancel();
    }
    unawaited(_hostSubscription?.cancel());
    unawaited(_teardown(notifyPeer: true));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) unawaited(_teardown(notifyPeer: true));
      },
      child: Scaffold(
        appBar: AppBar(title: Text(t.appClip.title)),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: _content(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content() {
    if (_failureCode != null) {
      final message = switch (_failureCode) {
        'APP_CLIP_URL_NOT_CONFIGURED' => t.appClip.notConfigured,
        'PERMISSION_DENIED' => t.appClip.permissionDenied,
        'UNAVAILABLE' => t.appClip.unavailable,
        _ => t.appClip.failed,
      };
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 72),
          const SizedBox(height: 20),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(_failureCode!, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 24),
          FilledButton.icon(onPressed: _begin, icon: const Icon(Icons.refresh), label: Text(t.appClip.retryFailed)),
        ],
      );
    }
    if (_completed) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle_outline, size: 72),
          const SizedBox(height: 20),
          Text(t.appClip.completed, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          FilledButton(onPressed: () => context.pop(), child: Text(t.general.done)),
        ],
      );
    }
    if (_offer != null) return _offerContent();
    if (_loadingOffer) return _centerProgress(t.appClip.preparing);
    if (_invocationUrl != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(t.appClip.intro, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          SizedBox(
            width: 260,
            height: 260,
            child: PrettyQrView.data(
              data: _invocationUrl!,
              errorCorrectLevel: QrErrorCorrectLevel.Q,
              decoration: PrettyQrDecoration(
                shape: PrettyQrSmoothSymbol(roundFactor: 0, color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(_hostState.hceAvailable ? t.appClip.readyNfc : t.appClip.readyQr, textAlign: TextAlign.center),
          if (!_hostState.hceAvailable) ...[
            const SizedBox(height: 8),
            Text(t.appClip.nfcOptional, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
          ],
          const SizedBox(height: 16),
          Text(t.appClip.waiting, style: Theme.of(context).textTheme.bodySmall),
        ],
      );
    }
    return _centerProgress(_starting ? t.appClip.starting : t.appClip.waiting);
  }

  Widget _offerContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          _transferring ? t.appClip.receiving : t.appClip.offer(name: _offer!.info.alias, count: _files.length),
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: _files.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final file = _files[index];
              return ListTile(
                leading: Icon(file.display.fileType == FileType.image ? Icons.image_outlined : Icons.movie_outlined),
                title: Text(file.display.fileName, maxLines: 2, overflow: TextOverflow.ellipsis),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(file.display.size.asReadableFileSize),
                    if (file.phase == _DirectFilePhase.receiving) LinearProgressIndicator(value: file.progress),
                    if (file.phase == _DirectFilePhase.failed) Text(t.general.error, style: TextStyle(color: Theme.of(context).colorScheme.error)),
                  ],
                ),
                trailing: switch (file.phase) {
                  _DirectFilePhase.completed => const Icon(Icons.check_circle_outline),
                  _DirectFilePhase.failed => const Icon(Icons.error_outline),
                  _ => null,
                },
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        if (!_transferring && _files.any((file) => file.phase == _DirectFilePhase.failed))
          FilledButton.icon(onPressed: _retryFailed, icon: const Icon(Icons.refresh), label: Text(t.appClip.retryFailed))
        else if (!_transferring)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () async {
                  await _teardown(notifyPeer: true);
                  if (mounted) context.pop();
                },
                icon: const Icon(Icons.close),
                label: Text(t.general.decline),
              ),
              const SizedBox(width: 16),
              FilledButton.icon(onPressed: _accept, icon: const Icon(Icons.check), label: Text(t.general.accept)),
            ],
          ),
      ],
    );
  }

  Widget _centerProgress(String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 20),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}

extension on int {
  bool inRange(int minimum, int maximum) => this >= minimum && this <= maximum;
}
