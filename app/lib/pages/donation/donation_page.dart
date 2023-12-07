import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/state/purchase_state.dart';
import 'package:localsend_app/pages/donation/donation_page_vm.dart';
// [FOSS_REMOVE_START]
import 'package:localsend_app/provider/purchase_provider.dart';
// [FOSS_REMOVE_END]
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder(
      provider: donationPageVmProvider,
      // [FOSS_REMOVE_START]
      init: (context, ref) => ref.redux(purchaseProvider).dispatchAsync(FetchPricesAndPurchasesAction()), // ignore: discarded_futures
      // [FOSS_REMOVE_END]
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text(t.donationPage.title),
          ),
          body: Stack(
            children: [
              ResponsiveListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Text(
                      t.donationPage.info,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  if (vm.purchased.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Text(
                          t.donationPage.thanks,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  if (vm.platformSupportPayment) _StoreDonation(vm) else const _LinkDonation(),
                ],
              ),
              if (vm.pending)
                Container(
                  color: Colors.black.withOpacity(0.1),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _StoreDonation extends StatelessWidget {
  final DonationPageVm vm;

  const _StoreDonation(this.vm);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...PurchaseItem.values.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FilledButton.icon(
              onPressed: vm.purchased.contains(item) ? null : () => vm.purchase(item),
              icon: const Icon(Icons.favorite),
              label: Text(t.donationPage.donate(amount: vm.prices[item] ?? '...')),
            ),
          );
        }),
        const SizedBox(height: 20),
        TextButton.icon(
          onPressed: vm.restore,
          icon: const Icon(Icons.restore),
          label: Text(t.donationPage.restore),
        ),
      ],
    );
  }
}

class _LinkDonation extends StatelessWidget {
  const _LinkDonation();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () async {
            await launchUrl(Uri.parse('https://github.com/sponsors/Tienisto'), mode: LaunchMode.externalApplication);
          },
          icon: const Icon(Icons.open_in_new),
          label: const Text('Github'),
        ),
        TextButton.icon(
          onPressed: () async {
            await launchUrl(Uri.parse('https://ko-fi.com/tienisto'), mode: LaunchMode.externalApplication);
          },
          icon: const Icon(Icons.open_in_new),
          label: const Text('Ko-fi'),
        ),
      ],
    );
  }
}
