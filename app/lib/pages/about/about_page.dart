import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/debug/debug_page.dart';
import 'package:localsend_app/widget/local_send_logo.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:routerino/routerino.dart';
import 'package:url_launcher/url_launcher.dart';

part 'contributors.dart';

part 'translators.dart';

class AboutPage extends StatelessWidget {
  const AboutPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.aboutPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 20),
          const LocalSendLogo(withText: true),
          Text(
            '© ${DateTime.now().year} Tien Do Nam',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () async {
                await launchUrl(Uri.parse('https://localsend.org'));
              },
              child: const Text('localsend.org'),
            ),
          ),
          Text(t.aboutPage.description.join('\n\n')),
          const SizedBox(height: 20),
          Text(t.aboutPage.author, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Text('Tien Do Nam (@Tienisto)'),
          const SizedBox(height: 20),
          Text(t.aboutPage.contributors, style: const TextStyle(fontWeight: FontWeight.bold)),
          ..._contributors.map((e) => Text(e)),
          const SizedBox(height: 20),
          Text(t.aboutPage.translators, style: const TextStyle(fontWeight: FontWeight.bold)),
          Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            children: [
              ..._translators.entries.map(
                (e) => TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(e.key.translations.locale),
                    ),
                    Text(e.value.join('\n')),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () async {
                  await launchUrl(Uri.parse('https://localsend.org'));
                },
                child: const Text('Homepage'),
              ),
              TextButton(
                onPressed: () async {
                  await launchUrl(Uri.parse('https://github.com/localsend/localsend'), mode: LaunchMode.externalApplication);
                },
                child: const Text('Source Code (Github)'),
              ),
              TextButton(
                onPressed: () async {
                  await launchUrl(Uri.parse('https://opensource.org/licenses/MIT'));
                },
                child: const Text('MIT License'),
              ),
              TextButton(
                onPressed: () async {
                  await context.push(() => const LicensePage());
                },
                child: const Text('License Notices'),
              ),
              TextButton(
                onPressed: () async {
                  await context.push(() => const DebugPage());
                },
                child: const Text('Debugging'),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
