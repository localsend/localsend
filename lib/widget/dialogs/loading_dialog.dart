import 'package:flutter/material.dart';
import 'package:localsend_app/provider/picking_status_provider.dart';
import 'package:riverpie_flutter/riverpie_flutter.dart';
import 'package:routerino/routerino.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  void _onPickingStatusChanged(bool? prev, bool next) {
    if (!next) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    context.ref.watch(pickingStatusProvider, listener: _onPickingStatusChanged);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
