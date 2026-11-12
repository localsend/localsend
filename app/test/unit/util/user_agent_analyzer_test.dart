import 'package:localsend_app/provider/network/server/controller/send_controller.dart' show parseDeviceInfoFromUserAgent;
import 'package:localsend_app/util/user_agent_analyzer.dart';
import 'package:test/test.dart';

void main() {
  final analyzer = UserAgentAnalyzer();

  group('UserAgentAnalyzer', () {
    test('identifies Edge on Windows before Chrome', () {
      const userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0';
      expect(analyzer.getBrowser(userAgent), 'Edge');
      expect(parseDeviceInfoFromUserAgent(userAgent), 'Edge (Windows)');
    });

    test('identifies Edge on Android before Chrome', () {
      const userAgent =
          'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36 EdgA/120.0.0.0';
      expect(analyzer.getBrowser(userAgent), 'Edge');
      expect(parseDeviceInfoFromUserAgent(userAgent), 'Edge (Android)');
    });

    test('identifies Edge on iOS and legacy Windows', () {
      const iphone =
          'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 EdgiOS/120.0.6099.119 Mobile/15E148 Safari/604.1';
      const windows =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.19582';
      expect(analyzer.getBrowser(iphone), 'Edge');
      expect(parseDeviceInfoFromUserAgent(iphone), 'Edge (iOS)');
      expect(analyzer.getBrowser(windows), 'Edge');
      expect(parseDeviceInfoFromUserAgent(windows), 'Edge (Windows)');
    });

    test('does not mistake an Android model name for the Edge browser', () {
      const userAgent = 'Mozilla/5.0 (Linux; Android 11; Edge 20) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Mobile Safari/537.36';
      expect(analyzer.getBrowser(userAgent), 'Chrome');
      expect(parseDeviceInfoFromUserAgent(userAgent), 'Chrome (Android)');
    });

    test('preserves Chrome on Windows and Android', () {
      const windows = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36';
      const android = 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36';
      expect(analyzer.getBrowser(windows), 'Chrome');
      expect(parseDeviceInfoFromUserAgent(windows), 'Chrome (Windows)');
      expect(analyzer.getBrowser(android), 'Chrome');
      expect(parseDeviceInfoFromUserAgent(android), 'Chrome (Android)');
    });

    test('preserves Firefox on Linux', () {
      const userAgent = 'Mozilla/5.0 (X11; Linux x86_64; rv:120.0) Gecko/20100101 Firefox/120.0';
      expect(analyzer.getBrowser(userAgent), 'Firefox');
      expect(parseDeviceInfoFromUserAgent(userAgent), 'Firefox (Linux)');
    });

    test('preserves Safari on macOS and iOS', () {
      const mac = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Safari/605.1.15';
      const iphone =
          'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1';
      expect(analyzer.getBrowser(mac), 'Safari');
      expect(parseDeviceInfoFromUserAgent(mac), 'Safari (macOS)');
      expect(analyzer.getBrowser(iphone), 'Safari');
      expect(parseDeviceInfoFromUserAgent(iphone), 'Safari (iOS)');
    });

    test('preserves unknown and missing user agents', () {
      expect(analyzer.getBrowser('UnknownBrowser/1.0'), null);
      expect(parseDeviceInfoFromUserAgent('UnknownBrowser/1.0'), 'Unknown');
      expect(analyzer.getBrowser(''), null);
      expect(parseDeviceInfoFromUserAgent(''), 'Unknown');
      expect(parseDeviceInfoFromUserAgent(null), 'Unknown');
    });
  });
}
