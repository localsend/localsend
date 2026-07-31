import 'dart:io';
import 'package:localsend_app/util/native/channel/android_channel.dart';

Future<bool> getSystemAnimationsStatus() async {
  if (Platform.isAndroid) {
    return await getSystemAnimationsStatusAndroid();
  }
  return true;
}
