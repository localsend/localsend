
import 'dart:math';

const _adj = ['Fast', 'Slow', 'Big', 'Small', 'Good', 'Bad'];

const _fruit = ['Apple', 'Banana', 'Cherry', 'Coconut', 'Lemon', 'Orange'];

String generateRandomAlias() {
  final random = Random();
  return '${_adj[random.nextInt(_adj.length)]} ${_fruit[random.nextInt(_adj.length)]}';
}
