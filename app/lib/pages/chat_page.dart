import 'package:common/model/device.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/state/chat/chat_message.dart';
import 'package:localsend_app/provider/network/chat_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

class ChatPage extends StatefulWidget {
  final Device device;

  const ChatPage({required this.device, super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with Refena {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  bool _canSend = false;
  bool _sending = false;
  int _lastMessageCount = 0;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      final canSend = _textController.text.trim().isNotEmpty;
      if (canSend != _canSend) {
        setState(() {
          _canSend = canSend;
        });
      }
    });

    ensureRef((ref) {
      ref.notifier(chatProvider).markAsRead(widget.device.fingerprint);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  Future<void> _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty || _sending) return;

    setState(() {
      _sending = true;
    });

    try {
      await ref.notifier(chatProvider).sendMessage(widget.device, text);
      // Only clear the input once the message was successfully sent so the
      // user can retry the same text after a network failure.
      _textController.clear();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.chatTab.messageFailed)),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _sending = false;
        });
      }
    }
  }

  String _formatTimestamp(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    // Only react to this device's conversation to avoid unnecessary rebuilds.
    final messages = context.watch(
          chatProvider.select((s) => s.messages[widget.device.fingerprint]),
        ) ??
        const <ChatMessage>[];
    final colorScheme = Theme.of(context).colorScheme;

    // Only auto-scroll when the message list actually grew — otherwise a
    // rebuild from unrelated state changes (e.g. typing in the text field)
    // would yank the scroll position back to the bottom and the user could
    // never read history.
    if (messages.length != _lastMessageCount) {
      _lastMessageCount = messages.length;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.chatTab.chatWith(name: widget.device.alias)),
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? Center(child: Text(t.chatTab.noMessages))
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isMine = message.isMine;

                      return Align(
                        alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          decoration: BoxDecoration(
                            color: isMine ? colorScheme.primary : colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.text,
                                style: TextStyle(
                                  color: isMine ? colorScheme.onPrimary : colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _formatTimestamp(message.timestamp),
                                style: TextStyle(
                                  fontSize: 11,
                                  color: isMine
                                      ? colorScheme.onPrimary.withValues(alpha: 0.7)
                                      : colorScheme.onSurface.withValues(alpha: 0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: t.chatTab.placeholder,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: (_canSend && !_sending) ? _sendMessage : null,
                    icon: _sending
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
