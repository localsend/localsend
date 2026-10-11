Future<void> sleepAsync(int millis) {
  return Future.delayed(Duration(milliseconds: millis), () {});
}
