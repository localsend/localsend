import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(t.chatTab.startChat),
    );
  }
}
