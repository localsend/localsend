import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

const _methodChannel = MethodChannel('org.localsend.localsend_ng/localsend');
final _logger = Logger('CompanionDevice');

class CompanionAssociation {
  final int id;
  final String deviceName;
  final String deviceAddress;

  CompanionAssociation({required this.id, required this.deviceName, required this.deviceAddress});
}

Future<CompanionAssociation?> companionAssociate() async {
  if (defaultTargetPlatform != TargetPlatform.android) return null;
  try {
    final result = await _methodChannel.invokeMethod<Map>('companion_associate');
    if (result == null) return null;
    return CompanionAssociation(
      id: result['id'] as int? ?? -1,
      deviceName: result['deviceName'] as String? ?? 'Unknown',
      deviceAddress: '',
    );
  } on PlatformException catch (e) {
    _logger.warning('companion_associate failed: ${e.message}');
    return null;
  }
}

Future<List<CompanionAssociation>> companionGetAssociations() async {
  if (defaultTargetPlatform != TargetPlatform.android) return [];
  try {
    final result = await _methodChannel.invokeMethod<List>('companion_getAssociations');
    if (result == null) return [];
    return result.map((item) {
      final map = item as Map;
      return CompanionAssociation(
        id: map['id'] as int? ?? -1,
        deviceName: map['deviceName'] as String? ?? 'Unknown',
        deviceAddress: map['deviceAddress'] as String? ?? '',
      );
    }).toList();
  } on PlatformException catch (e) {
    _logger.warning('companion_getAssociations failed: ${e.message}');
    return [];
  }
}

Future<bool> companionDisassociate(int id) async {
  if (defaultTargetPlatform != TargetPlatform.android) return false;
  try {
    await _methodChannel.invokeMethod('companion_disassociate', {'id': id});
    return true;
  } on PlatformException catch (e) {
    _logger.warning('companion_disassociate failed: ${e.message}');
    return false;
  }
}

Future<bool> companionStartObserving() async {
  if (defaultTargetPlatform != TargetPlatform.android) return false;
  try {
    await _methodChannel.invokeMethod('companion_startObserving');
    return true;
  } on PlatformException catch (e) {
    _logger.warning('companion_startObserving failed: ${e.message}');
    return false;
  }
}
