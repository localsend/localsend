import 'package:localsend_isolates/constants.dart';

const sendConcurrencyOptions = [1, 2, 3, 4, 5];

/// A stored value can be absent or out of range, and it ends up in a [Pool]
/// which throws for anything below one.
int sanitizeSendConcurrency(int? storedConcurrency) {
  if (storedConcurrency == null) {
    return defaultSendConcurrency;
  }
  if (!sendConcurrencyOptions.contains(storedConcurrency)) {
    return defaultSendConcurrency;
  }
  return storedConcurrency;
}
