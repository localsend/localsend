import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/file_status.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/routes.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/file_speed_helper.dart';
import 'package:localsend_app/widget/custom_progress_bar.dart';

class ProgressPage extends ConsumerStatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends ConsumerState<ProgressPage> {
  int _totalBytes = double.maxFinite.toInt();
  List<FileDto> _files = []; // also contains declined files (files without token)
  Set<String> _filesWithToken = {};

  bool _advanced = false;

  @override
  void initState() {
    super.initState();

    // init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final receiveState = ref.read(serverProvider.select((state) => state?.receiveState));
      if (receiveState != null) {
        _files = receiveState.files.values.map((f) => f.file).toList();
        _filesWithToken = receiveState.files.values.where((f) => f.token != null).map((f) => f.file.id).toSet();
      } else {
        final sendState = ref.read(sendProvider);
        if (sendState != null) {
          _files = sendState.files.values.map((f) => f.file).toList();
          _filesWithToken = sendState.files.values.where((f) => f.token != null).map((f) => f.file.id).toSet();
        }
      }

      _totalBytes = _files.where((f) => _filesWithToken.contains(f.id)).fold(0, (prev, curr) => prev + curr.size);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProgressNotifier progressNotifier = ref.watch(progressProvider);
    final currBytes = _files.fold<int>(0, (prev, curr) => prev + ((progressNotifier.getProgress(curr.id) * curr.size).round()));

    final receiveState = ref.watch(serverProvider.select((s) => s?.receiveState));
    final sendState = ref.watch(sendProvider);

    final SessionStatus? status = receiveState?.status ?? sendState?.status;
    if (status == null) {
      return Scaffold(
        body: Container(),
      );
    }

    final startTime = receiveState?.startTime ?? sendState?.startTime;
    final endTime = receiveState?.endTime ?? sendState?.endTime;
    final int? speedInBytes;
    final String? remainingTime;
    if (startTime != null && currBytes >= 500 * 1024) {
      speedInBytes = getFileSpeed(start: startTime, end: endTime ?? DateTime.now().millisecondsSinceEpoch, bytes: currBytes);
      remainingTime = getRemainingTime(bytesPerSeconds: speedInBytes, remainingBytes: _totalBytes - currBytes);
    } else {
      speedInBytes = null;
      remainingTime = null;
    }

    return Scaffold(
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
                return Text(receiveState != null ? t.progressPage.titleReceiving : t.progressPage.titleSending, style: Theme.of(context).textTheme.headline6);
              }

              final file = _files[index - 1];
              final fileStatus = receiveState?.files[file.id]?.status ?? sendState!.files[file.id]!.status;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(file.fileType.icon, size: 46),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  file.fileName,
                                  style: const TextStyle(fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(' (${file.size.asReadableFileSize})', style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                          if (fileStatus == FileStatus.sending)
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomProgressBar(
                                progress: progressNotifier.getProgress(file.id),
                              ),
                            )
                          else
                            Text(fileStatus.label, style: TextStyle(color: fileStatus.getColor(context))),
                        ],
                      ),
                    ),
                  ],
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
                            t.progressPage.total.title(
                              time: endTime != null ? t.general.done : (remainingTime ?? '-'),
                            ),
                            style: const TextStyle(fontSize: 20)),
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
                              onPressed: () {
                                if (receiveState != null) {
                                  ref.read(serverProvider.notifier).closeSession();
                                } else if (sendState != null) {
                                  ref.read(sendProvider.notifier).cancel();
                                }
                                ref.read(progressProvider.notifier).reset();
                                const HomeRoute().go(context);
                              },
                              icon: const Icon(Icons.check_circle),
                              label: Text(t.general.done),
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
        return Colors.orange;
      case FileStatus.finished:
        return Theme.of(context).colorScheme.tertiaryContainer;
    }
  }
}
