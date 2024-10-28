/// A simple class that provides an id.
class IdProvider {
  int _id = 0;

  /// Returns the next id.
  /// This is an atomic operation because Dart's event loop is single-threaded.
  int getNextId() => _id++;

  /// Resets the id to 0.
  void reset() => _id = 0;
}
