import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
