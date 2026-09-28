import 'package:localsend_app/util/native/desktop_notifications.dart';
import 'package:test/test.dart';

void main() {
  test('decodes macOS and Linux actions using notification payload', () {
    expect(decodeDesktopRequestAction(payload: 'session-1', actionId: 'accept'), (sessionId: 'session-1', action: 'accept'));
    expect(decodeDesktopRequestAction(payload: 'session-1', actionId: 'decline'), (sessionId: 'session-1', action: 'decline'));
  });

  test('decodes Windows actions with the session in the action arguments', () {
    expect(decodeDesktopRequestAction(payload: 'session-1', actionId: 'accept:session-2'), (sessionId: 'session-2', action: 'accept'));
  });

  test('opens the request for a notification body click', () {
    expect(decodeDesktopRequestAction(payload: 'session-1', actionId: null), (sessionId: 'session-1', action: null));
    expect(decodeDesktopRequestAction(payload: 'session-1', actionId: 'session-1'), (sessionId: 'session-1', action: null));
  });

  test('ignores notifications without a session', () {
    expect(decodeDesktopRequestAction(payload: null, actionId: null), isNull);
    expect(decodeDesktopRequestAction(payload: null, actionId: 'accept:'), isNull);
  });
}
