import 'package:flutter/material.dart';
import 'package:localsend_app/widget/clipboard_sharing_widget.dart';

class ClipboardTab extends StatelessWidget {
  const ClipboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipboardSharingWidget(),
        ],
      ),
    );
  }
}
