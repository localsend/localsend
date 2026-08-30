import 'package:collection/collection.dart';
import 'package:localsend_app/model/send_order.dart';

List<T> sortBySendOrder<T>(List<T> files, SendOrder sendOrder, int Function(T file) resolveSize) {
  if (sendOrder == SendOrder.smallestFirst) {
    return files.sorted((first, second) => resolveSize(first).compareTo(resolveSize(second)));
  }
  if (sendOrder == SendOrder.largestFirst) {
    return files.sorted((first, second) => resolveSize(second).compareTo(resolveSize(first)));
  }
  return files;
}
