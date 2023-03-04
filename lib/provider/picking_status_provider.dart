import 'package:flutter_riverpod/flutter_riverpod.dart';

/// True, if picking
/// False, if not picking
final pickingStatusProvider = StateProvider<bool>((ref) => false);
