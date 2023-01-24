import "dart:math";

import 'package:localsend_app/gen/strings.g.dart';

String generateRandomAlias() {
  final random = Random();
  final adj = t.aliasGenerator.adjectives;
  final fruits = t.aliasGenerator.fruits;
  return "${adj[random.nextInt(adj.length)]} ${fruits[random.nextInt(fruits.length)]}";
}
