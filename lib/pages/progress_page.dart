import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/file_status.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/file_speed_helper.dart';
import 'package:localsend_app/util/native/open_file.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/widget/custom_progress_bar.dart';
import 'package:localsend_app/widget/dialogs/cancel_session_dialog.dart';
import 'package:localsend_app/widget/dialogs/error_dialog.dart';
import 'package:localsend_app/widget/file_thumbnail.dart';
import 'package:routerino/routerino.dart';
import 'package:wakelock/wakelock.dart';

class ProgressPage extends ConsumerStatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends ConsumerState<ProgressPage> {
  int _totalBytes = double.maxFinite.toInt();
  int _lastRemainingTimeUpdate = 0; // millis since epoch
  String? _remainingTime;
  List<FileDto> _files = []; // also contains declined files (files without token)
  Set<String> _filesWithToken = {};

  bool _advanced = false;

  @override
  void initState() {
    super.initState();

    // init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        Wakelock.enable();
      } catch (_) {}

      final receiveSession = ref.read(serverProvider.select((state) => state?.session));
      if (receiveSession != null) {
        _files = receiveSession.files.values.map((f) => f.file).toList();
        _filesWithToken = receiveSession.files.values.where((f) => f.token != null).map((f) => f.file.id).toSet();
      } else {
        final sendSession = ref.read(sendProvider);
        if (sendSession != null) {
          _files = sendSession.files.values.map((f) => f.file).toList();
          _filesWithToken = sendSession.files.values.where((f) => f.token != null).map((f) => f.file.id).toSet();
        }
      }

      _totalBytes = _files.where((f) => _filesWithToken.contains(f.id)).fold(0, (prev, curr) => prev + curr.size);
    });
  }

  @override
  void dispose() {
    super.dispose();
    try {
      Wakelock.disable();
    } catch (_) {}
  }

  Future<bool> _askCancelConfirmation(SessionStatus status) async {
    final bool result = status == SessionStatus.sending ? await context.pushBottomSheet(() => const CancelSessionDialog()) : true;
    if (result) {
      final receiveSession = ref.read(serverProvider.select((s) => s?.session));
      final sendState = ref.read(sendProvider);

      if (receiveSession != null) {
        ref.read(serverProvider.notifier).cancelSession();
      } else if (sendState != null) {
        ref.read(sendProvider.notifier).cancelSession();
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final ProgressNotifier progressNotifier = ref.watch(progressProvider);
    final currBytes = _files.fold<int>(0, (prev, curr) => prev + ((progressNotifier.getProgress(curr.id) * curr.size).round()));

    final receiveSession = ref.watch(serverProvider.select((s) => s?.session));
    final sendSession = ref.watch(sendProvider);

    final SessionStatus? status = receiveSession?.status ?? sendSession?.status;
    if (status == null) {
      return Scaffold(
        body: Container(),
      );
    }

    final startTime = receiveSession?.startTime ?? sendSession?.startTime;
    final endTime = receiveSession?.endTime ?? sendSession?.endTime;
    final int? speedInBytes;
    if (startTime != null && currBytes >= 500 * 1024) {
      speedInBytes = getFileSpeed(start: startTime, end: endTime ?? DateTime.now().millisecondsSinceEpoch, bytes: currBytes);

      final now = DateTime.now().millisecondsSinceEpoch;
      if (now - _lastRemainingTimeUpdate >= 1000) {
        _remainingTime = getRemainingTime(bytesPerSeconds: speedInBytes, remainingBytes: _totalBytes - currBytes);
        _lastRemainingTimeUpdate = now;
      }
    } else {
      speedInBytes = null;
    }

    return WillPopScope(
      onWillPop: () => _askCancelConfirmation(status),
      child: Scaffold(
        body: Stack(
          children: [
            ListView.builder(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 20,
                bottom: 150,
                left: 15,
                right: 30,
              ),
              itemCount: _files.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // title
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receiveSession != null ? t.progressPage.titleReceiving : t.progressPage.titleSending,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        if (checkPlatformWithFileSystem() && receiveSession != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              '${t.settingsTab.receive.destination}: ${receiveSession.destinationDirectory}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                      ],
                    ),
                  );
                }

                final file = _files[index - 1];
                final String fileName = receiveSession?.files[file.id]?.desiredName ?? file.fileName;

                final fileStatus = receiveSession?.files[file.id]?.status ?? sendSession!.files[file.id]!.status;
                final savedToGallery = receiveSession?.files[file.id]?.savedToGallery ?? false;

                final String? filePath;
                if (receiveSession != null && fileStatus == FileStatus.finished && !savedToGallery) {
                  filePath = receiveSession.files[file.id]!.path;
                } else if (sendSession != null) {
                  filePath = sendSession.files[file.id]!.path;
                } else {
                  filePath = null;
                }

                final String? errorMessage;
                if (receiveSession != null) {
                  errorMessage = receiveSession.files[file.id]!.errorMessage;
                } else if (sendSession != null) {
                  errorMessage = sendSession.files[file.id]!.errorMessage;
                } else {
                  errorMessage = null;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: filePath != null && receiveSession != null ? () => openFile(context, file.fileType, filePath!) : null,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (sendSession != null && sendSession.files[file.id]?.asset != null)
                          // Special handling for assets
                          AssetThumbnail(
                            asset: sendSession.files[file.id]!.asset!,
                            fileType: file.fileType,
                          )
                        else
                          FilePathThumbnail(
                            path: filePath,
                            fileType: file.fileType,
                          ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      fileName,
                                      style: const TextStyle(fontSize: 16, height: 1),
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                  ),
                                  Text(' (${file.size.asReadableFileSize})', style: const TextStyle(fontSize: 16, height: 1)),
                                ],
                              ),
                              const SizedBox(height: 5),
                              if (fileStatus == FileStatus.sending)
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: CustomProgressBar(
                                    progress: progressNotifier.getProgress(file.id),
                                  ),
                                )
                              else
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        savedToGallery ? t.progressPage.savedToGallery : fileStatus.label,
                                        style: TextStyle(color: fileStatus.getColor(context), height: 1),
                                      ),
                                    ),
                                    if (errorMessage != null)
                                      ...[
                                        const SizedBox(width: 5),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) => ErrorDialog(error: errorMessage!),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5),
                                            child: Icon(Icons.info, color: Theme.of(context).colorScheme.warning, size: 20),
                                          ),
                                        ),
                                      ],
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            status.getLabel(
                              remainingTime: _remainingTime ?? '-',
                            ),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 5),
                          CustomProgressBar(
                            progress: _totalBytes == 0 ? 0 : currBytes / _totalBytes,
                            borderRadius: 5,
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                          ),
                          AnimatedCrossFade(
                            crossFadeState: _advanced ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 200),
                            alignment: Alignment.topLeft,
                            firstChild: Container(),
                            secondChild: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(t.progressPage.total.count(
                                    curr: progressNotifier.getFinishedCount(),
                                    n: _filesWithToken.length,
                                  )),
                                  Text(t.progressPage.total.size(
                                    curr: currBytes.asReadableFileSize,
                                    n: _totalBytes == double.maxFinite.toInt() ? '-' : _totalBytes.asReadableFileSize,
                                  )),
                                  if (speedInBytes != null)
                                    Text(t.progressPage.total.speed(
                                      speed: speedInBytes.asReadableFileSize,
                                    )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.onSurface),
                                onPressed: () {
                                  setState(() => _advanced = !_advanced);
                                },
                                icon: const Icon(Icons.info),
                                label: Text(_advanced ? t.general.hide : t.general.advanced),
                              ),
                              TextButton.icon(
                                style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.onSurface),
                                onPressed: () async {
                                  final result = await _askCancelConfirmation(status);
                                  if (result && mounted) {
                                    context.pushRootImmediately(() => const HomePage(appStart: false));
                                  }
                                },
                                icon: Icon(status == SessionStatus.sending ? Icons.close : Icons.check_circle),
                                label: Text(status == SessionStatus.sending ? t.general.cancel : t.general.done),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on FileStatus {
  String get label {
    switch (this) {
      case FileStatus.queue:
        return t.general.queue;
      case FileStatus.skipped:
        return t.general.skipped;
      case FileStatus.sending:
        return ''; // progress bar will be showed here
      case FileStatus.failed:
        return t.general.error;
      case FileStatus.finished:
        return t.general.done;
    }
  }

  Color getColor(BuildContext context) {
    switch (this) {
      case FileStatus.queue:
        return Theme.of(context).colorScheme.tertiaryContainer;
      case FileStatus.skipped:
        return Colors.grey;
      case FileStatus.sending:
        return Theme.of(context).colorScheme.tertiaryContainer;
      case FileStatus.failed:
        return Theme.of(context).colorScheme.warning;
      case FileStatus.finished:
        return Theme.of(context).colorScheme.tertiaryContainer;
    }
  }
}

extension on SessionStatus {
  String getLabel({required String remainingTime}) {
    switch (this) {
      case SessionStatus.sending:
        return t.progressPage.total.title.sending(
          time: remainingTime,
        );
      case SessionStatus.finished:
        return t.general.finished;
      case SessionStatus.finishedWithErrors:
        return t.progressPage.total.title.finishedError;
      case SessionStatus.canceledBySender:
        return t.progressPage.total.title.canceledSender;
      case SessionStatus.canceledByReceiver:
        return t.progressPage.total.title.canceledReceiver;
      default:
        print(this);
        return '';
    }
  }
}
