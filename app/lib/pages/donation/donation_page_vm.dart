import 'package:localsend_app/model/state/purchase_state.dart';
import 'package:localsend_app/provider/purchase_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

class DonationPageVm {
  final Map<PurchaseItem, String> prices;
  final Set<PurchaseItem> purchased;
  final bool pending;
  final void Function(PurchaseItem item) purchase;
  final void Function() restore;

  DonationPageVm({
    required this.prices,
    required this.purchased,
    required this.pending,
    required this.purchase,
    required this.restore,
  });
}

final donationPageVmProvider = ViewProvider<DonationPageVm>((ref) {
  final state = ref.watch(purchaseProvider);
  return DonationPageVm(
    prices: state.prices,
    purchased: state.purchases.keys.toSet(),
    pending: state.pending,
    purchase: (item) => ref.redux(purchaseProvider).dispatchAsync(PurchaseAction(item)),
    restore: () => ref.redux(purchaseProvider).dispatchAsync(PurchaseRestoreAction()),
  );
});
