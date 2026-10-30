import 'package:collection/collection.dart';
import 'package:localsend_app/model/send_order.dart';

/// Equally sized files keep their selection order.
/// [mergeSort] is used because [List.sort] is not stable for more than 32 elements.
List<T> sortBySendOrder<T>(List<T> files, SendOrder sendOrder, int Function(T file) resolveSize) {
  final Comparator<T> compare;
  switch (sendOrder) {
    case SendOrder.selection:
      return files;
    case SendOrder.smallestFirst:
      compare = (first, second) => resolveSize(first).compareTo(resolveSize(second));
    case SendOrder.largestFirst:
      compare = (first, second) => resolveSize(second).compareTo(resolveSize(first));
  }
  final sorted = [...files];
  mergeSort(sorted, compare: compare);
  return sorted;
}
