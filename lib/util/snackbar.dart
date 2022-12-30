import 'package:flutter/material.dart';

extension SnackbarExt on BuildContext {
  void showSnackBar(String text) {
    final scaffold = ScaffoldMessenger.of(this);
    scaffold.removeCurrentSnackBar();
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
