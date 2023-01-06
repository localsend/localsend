import 'dart:math';

const _adj = ['Big', 'Cool', 'Clever', 'Cute', 'Fast', 'Good', 'Great', 'Hot', 'Nice', 'Smart', 'Strong'];

const _fruit = [
  'Apple',
  'Avocado',
  'Banana',
  'Blackberry',
  'Blueberry',
  'Cherry',
  'Coconut',
  'Grape',
  'Lemon',
  'Mango',
  'Melon',
  'Orange',
  'Papaya',
  'Peach',
  'Pear',
  'Pineapple',
  'Raspberry',
  'Strawberry',
  'Tomato',
];

String generateRandomAlias() {
  final random = Random();
  return '${_adj[random.nextInt(_adj.length)]} ${_fruit[random.nextInt(_adj.length)]}';
}
