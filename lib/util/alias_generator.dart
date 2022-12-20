import 'dart:math';

const _adj = ['Big', 'Cool', 'Clever', 'Cute', 'Fast', 'Good', 'Great', 'Hot', 'Nice', 'Smart', 'Strong'];

const _fruit = [
  'Apple',
  'Avocado',
  'Banana',
  'Blueberry',
  'Cherry',
  'Coconut',
  'Grape',
  'Lemon',
  'Mango',
  'Melon',
  'Orange',
  'Pineapple',
  'Strawberry',
];

String generateRandomAlias() {
  final random = Random();
  return '${_adj[random.nextInt(_adj.length)]} ${_fruit[random.nextInt(_adj.length)]}';
}
