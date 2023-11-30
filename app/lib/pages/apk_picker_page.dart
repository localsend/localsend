import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/provider/apk_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/native/cross_file_converters.dart';
import 'package:localsend_app/util/ui/nav_bar_padding.dart';
import 'package:localsend_app/widget/file_thumbnail.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_app/widget/sliver/sliver_pinned_header.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

class ApkPickerPage extends StatefulWidget {
  const ApkPickerPage({super.key});

  @override
  State<ApkPickerPage> createState() => _ApkPickerPageState();
}

class _ApkPickerPageState extends State<ApkPickerPage> with Refena {
  final _textController = TextEditingController();

  void _pickApp(Application app) {
    // ignore: discarded_futures
    ref.redux(selectedSendingFilesProvider).dispatchAsync(AddFilesAction(files: [app], converter: CrossFileConverters.convertApplication));
    context.pop();
  }

  @override
  void dispose() {
    _textController.dispose();
    ref.dispose(apkSearchParamProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apkParams = ref.watch(apkSearchParamProvider);
    final apkAsync = ref.watch(apkProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.apkPickerPage.title),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              CheckedPopupMenuItem<int>(
                value: 0,
                checked: !apkParams.includeSystemApps,
                child: Text(t.apkPickerPage.excludeSystemApps),
              ),
              CheckedPopupMenuItem<int>(
                value: 1,
                checked: apkParams.onlyAppsWithLaunchIntent,
                child: Text(t.apkPickerPage.excludeAppsWithoutLaunchIntent),
              ),
            ];
          }, onSelected: (value) {
            switch (value) {
              case 0:
                ref.notifier(apkSearchParamProvider).setState((old) => old.copyWith(includeSystemApps: !old.includeSystemApps));
                break;
              case 1:
                ref.notifier(apkSearchParamProvider).setState((old) => old.copyWith(onlyAppsWithLaunchIntent: !old.onlyAppsWithLaunchIntent));
                break;
            }
          }),
        ],
      ),
      body: ResponsiveListView.single(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        tabletPadding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverPinnedHeader(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _textController,
                  autofocus: true,
                  onChanged: (s) {
                    ref.notifier(apkSearchParamProvider).setState((old) => old.copyWith(query: s));
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    fillColor: ElevationOverlay.applySurfaceTint(
                      Theme.of(context).inputDecorationTheme.fillColor!,
                      Theme.of(context).colorScheme.surfaceTint,
                      3,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: apkParams.query.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              ref.notifier(apkSearchParamProvider).setState((old) => old.copyWith(query: ''));
                              _textController.clear();
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : Text(apkParams.query),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(t.apkPickerPage.apps(n: apkAsync.data?.length ?? 0)),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            apkAsync.when(
              data: (appList) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: appList.length,
                    (context, index) {
                      final app = appList[index];
                      final thumbnail = (app as ApplicationWithIcon).icon;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          onTap: () => _pickApp(app),
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              MemoryThumbnail(
                                bytes: thumbnail,
                                size: 60,
                                fileType: FileType.apk,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      app.appName,
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                    Consumer(
                                      builder: (context, ref) {
                                        final appSize = ref.watch(apkSizeProvider(app.apkFilePath));
                                        final appSizeString = appSize.maybeWhen(
                                          data: (size) => '${size.asReadableFileSize} • ',
                                          orElse: () => '',
                                        );
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '$appSizeString${app.versionName != null ? 'v${app.versionName}' : ''}',
                                              style: Theme.of(context).textTheme.bodySmall,
                                            ),
                                            Text(
                                              app.packageName,
                                              style: Theme.of(context).textTheme.bodySmall,
                                            ),
                                          ],
                                        );
                                      },
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
                );
              },
              error: (e, st) {
                return SliverToBoxAdapter(child: Text('Error: $e\n$st'));
              },
              loading: () {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: getNavBarPadding(context) + 30), // handle navigation bar + some additional padding
            ),
          ],
        ),
      ),
    );
  }
}
