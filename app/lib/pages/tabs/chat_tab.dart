import 'dart:async';

import 'package:common/model/device.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/chat_page.dart';
import 'package:localsend_app/provider/network/chat_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    final nearbyDevicesState = context.watch(nearbyDevicesProvider);
    final chatState = context.watch(chatProvider);

    // Chat is only implemented on the v2 route, so v1.0 legacy peers cannot
    // receive messages. Filter them out so users don't hit silent 404s.
    final devices = nearbyDevicesState.devices.values.where((d) => d.version != '1.0').toList();

    if (devices.isEmpty) {
      return Center(
        child: Text(t.chatTab.startChat),
      );
    }

    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
        final messages = chatState.messages[device.fingerprint];
        final lastMessage = messages != null && messages.isNotEmpty ? messages.last.text : null;
        final unread = chatState.unreadCountFor(device.fingerprint);

        return ListTile(
          leading: Icon(_deviceTypeIcon(device.deviceType)),
          title: Text(device.alias),
          subtitle: lastMessage != null ? Text(lastMessage, maxLines: 1, overflow: TextOverflow.ellipsis) : null,
          trailing: unread > 0
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    unread > 99 ? '99+' : unread.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : null,
          onTap: () {
            unawaited(context.push(() => ChatPage(device: device)));
          },
        );
      },
    );
  }

  IconData _deviceTypeIcon(DeviceType type) {
    switch (type) {
      case DeviceType.mobile:
        return Icons.smartphone;
      case DeviceType.desktop:
        return Icons.computer;
      case DeviceType.web:
        return Icons.language;
      case DeviceType.headless:
        return Icons.dns;
      case DeviceType.server:
        return Icons.storage;
    }
  }
}
