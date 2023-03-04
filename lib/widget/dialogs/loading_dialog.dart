import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/picking_status_provider.dart';
import 'package:routerino/routerino.dart';

class LoadingDialog extends ConsumerStatefulWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends ConsumerState<LoadingDialog> {

  void _onPickingStatusChanged(bool? prev, bool next) {
    if (!next) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(pickingStatusProvider, _onPickingStatusChanged);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
