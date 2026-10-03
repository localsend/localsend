import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // https://github.com/localsend/localsend/issues/3481
  //
  // On Linux, Flutter reports the NumLock state among the pressed keys. A
  // LogicalKeySet matches only on exact set equality, so with NumLock enabled
  // every binding registered that way stops firing. SingleActivator matches on
  // trigger + modifiers and ignores the lock state by default.
  //
  // Each key gets its own physical key: HardwareKeyboard tracks pressed state per
  // physical key, so reusing one would assert. LogicalKeyboardKey has no
  // primitive equality, so the map cannot be const.
  final physicalKeys = <LogicalKeyboardKey, PhysicalKeyboardKey>{
    LogicalKeyboardKey.numLock: PhysicalKeyboardKey.numpad0,
    LogicalKeyboardKey.controlLeft: PhysicalKeyboardKey.controlLeft,
    LogicalKeyboardKey.keyV: PhysicalKeyboardKey.keyV,
    LogicalKeyboardKey.escape: PhysicalKeyboardKey.escape,
  };

  final keyboard = HardwareKeyboard.instance;
  final pressedKeys = <LogicalKeyboardKey, PhysicalKeyboardKey>{};

  /// Presses exactly [keys], releasing anything held before.
  void press(Set<LogicalKeyboardKey> keys) {
    for (final entry in pressedKeys.entries.toList()) {
      keyboard.handleKeyEvent(
        KeyUpEvent(
          physicalKey: entry.value,
          logicalKey: entry.key,
          timeStamp: Duration.zero,
        ),
      );
      pressedKeys.remove(entry.key);
    }
    for (final key in keys) {
      final physical = physicalKeys[key]!;
      keyboard.handleKeyEvent(
        KeyDownEvent(
          physicalKey: physical,
          logicalKey: key,
          timeStamp: Duration.zero,
        ),
      );
      pressedKeys[key] = physical;
    }
  }

  setUp(() => press(const {}));
  tearDown(() => press(const {}));

  KeyEvent down(LogicalKeyboardKey logical) => KeyDownEvent(
    physicalKey: physicalKeys[logical]!,
    logicalKey: logical,
    timeStamp: Duration.zero,
  );

  test('Ctrl+V accepts while NumLock is held, unlike LogicalKeySet', () {
    press({LogicalKeyboardKey.numLock, LogicalKeyboardKey.controlLeft, LogicalKeyboardKey.keyV});
    final event = down(LogicalKeyboardKey.keyV);

    expect(
      const SingleActivator(LogicalKeyboardKey.keyV, control: true).accepts(event, keyboard),
      isTrue,
      reason: 'SingleActivator must ignore the NumLock state',
    );

    expect(
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyV).accepts(event, keyboard),
      isFalse,
      reason: 'documents the bug: LogicalKeySet requires exact set equality, which is what rejected the shortcut',
    );
  });

  test('Escape accepts while NumLock is held, unlike LogicalKeySet', () {
    press({LogicalKeyboardKey.numLock, LogicalKeyboardKey.escape});
    final event = down(LogicalKeyboardKey.escape);

    expect(const SingleActivator(LogicalKeyboardKey.escape).accepts(event, keyboard), isTrue);
    expect(LogicalKeySet(LogicalKeyboardKey.escape).accepts(event, keyboard), isFalse);
  });

  test('SingleActivator still requires the modifier it declares', () {
    press({LogicalKeyboardKey.keyV});
    final event = down(LogicalKeyboardKey.keyV);

    expect(const SingleActivator(LogicalKeyboardKey.keyV, control: true).accepts(event, keyboard), isFalse);
  });
}
