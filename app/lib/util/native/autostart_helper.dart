const startHiddenFlag = '--hidden';

Future<bool> enableAutoStart({required bool startHidden}) async {
  return false;
}

Future<bool> disableAutoStart() async {
  return true;
}

Future<bool> isAutoStartEnabled() async {
  return false;
}

Future<bool> isAutoStartHidden() async {
  return false;
}
