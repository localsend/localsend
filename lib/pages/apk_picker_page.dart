import 'dart:async';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/provider/apk_provider.dart';
import 'package:localsend_app/provider/param/apk_provider_param.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/ui/nav_bar_padding.dart';
import 'package:localsend_app/widget/file_thumbnail.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_app/widget/sliver/sliver_pinned_header.dart';
import 'package:routerino/routerino.dart';

class ApkPickerPage extends ConsumerStatefulWidget {
  const ApkPickerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ApkPickerPage> createState() => _ApkPickerPageState();
}

class _ApkPickerPageState extends ConsumerState<ApkPickerPage> {
  String _query = '';
  bool _includeSystemApps = false;
  bool _onlyAppsWithLaunchIntent = true;

  @override
  Widget build(BuildContext context) {
    final apkAsync = ref.watch(apkProvider(ApkProviderParam(
      query: _query,
      includeSystemApps: _includeSystemApps,
      onlyAppsWithLaunchIntent: _onlyAppsWithLaunchIntent,
    )));

    return Scaffold(
      appBar: AppBar(
        title: Text(t.apkPickerPage.title),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) {
            return [
              CheckedPopupMenuItem<int>(
                value: 0,
                checked: !_includeSystemApps,
                child: Text(t.apkPickerPage.excludeSystemApps),
              ),
              CheckedPopupMenuItem<int>(
                value: 1,
                checked: _onlyAppsWithLaunchIntent,
                child: Text(t.apkPickerPage.excludeAppsWithoutLaunchIntent),
              ),
            ];
          }, onSelected: (value) {
            switch(value) {
              case 0:
                setState(() => _includeSystemApps = !_includeSystemApps);
                break;
              case 1:
                setState(() => _onlyAppsWithLaunchIntent = !_onlyAppsWithLaunchIntent);
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
                child: TextField(
                  autofocus: true,
                  onChanged: (s) {
                    setState(() => _query = s);
                  },
                  decoration: InputDecoration(
                    fillColor: ElevationOverlay.applySurfaceTint(
                      Theme.of(context).inputDecorationTheme.fillColor!,
                      Theme.of(context).colorScheme.surfaceTint,
                      3,
                    ),
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(t.apkPickerPage.apps(n: apkAsync.value?.length ?? 0)),
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
                          onTap: () {
                            unawaited(
                              ref.read(selectedSendingFilesProvider.notifier).addFiles(files: [app], converter: CrossFileConverters.convertApplication),
                            );
                            context.pop();
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              MemoryThumbnail(
                                bytes: thumbnail,
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
                                      builder: (context, ref, _) {
                                        final appSize = ref.watch(apkSizeProvider(app.apkFilePath));
                                        final appSizeString = appSize.maybeWhen(
                                          data: (size) => '${size.asReadableFileSize} - ',
                                          orElse: () => '',
                                        );
                                        return Text(
                                          '$appSizeString${app.versionName ?? '?'} - ${app.packageName}',
                                          style: Theme.of(context).textTheme.bodySmall,
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
