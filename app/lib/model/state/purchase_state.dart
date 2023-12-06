import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';

part 'purchase_state.mapper.dart';

enum PurchaseItem {
  donate5(
    androidId: 'localsend_android_donate_5',
    iosId: 'localsend_ios_donate_5',
  ),
  donate10(
    androidId: 'localsend_android_donate_10',
    iosId: 'localsend_ios_donate_10',
  ),
  donate20(
    androidId: 'localsend_android_donate_20',
    iosId: 'localsend_ios_donate_20',
  ),
  donate50(
    androidId: 'localsend_android_donate_50',
    iosId: 'localsend_ios_donate_50',
  );

  const PurchaseItem({
    required this.androidId,
    required this.iosId,
  });

  final String androidId;
  final String iosId;

  String get platformProductId => defaultTargetPlatform == TargetPlatform.android ? androidId : iosId;
}

@MappableClass()
class PurchaseState with PurchaseStateMappable {
  final Map<PurchaseItem, String> prices;
  final Set<PurchaseItem> purchases;
  final bool pending;

  const PurchaseState({
    required this.prices,
    required this.purchases,
    required this.pending,
  });
}
