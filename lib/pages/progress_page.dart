import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/routes.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/widget/device_bage.dart';
import 'package:localsend_app/widget/list_tile/custom_list_tile.dart';

class ProgressPage extends ConsumerStatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends ConsumerState<ProgressPage> {
  int _totalBytes = double.maxFinite.toInt();
  List<FileDto> _files = []; // also contains declined files (files without token)
  Set<String> _filesWithToken = {};

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

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: MediaQuery.of(context).padding.top + 20),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final file = _files[index];
                      final progress = progressNotifier.getProgress(file.id);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.description, size: 46),
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
                                  if (progress == 1)
                                    Text(t.general.done, style: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer))
                                  else
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5, right: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: LinearProgressIndicator(
                                          value: progress,
                                          minHeight: 10,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: _files.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 150),
              ),
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: CustomListTile(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
                  title: Text(t.progressPage.title.total, style: const TextStyle(fontSize: 20)),
                  subTitle: Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      DeviceBadge(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        label: t.progressPage.title.count(
                          curr: progressNotifier.getFinishedCount(),
                          n: _filesWithToken.length,
                        ),
                      ),
                      DeviceBadge(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        label: t.progressPage.title.size(
                          curr: currBytes.asReadableFileSize,
                          n: _totalBytes == double.maxFinite.toInt() ? '-' : _totalBytes.asReadableFileSize,
                        ),
                      ),
                    ],
                  ),
                  trailing: status == SessionStatus.finished
                      ? TextButton.icon(
                          onPressed: () {
                            if (receiveState != null) {
                              ref.read(serverProvider.notifier).closeSession();
                              ref.read(progressProvider.notifier).reset();
                              const HomeRoute().go(context);
                            }
                          },
                          icon: const Icon(Icons.check_circle),
                          label: Text(t.general.done),
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
