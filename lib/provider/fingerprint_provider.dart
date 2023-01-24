import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

/// The fingerprint is used to avoid self-discovering.
/// It is not persisted and therefore may differ between app starts.
final fingerprintProvider = Provider((_) => const Uuid().v4());
