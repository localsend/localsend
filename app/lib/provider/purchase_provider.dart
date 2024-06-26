import 'dart:async';

import 'package:collection/collection.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:localsend_app/model/state/purchase_state.dart';
import 'package:refena_flutter/refena_flutter.dart';

final purchaseProvider = ReduxProvider<PurchaseService, PurchaseState>((ref) {
  return PurchaseService();
});

class PurchaseService extends ReduxNotifier<PurchaseState> {
  @override
  PurchaseState init() => const PurchaseState(
        prices: {},
        purchases: {},
        pending: false,
      );
}

class InitPurchaseStream extends AsyncReduxAction<PurchaseService, PurchaseState> {
  final listening = Completer<void>();

  @override
  Future<PurchaseState> reduce() async {
    Future.delayed(Duration.zero, () => listening.complete());
    await for (final event in InAppPurchase.instance.purchaseStream) {
      for (final purchase in event) {
        await dispatchAsync(_HandlePurchaseUpdate(purchase));
      }
    }
    return state;
  }
}

class FetchPricesAndPurchasesAction extends AsyncReduxAction<PurchaseService, PurchaseState> {
  @override
  Future<PurchaseState> reduce() async {
    if (state.prices.isNotEmpty) {
      emitMessage('Already fetched');
      return state;
    }

    try {
      await dispatchAsync(FetchPricesAction());
    } catch (_) {}

    try {
      await dispatchAsync(PurchaseRestoreAction());
    } catch (_) {}
    return state;
  }
}

/// Fetches prices for all products.
/// They come from the platform's store and vary by country.
class FetchPricesAction extends AsyncReduxAction<PurchaseService, PurchaseState> {
  @override
  Future<PurchaseState> reduce() async {
    final response = await InAppPurchase.instance.queryProductDetails(PurchaseItem.values.map((e) => e.platformProductId).toSet());
    final priceMap = <PurchaseItem, String>{};
    for (final product in response.productDetails) {
      final item = PurchaseItem.values.firstWhereOrNull((e) => e.platformProductId == product.id);
      if (item == null) {
        continue;
      }
      priceMap[item] = product.price;
    }
    return state.copyWith(
      prices: priceMap,
    );
  }
}

/// Handles the update information triggered by the purchase flow of the platform.
class _HandlePurchaseUpdate extends AsyncReduxAction<PurchaseService, PurchaseState> {
  final PurchaseDetails purchase;

  _HandlePurchaseUpdate(this.purchase);

  @override
  bool get trackOrigin => false;

  @override
  Future<PurchaseState> reduce() async {
    if (purchase.status == PurchaseStatus.pending) {
      return state.copyWith(pending: true);
    } else {
      dispatch(_SetPendingAction(false));
    }

    if (purchase.status == PurchaseStatus.error) {
      // ignore: avoid_print
      throw 'Error purchasing: ${purchase.error?.message}';
    } else if (purchase.status == PurchaseStatus.purchased || purchase.status == PurchaseStatus.restored) {
      final purchaseEnum = PurchaseItem.values.firstWhereOrNull((element) => element.platformProductId == purchase.productID);
      if (purchaseEnum == null) {
        throw 'Unknown product ID: ${purchase.productID}';
      }
      dispatch(AddPurchaseAction(purchaseEnum, purchase));
    }

    if (purchase.pendingCompletePurchase) {
      // No need to verify. It's just a donation...
      await InAppPurchase.instance.completePurchase(purchase);
    }

    return state;
  }

  @override
  String get debugLabel => 'HandlePurchaseUpdate(${purchase.status}, ${purchase.productID})';
}

class AddPurchaseAction extends ReduxAction<PurchaseService, PurchaseState> {
  final PurchaseItem item;
  final PurchaseDetails purchase;

  AddPurchaseAction(this.item, this.purchase);

  @override
  PurchaseState reduce() {
    return state.copyWith(
      purchases: {
        ...state.purchases,
        item,
      },
    );
  }
}

class _SetPendingAction extends ReduxAction<PurchaseService, PurchaseState> {
  final bool pending;

  _SetPendingAction(this.pending);

  @override
  PurchaseState reduce() => state.copyWith(pending: pending);
}

/// Action to restore purchases.
/// Dispatched on first app start or manually by the user.
class PurchaseRestoreAction extends AsyncReduxAction<PurchaseService, PurchaseState> {
  @override
  Future<PurchaseState> reduce() async {
    try {
      await InAppPurchase.instance.restorePurchases();
    } catch (_) {}
    return state;
  }
}

/// Action to reset the purchase state.
/// Only used for testing.
class PurchaseResetAction extends ReduxAction<PurchaseService, PurchaseState> {
  @override
  PurchaseState reduce() => state.copyWith(
        purchases: {},
        pending: false,
      );
}

/// Initiate the purchase flow for a product.
/// The actual callbacks are handled by [_HandlePurchaseUpdate].
class PurchaseAction extends AsyncReduxAction<PurchaseService, PurchaseState> {
  final PurchaseItem item;

  PurchaseAction(this.item);

  @override
  Future<PurchaseState> reduce() async {
    final response = await InAppPurchase.instance.queryProductDetails(<String>{item.platformProductId});
    final productDetails = response.productDetails.firstOrNull;
    if (productDetails == null) {
      throw Exception('Product not found: ${item.platformProductId}');
    }

    // TODO: Handle changing subscriptions if subscriptions would be added
    await InAppPurchase.instance.buyNonConsumable(
      purchaseParam: PurchaseParam(productDetails: productDetails),
    );
    return state;
  }

  @override
  String get debugLabel => 'BuyAction(${item.name})';
}
