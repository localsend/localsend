import 'package:common/model/device.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';

class ChatPage extends StatefulWidget {
  final Device device;

  const ChatPage({required this.device, super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.chatTab.chatWith(name: widget.device.alias)),
      ),
      body: Center(
        child: Text(t.chatTab.noMessages),
      ),
    );
  }
}
