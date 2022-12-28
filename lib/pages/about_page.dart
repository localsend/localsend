import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/widget/local_send_logo.dart';
import 'package:routerino/routerino.dart';
import 'package:url_launcher/url_launcher.dart';

final _body = '''
          LocalSend is an open source app to share files and messages between nearby devices using the local wifi network.
          There is no external server needed as the device itself is the server (peer-to-peer).
          
          Currently, this app is available on Android and iOS. More platforms will follow soon.
          '''.splitMapJoin(
  RegExp(r'^', multiLine: true),
  onMatch: (_) => '\n',
  onNonMatch: (n) => n.trim(),
);

class AboutPage extends StatelessWidget {
  const AboutPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.aboutPage.title),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 20),
          const LocalSendLogo(),
          const SizedBox(height: 5),
          Text(
            '© ${DateTime.now().year} Tien Do Nam',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(_body),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  launchUrl(Uri.parse('https://opensource.org/licenses/MIT'));
                },
                child: const Text('MIT License'),
              ),
              TextButton(
                onPressed: () {
                  launchUrl(Uri.parse('https://github.com/localsend/localsend'), mode: LaunchMode.externalApplication);
                },
                child: const Text('Source Code (Github)'),
              ),
              TextButton(
                onPressed: () {
                  context.push(() => const LicensePage());
                },
                child: const Text('License Notices'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
